using ProjectSI_API.DAL;
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
                Evaluation eval = new Evaluation();
                eval.evaluationName = model.evaluationName;
                eval.description = model.description;

                System.Web.HttpContext.Current.Application.Lock();
                _db.Evaluations.Add(eval);
                int isSave = _db.SaveChanges();
                if (isSave == 1)
                {
                    Evaluation e = _db.Evaluations.Where(p => p.evaluationName == model.evaluationName).FirstOrDefault();
                    List<Question> qList = new List<Question>();
                    foreach (var q in model.questions)
                    {
                        Question quest = new Question();
                        quest.question1 = q.value;
                        quest.evaluationID = e.id;
                        qList.Add(quest);
                    }
                    _db.Questions.AddRange(qList);
                    _db.SaveChanges();
                    
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
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                DAL.Evaluation evaluation = _db.Evaluations.Where(p => p.id == model.id).FirstOrDefault();
                evaluation.evaluationName = model.evaluationName;
                evaluation.description = model.description;
                int isSave = _db.SaveChanges();
                if (isSave == 1)
                {
                    Evaluation e = _db.Evaluations.Where(p => p.evaluationName == model.evaluationName).FirstOrDefault();
                    List<Question> qList = new List<Question>();
                    foreach (var q in model.questions)
                    {
                        Question quest = new Question();
                        quest.question1 = q.value;
                        quest.evaluationID = e.id;
                        qList.Add(quest);
                    }
                    _db.Questions.AddRange(qList);
                    _db.SaveChanges();

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
                var questions = from q in _db.Questions where q.evaluationID == evaluationId select q;
                foreach (var question in questions)
                {
                    DAL.Question ques = _db.Questions.Where(p => p.id == question.id).FirstOrDefault();
                    _db.Questions.Remove(ques);
                }

                DAL.Evaluation evaluation = _db.Evaluations.Where(p => p.id == evaluationId).FirstOrDefault();
                _db.Evaluations.Remove(evaluation);
                _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("isDuplicateName")]
        public async Task<IHttpActionResult> isDuplicateName(DAL.Evaluation model)
        {
            Boolean result = true;
            System.Web.HttpContext.Current.Application.Lock();
            var evaluation = from m in _db.Evaluations where m.evaluationName == model.evaluationName select m;
            if (model.id != 0)
            {
                evaluation = from m in evaluation where m.id != model.id select m;
            }

            if (!evaluation.Any())
            {
                result = false;
            }
            System.Web.HttpContext.Current.Application.UnLock();

            return Json(new { result = result });
        }

        [Route("getevaluation/{evaluationId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getevaluation(int evaluationId)
        {
            System.Web.HttpContext.Current.Application.Lock();
            DAL.Evaluation evaluation = _db.Evaluations.Where(p => p.id == evaluationId).FirstOrDefault();
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(evaluation);
        }

        [Route("search")]
        public async Task<IHttpActionResult> search(DAL.Evaluation model)
        {
            System.Web.HttpContext.Current.Application.Lock();

            var evaluation = from m in _db.Evaluations select
                                new
                                {
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

