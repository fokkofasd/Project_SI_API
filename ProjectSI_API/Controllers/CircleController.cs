using ProjectSI_API.DAL;
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
        public async Task<IHttpActionResult> create(Models.CircleAddModel model)
        {
                if (!ModelState.IsValid)
                {
                    return Json(new { error = true, message = Models.ErrorMessage.getErrorMessage(ModelState) });
                }
                Boolean result = true;
                try
                {
                         Circle circle = new Circle();

                foreach (var q in model.circles)
                {
                    DAL.Circle c = new DAL.Circle();
                    c.circleName = q.circleName;
                    c.startDate = q.startDate;
                    c.endDate = q.endDate;
                    c.semester = q.semester;
                    c.year = q.year;
                    c.status = q.status;

                    _db.Circles.Add(c);
                    _db.SaveChanges();


                }
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
                    DAL.Circle nowCircle = _db.Circles.Where(p => p.id == model.id).FirstOrDefault();
                    nowCircle.circleName = model.circleName;
                    nowCircle.startDate = model.startDate;
                    nowCircle.endDate = model.endDate;
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
                    DAL.Circle circle = _db.Circles.Where(p => p.id == id).FirstOrDefault();
                    _db.Circles.Remove(circle);
                    _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }


        [Route("CreateisDuplicateName")]
        public async Task<IHttpActionResult> CreateisDuplicateName(Models.CircleModel model)
        {
            Boolean result = false;

            var nowCircle = _db.Circles.Where(p => p.circleName == model.circleName).FirstOrDefault();
            if (nowCircle == null)
            {
                result = true;
            }

            return Json(new { result = result });
        }

        [Route("UpdateisDuplicateName")]
        public async Task<IHttpActionResult> UpdateisDuplicateName(Models.Circle model)
        {
            Boolean result = false;

            var nowCircle = _db.Circles.Where(p => p.circleName == model.circleName).FirstOrDefault();
            if (nowCircle == null || nowCircle.circleName == model.circleName)
            {
                result = true;
            }

            return Json(new { result = result });
        }

        [Route("getcircle/{circleId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getCircle(int circleId)
        {
            
            System.Web.HttpContext.Current.Application.Lock();
            DAL.Circle circle = _db.Circles.Where(p => p.id == circleId).FirstOrDefault();
            var circles = new {
                status = circle.status,
                circleName = circle.circleName,
                //startDate = circle.startDate,
                //endDate = circle.endDate,
                startDate = String.Format("{0:yyyy-MM-dd}", circle.startDate),
                endDate = String.Format("{0:yyyy-MM-dd}", circle.endDate)
            };
           
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(circles);
        }


        [Route("search")]
        public async Task<IHttpActionResult> search(DAL.Circle model)
        {
            System.Web.HttpContext.Current.Application.Lock();
                var circle = from m in _db.Circles
                             select
                new
                {
                        id = m.id,
                        circleName = m.circleName,
                        startDate = m.startDate,
                        endDate = m.endDate,
                        status = m.status
                     };
            if (model.circleName != null)
            {
                    circle = from m in circle where m.circleName.Contains(model.circleName) select m;
            }
            if (model.startDate != null )
            {
                circle = from m in circle where m.startDate == model.startDate select m;
            }
            if (model.endDate != null )
            {
                circle = from m in circle where m.endDate == model.endDate select m;
            }
            if (model.status != 0 )
            {
                 circle = from m in circle where m.status == model.status select m;
            }

            circle = from m in circle orderby m.circleName select m;

            //var circles = from m in circle orderby m.circleName select new
            //{
            //    startDate = m.startDate,
            //    endDate = m.endDate,
            //    startDate = String.Format("{0:dd-MM-yyyy}", m.startDate),
            //    endDate = String.Format("{0:dd-MM-yyyy}", m.endDate )
            //};

            //var circles_new = new {
            //    startDate = circle.,
            //    endDate = circle.endDate,
            //    startDate = String.Format("{0:yyyy-MM-dd}", circle.startDate),
            //    endDate = String.Format("{0:yyyy-MM-dd}", circle.endDate };


            System.Web.HttpContext.Current.Application.UnLock();
            return Json(circle);
        }

    }
}
