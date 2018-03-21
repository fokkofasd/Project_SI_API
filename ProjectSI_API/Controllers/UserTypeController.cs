using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
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
    [RoutePrefix("api/usertype")]
    public class UserTypeController : ApiController
    {

        private const string LocalLoginProvider = "Local";
        private ApplicationUserManager _userManager;

        SIDBEntities _db = new SIDBEntities();

        [Route("getUserType/{status}")]
        [HttpGet]
        public async Task<IHttpActionResult> getAllUserType(int status)
        {
            List<DAL.UserType> type = null;
            System.Web.HttpContext.Current.Application.Lock();
                type = _db.UserTypes.Where(p => p.status == status).ToList();
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(type);
        }

        [Route("search")]
        public async Task<IHttpActionResult> search(DAL.UserType model)
        {
            System.Web.HttpContext.Current.Application.Lock();


            //var category = from m in _db.Categories select m;
            var UserTypes = from ut in _db.UserTypes
                            select
                            new
                            {
                                UserTypeId = ut.UserTypeId,
                                UserTypeName = ut.UserTypeName,
                                status = ut.status
                            };
            if (model.UserTypeName != null)
            {
                UserTypes = from ut in UserTypes where ut.UserTypeName.Contains(model.UserTypeName) select ut;
            }
            if (model.status != 0)
            {
                UserTypes = from ut in UserTypes where ut.status == model.status select ut;
            }

            UserTypes = from ut in UserTypes orderby ut.UserTypeName select ut;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(UserTypes);
        }
    }
}
