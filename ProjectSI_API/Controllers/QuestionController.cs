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
    [RoutePrefix("api/question")]
    public class QuestionController : ApiController
    {
        SIDBEntities _db = new SIDBEntities();

        //[Route("create")]
        //public async Task<IHttpActionResult> create(List<Question> model)
        //{
        //    Boolean result = true;
        //    try
        //    {
        //        System.Web.HttpContext.Current.Application.Lock();
        //        foreach (var questionModel in model)
        //        {
        //            _db.Questions.Add(questionModel);
        //            _db.SaveChanges();
        //        }
        //        System.Web.HttpContext.Current.Application.UnLock();
        //    }
        //    catch (Exception e)
        //    {
        //        result = false;
        //    }

        //    return Json(new { result = result });
        //}

        //[Route("update")]
        //public async Task<IHttpActionResult> update(List<Question> model)
        //{
        //    Boolean result = true;
        //    try
        //    {
        //        System.Web.HttpContext.Current.Application.Lock();
        //        foreach (var questionModel in model)
        //        {
        //            DAL.Question question = _db.Questions.Where(p => p.id == questionModel.id).FirstOrDefault();
        //            question.question1 = questionModel.question1;
        //            _db.SaveChanges();
        //        }
        //        System.Web.HttpContext.Current.Application.UnLock();
        //    }
        //    catch (Exception e)
        //    {
        //        result = false;
        //    }

        //    return Json(new { result = result });
        //}

        //[Route("delete/{questionId}")]
        //public async Task<IHttpActionResult> delete(int questionId)
        //{
        //    Boolean result = true;
        //    try
        //    {
        //        System.Web.HttpContext.Current.Application.Lock();
        //        DAL.Question question = _db.Questions.Where(p => p.id == questionId).FirstOrDefault();
        //        _db.Questions.Remove(question);
        //        _db.SaveChanges();
        //        System.Web.HttpContext.Current.Application.UnLock();
        //    }
        //    catch (Exception e)
        //    {
        //        result = false;
        //    }

        //    return Json(new { result = result });
        //}

        [Route("isDuplicateNameCreate")]
        public async Task<IHttpActionResult> isDuplicateNameCreate(EvaluationQuestionModel model)
        {
            Boolean result = true;
            System.Web.HttpContext.Current.Application.Lock();
            foreach (var dupName in model.questions)
            {
                if (model != null)
                {
                    foreach (var dupName2 in model.questions)
                    {
                        if (dupName.value == dupName2.value)
                        {
                            result = false;
                            return Json(new { result = result });
                        }
                    }
                }
            }

            System.Web.HttpContext.Current.Application.UnLock();

            return Json(new { result = result });
        }

        [Route("getquestion/{evaluationId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getquestion(int evaluationId)
        {
            System.Web.HttpContext.Current.Application.Lock();

            var evaluation = from q in _db.Questions
                             where q.evaluationID.Equals(evaluationId)
                             select new
                             {
                                 id = q.id,
                                 question1 = q.question1,
                                 evaluationID = q.evaluationID

                             };
            //Questions = eval.Questions.ToArray()
            //join q in _db.Questions on eval.id equals q.evaluationID
            //join 

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(evaluation);
        }

        [Route("getchoice/{evaluationId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getchoice(int evaluationId)
        {
            System.Web.HttpContext.Current.Application.Lock();

            var evaluation = from q in _db.Questions
                             join ch in _db.Choices on q.id equals ch.questionID
                             where q.evaluationID.Equals(evaluationId)
                             select new
                             {
                                 id = ch.id,
                                 choiceName = ch.choiceName,
                                 questionID = q.id

                             };
            //Questions = eval.Questions.ToArray()
            //join q in _db.Questions on eval.id equals q.evaluationID
            //join 

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(evaluation);
        }
    }
}
