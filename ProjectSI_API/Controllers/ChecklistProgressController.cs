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
    [RoutePrefix("api/checklistprogress")]
    public class ChecklistProgressController : ApiController
    {
        SIDBEntities _db = new SIDBEntities();

        [Route("create")]
        public async Task<IHttpActionResult> create(List<ChecklistProgress> model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                foreach (var checklistProgressModel in model)
                {
                    _db.ChecklistProgresses.Add(checklistProgressModel);
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
        public async Task<IHttpActionResult> update(List<ChecklistProgress> model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                foreach (var checklistProgressModel in model)
                {
                    DAL.ChecklistProgress checklistprogres = _db.ChecklistProgresses.Where(p => p.id == checklistProgressModel.id).FirstOrDefault();
                    checklistprogres.checklistProgress1 = checklistProgressModel.checklistProgress1;
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

        [Route("getchecklistprogress")]
        public async Task<IHttpActionResult> getchecklistProgress(ChecklistProgressModel model)
        {
            System.Web.HttpContext.Current.Application.Lock();
            var checklistProgress = from clp in _db.ChecklistProgresses
                                    where clp.Checklist.goalID.Equals(model.goalID) && 
                                    clp.userID.Equals(model.userID)
                                    select
                         new
                         {
                             clp.id,
                             clp.checklistProgress1,
                             clp.Checklist.checklistName,
                             clp.userID,
                             clp.checklistID
                         };
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(checklistProgress);
        }
    }
}
