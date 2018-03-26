using ProjectSI_API.DAL;
using ProjectSI_API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace ProjectSI_API.Controllers
{
    [Authorize]
    [RoutePrefix("api/evaluation")]
    public class EvaluationController : ApiController
    {
        SIDBEntities _db = new SIDBEntities();

        [Route("create")]
        public async Task<IHttpActionResult> create(Models.EvaluationQuestionModel model)
        {
            if (!ModelState.IsValid)
            {
                return Json(new { error = true, message = Models.ErrorMessage.getErrorMessage(ModelState) });
            }
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();

                Evaluation eval = new Evaluation();
                eval.evaluationName = model.evaluationName;
                eval.description = model.description;

                _db.Evaluation.Add(eval);
                int isSave = _db.SaveChanges();
                if (isSave == 1)
                {
                    Evaluation e = _db.Evaluation.Where(p => p.evaluationName == model.evaluationName).FirstOrDefault();
                    foreach (var q in model.questions)
                    {
                        DAL.Question quest = new DAL.Question();
                        quest.question1 = q.value;
                        quest.evaluationID = e.id;

                        _db.Question.Add(quest);
                        _db.SaveChanges();

                        if (q.choices != null)
                        {
                            List<DAL.Choice> chList = new List<DAL.Choice>();
                            foreach (var ch in q.choices)
                            {
                                DAL.Question ques = _db.Question.Where(p => p.question1 == q.value && p.evaluationID == e.id).FirstOrDefault();
                                DAL.Choice choice = new DAL.Choice();
                                choice.choiceName = ch.value;
                                choice.questionID = ques.id;
                                chList.Add(choice);
                            }

                            _db.Choice.AddRange(chList);
                            _db.SaveChanges();
                        }

                    }
                }
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }

            return Json(new { result = result });
        }

        [Route("update")]
        public async Task<IHttpActionResult> update(Models.EvaluationQuestionModel model)
        {
            if (!ModelState.IsValid)
            {
                return Json(new { error = true, message = Models.ErrorMessage.getErrorMessage(ModelState) });
            }
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();

                var eval = _db.Evaluation.Where(p => p.id == model.id).FirstOrDefault();
                eval.evaluationName = model.evaluationName;
                eval.description = model.description;

                _db.SaveChanges();

                var questions = from q in _db.Question where q.evaluationID == eval.id select q;
                foreach (var ques in questions)
                {
                    //var choice = from ch in _db.Choice where ch.questionID == ques.id select ch;
                    //foreach (var choiceDelete in choice)
                    //{
                    //    _db.Choice.Remove(choiceDelete);
                    //}
                    _db.Question.Remove(ques);
                }

                _db.SaveChanges();

                foreach (var q in model.questions)
                {
                    DAL.Question quest = new DAL.Question();
                    quest.question1 = q.value;
                    quest.evaluationID = model.id;

                    _db.Question.Add(quest);
                    _db.SaveChanges();

                    //if (q.choices != null)
                    //{
                    //    List<DAL.Choice> chList = new List<DAL.Choice>();
                    //    foreach (var ch in q.choices)
                    //    {
                    //        DAL.Question ques = _db.Question.Where(p => p.question1 == q.value && p.evaluationID == model.id).FirstOrDefault();
                    //        DAL.Choice choice = new DAL.Choice();
                    //        choice.choiceName = ch.value;
                    //        choice.questionID = ques.id;
                    //        chList.Add(choice);
                    //    }

                    //    _db.Choice.AddRange(chList);
                    //    _db.SaveChanges();
                    //}

                }
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("delete/{evaluationId}")]
        [HttpGet]
        public async Task<IHttpActionResult> delete(int evaluationId)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                var eval = _db.Evaluation.Where(p => p.id == evaluationId).FirstOrDefault();
                var questions = from q in _db.Question where q.evaluationID == eval.id select q;
                foreach (var ques in questions)
                {
                    var choice = from ch in _db.Choice where ch.questionID == ques.id select ch;
                    foreach (var choiceDelete in choice)
                    {
                        _db.Choice.Remove(choiceDelete);
                    }
                    _db.Question.Remove(ques);
                }
                _db.Evaluation.Remove(eval);
                _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("isDuplicateNameCreate")]
        public async Task<IHttpActionResult> isDuplicateNameCreate(DAL.Evaluation model)
        {
            Boolean result = false;

            var nowEvaluation = _db.Evaluation.Where(p => p.evaluationName == model.evaluationName).FirstOrDefault();
            if (nowEvaluation == null)
            {
                result = true;
            }

            return Json(new { result = result });
        }


        [Route("isDuplicateNameUpdate")]
        public async Task<IHttpActionResult> isDuplicateNameUpdate(Models.EvaluationQuestionModel model)
        {
            Boolean result = false;

            var nowEvaluation = _db.Evaluation.Where(p => p.evaluationName == model.evaluationName).FirstOrDefault();
            if (nowEvaluation == null || nowEvaluation.evaluationName == model.evaluationName)
            {
                result = true;
            }

            return Json(new { result = result });
        }

        //[Route("isDuplicateName")]
        //public async Task<IHttpActionResult> isDuplicateName(DAL.Evaluation model)
        //{
        //    Boolean result = true;
        //    System.Web.HttpContext.Current.Application.Lock();
        //    var evaluation = from m in _db.Evaluations where m.evaluationName == model.evaluationName select m;
        //    if (model.id != 0)
        //    {
        //        evaluation = from m in evaluation where m.id != model.id select m;
        //    }

        //    if (!evaluation.Any())
        //    {
        //        result = false;
        //    }
        //    System.Web.HttpContext.Current.Application.UnLock();

        //    return Json(new { result = result });
        //}

        [Route("getevaluation/{evaluationId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getevaluation(int evaluationId)
        {
            System.Web.HttpContext.Current.Application.Lock();

            var evaluation = from eval in _db.Evaluation
                             where eval.id.Equals(evaluationId)
                             select new
                             {
                                 id = eval.id,
                                 evaluationName = eval.evaluationName,
                                 description = eval.description

                             };
            //Questions = eval.Questions.ToArray()
            //join q in _db.Questions on eval.id equals q.evaluationID
            //join 

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(evaluation);
        }

        [Route("search")]
        public async Task<IHttpActionResult> search(DAL.Evaluation model)
        {
            System.Web.HttpContext.Current.Application.Lock();

            var evaluation = from m in _db.Evaluation select
                                new
                                {
                                    id = m.id,
                                    evaluationName = m.evaluationName,
                                    description = m.description
                                };
                if (model.evaluationName != null)
                {
                    evaluation = from m in evaluation where m.evaluationName.Contains(model.evaluationName) select m;
                }

            evaluation = from m in evaluation orderby m.evaluationName select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(evaluation);
        }

    }
}

