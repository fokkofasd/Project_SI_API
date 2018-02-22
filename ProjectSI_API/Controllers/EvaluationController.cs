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
        public async Task<IHttpActionResult> create(DAL.Evaluation model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                _db.Evaluation.Add(model);
                _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("update")]
        public async Task<IHttpActionResult> update(DAL.Evaluation model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                DAL.Evaluation evaluation = _db.Evaluation.Where(p => p.id == model.id).FirstOrDefault();
                evaluation.evaluationCode = model.evaluationCode;
                evaluation.evaluationName = model.evaluationName;
                evaluation.description = model.description;
                _db.SaveChanges();
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
                DAL.Evaluation evaluation = _db.Evaluation.Where(p => p.id == evaluationId).FirstOrDefault();
                _db.Evaluation.Remove(evaluation);
                _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("isDuplicateCode")]
        public async Task<IHttpActionResult> isDuplicateCode(DAL.Evaluation model)
        {
            Boolean result = true;
            System.Web.HttpContext.Current.Application.Lock();
            var evaluation = from m in _db.Evaluation where m.evaluationCode == model.evaluationCode select m;
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

        [Route("isDuplicateName")]
        public async Task<IHttpActionResult> isDuplicateName(DAL.Evaluation model)
        {
            Boolean result = true;
            System.Web.HttpContext.Current.Application.Lock();
            var evaluation = from m in _db.Evaluation where m.evaluationName == model.evaluationName select m;
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
            DAL.Evaluation evaluation = _db.Evaluation.Where(p => p.id == evaluationId).FirstOrDefault();
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(evaluation);
        }

        [Route("search")]
        public async Task<IHttpActionResult> search(DAL.Evaluation model)
        {
            System.Web.HttpContext.Current.Application.Lock();

            var evaluation = from m in _db.Evaluation select m;
            if (model.evaluationName != null)
            {
                evaluation = from m in evaluation where m.evaluationName.Contains(model.evaluationName) select m;
            }
            if (model.evaluationCode != null)
            {
                evaluation = from m in evaluation where m.evaluationCode.Contains(model.evaluationCode) select m;
            }

            evaluation = from m in evaluation orderby m.evaluationCode select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(evaluation);
        }

    }
}

