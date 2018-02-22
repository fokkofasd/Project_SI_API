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
    }
}
