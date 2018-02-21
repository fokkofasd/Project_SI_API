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
            DAL.Circle circle = _db.Circle.Where(p => p.id == model.id).FirstOrDefault();
            circle.circleCode = model.circleCode;
            circle.circleName = model.circleName;
            circle.status = model.status;
            _db.SaveChanges();

            return Ok();
        }

        [Route("delete/{circleId}")]
        [HttpGet]
        public async Task<IHttpActionResult> delete(String circleId)
        {
            DAL.Circle circle = _db.Circle.Where(p => p.id == circleId).FirstOrDefault();
            _db.Circle.Remove(circle);
            _db.SaveChanges();

            return Ok();
        }

        [Route("isDuplicate")]
        public Boolean isDuplicate(Models.CircleModel model)
        {
            Boolean result = true;
            DAL.Circle circle = _db.Circle.Where(p => p.circleCode == model.circleCode).FirstOrDefault();
            if (circle != null)
            {
                result = false;
            }

            return result;
        }

    }
}
