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
    public class UserController : ApiController
    {

        private const string LocalLoginProvider = "Local";
        private ApplicationUserManager _userManager;

        SIDBEntities _db = new SIDBEntities();

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

        private IHttpActionResult GetErrorResult(IdentityResult result)
        {
            if (result == null)
            {
                return InternalServerError();
            }

            if (!result.Succeeded)
            {
                if (result.Errors != null)
                {
                    foreach (string error in result.Errors)
                    {
                        ModelState.AddModelError("", error);
                    }
                }

                if (ModelState.IsValid)
                {
                    // No ModelState errors are available to send, so just return an empty BadRequest.
                    return BadRequest();
                }

                return BadRequest(ModelState);
            }

            return null;
        }

        public async Task<IHttpActionResult> create(UserModels model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var user = new ApplicationUser() { UserName = model.Email, Email = model.Email };

            IdentityResult result = await UserManager.CreateAsync(user, model.Password);

            if (!result.Succeeded)
            {
                return GetErrorResult(result);
            }

            AspNetUsers nowUser = _db.AspNetUsers.Where(p => p.Email == user.Email).First();
            DAL.User gen = new DAL.User();
            gen.userID = nowUser.Id;
            gen.personalID = model.personalID;
            gen.firstname = model.firstname;
            gen.lastname = model.lastname;
            gen.nickname = model.nickname;
            gen.email = model.Email;
            gen.role = model.role;
            gen.status = "1";

            _db.User.Add(gen);
            _db.SaveChanges();

            return Ok();
        }

    }
}
