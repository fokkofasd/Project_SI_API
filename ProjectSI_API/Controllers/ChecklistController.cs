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
    [RoutePrefix("api/Checklist")]
    public class ChecklistController : ApiController
    {
        SIDBEntities _db = new SIDBEntities();

        [Route("create")]
        public async Task<IHttpActionResult> create(List<Checklist> model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                foreach (var checklistModel in model)
                {
                    _db.Checklists.Add(checklistModel);
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

        [Route("update")]
        public async Task<IHttpActionResult> update(List<Checklist> model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                foreach (var checklistModel in model)
                {
                    DAL.Checklist checklist = _db.Checklists.Where(p => p.id == checklistModel.id).FirstOrDefault();
                    checklist.checklistName = checklistModel.checklistName;
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

        [Route("delete/{checklistId}")]
        [HttpGet]
        public async Task<IHttpActionResult> delete(int checklistId)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                DAL.Checklist checklist = _db.Checklists.Where(p => p.id == checklistId).FirstOrDefault();
                _db.Checklists.Remove(checklist);
                _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("getchecklist/{goalId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getchecklist(int goalId)
        {
            System.Web.HttpContext.Current.Application.Lock();
            var checklist = from cl in _db.Checklists
                       where cl.goalID.Equals(goalId)
                       select new
                       {
                           id = cl.id,
                           checklistName = cl.checklistName,
                           goalID = cl.goalID
                       };
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(checklist);
        }
    }
}
