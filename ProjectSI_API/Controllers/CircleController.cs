using Microsoft.AspNet.Identity;
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
    [RoutePrefix("api/circle")]
    public class CircleController : ApiController
    {
        SIDBEntities _db = new SIDBEntities();

        [Route("create")]
        public async Task<IHttpActionResult> create(DAL.Circle model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                    model.status = Models.Enum.STATUS_ACTIVE;
                    _db.Circle.Add(model);
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
        public async Task<IHttpActionResult> update(DAL.Circle model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                    DAL.Circle circle = _db.Circle.Where(p => p.id == model.id).FirstOrDefault();
                    circle.circleCode = model.circleCode;
                    circle.circleName = model.circleName;
                    circle.status = model.status;
                    _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("delete/{circleId}")]
        [HttpGet]
        public async Task<IHttpActionResult> delete(String circleId)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                    DAL.Circle circle = _db.Circle.Where(p => p.id == circleId).FirstOrDefault();
                    _db.Circle.Remove(circle);
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
        public async Task<IHttpActionResult> isDuplicateCode(Models.CircleModel model)
        {
            Boolean result = true;
            System.Web.HttpContext.Current.Application.Lock();
                var circle = from m in _db.Circle where m.circleCode == model.circleCode select m;
                if (model.id != null)
                {
                    circle = from m in circle where m.id != model.id select m;
                }
                    
                if (!circle.Any())
                {
                    result = false;
                }
            System.Web.HttpContext.Current.Application.UnLock();

            return Json(new { result = result });
        }

        [Route("isDuplicateName")]
        public async Task<IHttpActionResult> isDuplicateName(Models.CircleModel model)
        {
            Boolean result = true;
            System.Web.HttpContext.Current.Application.Lock();
                var circle = from m in _db.Circle where m.circleName == model.circleName select m;
                if (model.id != null)
                {
                    circle = from m in circle where m.id != model.id select m;
                }

                if (!circle.Any())
                {
                    result = false;
                }
            System.Web.HttpContext.Current.Application.UnLock();

            return Json(new { result = result });
        }

        [Route("getcircle/{circleId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getCircle(String circleId)
        {
            System.Web.HttpContext.Current.Application.Lock();
                DAL.Circle circle = _db.Circle.Where(p => p.id == circleId).FirstOrDefault();
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(circle);
        }

        [Route("search")]
        public async Task<IHttpActionResult> search(Models.CircleModel model)
        {
            System.Web.HttpContext.Current.Application.Lock();

                var circle = from m in _db.Circle select m;
                if (model.circleName != null) {
                    circle = from m in circle where m.circleName.Contains(model.circleName) select m;
                }
                if (model.circleCode != null)
                {
                    circle = from m in circle where m.circleCode.Contains(model.circleCode) select m;
                }
                if (model.status != null)
                {
                    circle = from m in circle where m.status == model.status select m;
                }
            circle = from m in circle orderby m.circleName select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(circle);
        }

    }
}
