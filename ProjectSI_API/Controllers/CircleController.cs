﻿using ProjectSI_API.DAL;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;

namespace ProjectSI_API.Controllers
{
    [Authorize]
    [RoutePrefix("api/circle")]
    public class CircleController : ApiController
    {
        SIDBEntities _db = new SIDBEntities();

        [Route("create")]
        public async Task<IHttpActionResult> create(Models.CircleModel model)
        {
                if (!ModelState.IsValid)
                {
                    return Json(new { error = true, message = Models.ErrorMessage.getErrorMessage(ModelState) });
                }
                Boolean result = true;
                try
                {
                         Circle circle = new Circle();
                        circle.circleName = model.circleName;
                        circle.circleTime = model.circleTime;
                        circle.status = model.status;


                System.Web.HttpContext.Current.Application.Lock();
                     _db.Circle.Add(circle);
                    _db.SaveChanges();
                    System.Web.HttpContext.Current.Application.UnLock();
                }
                catch (Exception e)
                {
                    return Json(e.Message);
                }

                return Json(new { result = result });
            }

        [Route("update")]
        public async Task<IHttpActionResult> update(Models.CircleModel model)
        {
            if (!ModelState.IsValid)
            {
                return Json(new { error = true, message = Models.ErrorMessage.getErrorMessage(ModelState) });
            }
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                    DAL.Circle nowCircle = _db.Circle.Where(p => p.id == model.id).FirstOrDefault();
                    nowCircle.circleName = model.circleName;
                    nowCircle.circleTime = model.circleTime;
                    nowCircle.status = model.status;
                    _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("delete/{id}")]
        [HttpGet]
        public async Task<IHttpActionResult> delete(int id)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                    DAL.Circle circle = _db.Circle.Where(p => p.id == id).FirstOrDefault();
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


        [Route("isDuplicateName")]
        public async Task<IHttpActionResult> isDuplicateName(Models.CircleModel model)
        {
            Boolean result = true;
            System.Web.HttpContext.Current.Application.Lock();
                var circle = from m in _db.Circle where m.circleName == model.circleName select m;
                if (model.id != 0)
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
        public async Task<IHttpActionResult> getCircle(int circleId)
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

                var circle = from m in _db.Circle select
                new
                {
                        id = m.id,
                        circleName = m.circleName,
                        circleTime = m.circleTime,
                        status = m.status,
                     };
                if (model.circleName != null) {
                    circle = from m in circle where m.circleName.Contains(model.circleName) select m;
                }
                 if (model.circleTime != 0) {
                circle = from m in circle where  m.circleTime == model.circleTime select m;
            }
            if (model.status != 0)
                {
                    circle = from m in circle where m.status == model.status select m;
                }
            circle = from m in circle orderby m.circleName select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(circle);
        }

    }
}
