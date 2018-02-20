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

        private IHttpActionResult duplicate()
        {
            ModelState.AddModelError("121", "duplicate");
            return BadRequest(ModelState);
        }

        [Route("create")]
        public async Task<IHttpActionResult> create(DAL.Circle model)
        {
            model.status = "1";
            _db.Circles.Add(model);
            _db.SaveChanges();
            return Ok();
        }

        [Route("update")]
        public async Task<IHttpActionResult> update(DAL.Circle model)
        {
            DAL.Circle circle = _db.Circles.Where(p => p.id == model.id).FirstOrDefault();
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
            DAL.Circle circle = _db.Circles.Where(p => p.id == circleId).FirstOrDefault();
            _db.Circles.Remove(circle);
            _db.SaveChanges();

            return Ok();
        }

        [Route("isDuplicate")]
        public async Task<IHttpActionResult> isDuplicate(Models.Circle model)
        {
            DAL.Circle circle = _db.Circles.Where(p => p.circleCode == model.circleCode).FirstOrDefault();
            if (circle != null)
            {
                return duplicate();
            }

            return Ok();
        }

    }
}
