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
    [RoutePrefix("api/checklist")]
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

        [Route("getchecklists/{goalId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getchecklists(int goalId)
        {
            System.Web.HttpContext.Current.Application.Lock();
            string userId = User.Identity.GetUserId();
            var checklists = from cl in _db.Checklists
                             join clp in _db.ChecklistProgresses on cl.id equals clp.checklistID
                             join gh in _db.GoalHandlers on clp.goalHandlerID equals gh.id
                             where cl.goalID.Equals(goalId) && gh.userID.Equals(userId)
                             select new
                             {
                                 id = cl.id,
                                 checklistName = cl.checklistName,
                                 checklistProgress = clp.checklistProgress1,
                                 goalID = cl.goalID,
                                 goalHandlerID = gh.id
                             };
            //var checklists = from cl in _db.Checklists
            //                 join g in _db.Goals on cl.goalID equals g.id
            //                 join gh in _db.GoalHandlers on g.id equals gh.goalID
            //           where g.id.Equals(goalId) && gh.userID.Equals(userId)
            //           select new
            //           {
            //               id = cl.id,
            //               checklistName = cl.checklistName,
            //               goalID = cl.goalID
            //           };
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(checklists);
        }
    }
}
