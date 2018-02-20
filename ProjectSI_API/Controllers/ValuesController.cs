using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ProjectSI_API.Controllers
{
    [Authorize]
    public class ValuesController : ApiController
    {
        //SIEntities db = new SIEntities();
        // GET api/values
        //public circle Get()
        //{
            //circle aa = db.circles.FirstOrDefault();
            //return aa;

        //}

        private const string LocalLoginProvider = "Local";
        private ApplicationUserManager _userManager;

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? Request.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        // GET api/values/5
        public async System.Threading.Tasks.Task<string> GetAsync(int id)
        {
            IdentityUser user = await UserManager.FindByIdAsync("37f4597e-d742-4820-ab06-67b0802c3501");
            return user.Email;
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
