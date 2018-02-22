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
    [RoutePrefix("api/user")]
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

        private IHttpActionResult duplicate()
        {
            ModelState.AddModelError("121", "duplicate");
            return BadRequest(ModelState);
        }

        [Route("create")]
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

            AspNetUser nowUser = _db.AspNetUsers.Where(p => p.Email == user.Email).First();
            DAL.User gen = new DAL.User();
            gen.userID = nowUser.Id;
            gen.personalID = model.personalID;
            gen.firstname = model.firstname;
            gen.lastname = model.lastname;
            gen.nickname = model.nickname;
            gen.role = model.role;
            gen.status = Models.Enum.STATUS_ACTIVE;

            _db.Users.Add(gen);
            _db.SaveChanges();

            return Ok();
        }

        [Route("update")]
        public async Task<IHttpActionResult> update(UserModels model)
        {
            //if (!ModelState.IsValid)
            //{
            //    return BadRequest(ModelState);
            //}

            //var user = new ApplicationUser() { UserName = model.Email, Email = model.Email };

            //IdentityResult result = await UserManager.UpdateAsync(user);

            //if (!result.Succeeded)
            //{
            //    return GetErrorResult(result);
            //}

            DAL.User nowUser = _db.Users.Where(p => p.userID == model.userID).First();
            //DAL.User gen = new DAL.User();
            nowUser.firstname = model.firstname;
            nowUser.lastname = model.lastname;
            nowUser.nickname = model.nickname;
            nowUser.role = model.role;
            nowUser.status = model.status;
            
            _db.Users.Add(nowUser);
            _db.SaveChanges();

            return Ok();
        }

        [Route("delete")]
        public async Task<IHttpActionResult> delete(string id)
        {
            //if (!ModelState.IsValid)
            //{
            //    return BadRequest(ModelState);
            //}

            Boolean result = true;
            DAL.User nowUser = _db.Users.Where(p => p.userID == id).First();
            DAL.AspNetUser nowAccount = _db.AspNetUsers.Where(p => p.Id == id).First();
            if (nowUser != null && nowAccount != null)
            {
                try
                {
                    System.Web.HttpContext.Current.Application.Lock();
                    _db.Users.Remove(nowUser);
                    _db.SaveChanges();
                    nowUser = _db.Users.Where(p => p.userID == id).First();
                    _db.Users.Remove(nowUser);
                    _db.SaveChanges();

                    _db.AspNetUsers.Remove(nowAccount);
                    _db.SaveChanges();
                    System.Web.HttpContext.Current.Application.UnLock();
                }
                catch (Exception e)
                {
                    result = false;
                }
            }

            return Json(new { result = result });
        }

        [Route("isDuplicate")]
        public async Task<IHttpActionResult> isDuplicate(UserModels model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            DAL.User nowUser = _db.Users.Where(p => p.userID == model.userID).First();
            if (nowUser != null)
            {
                return duplicate();
            }

            return Ok();
        }

        [Route("getuser/{userId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getUser(string userId)
        {
            System.Web.HttpContext.Current.Application.Lock();
            DAL.User user = _db.Users.Where(p => p.userID == userId).FirstOrDefault();
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(user);
        }

        [Route("search")]
        public async Task<IHttpActionResult> search(UserModels model)
        {
            System.Web.HttpContext.Current.Application.Lock();

            var user = from m in _db.Users select m;
            if (model.firstname != null)
            {
                user = from m in user where m.firstname.Contains(model.firstname) select m;
            }
            if (model.lastname != null)
            {
                user = from m in user where m.lastname.Contains(model.lastname) select m;
            }
            if (model.status != 0)
            {
                user = from m in user where m.status == model.status select m;
            }
            user = from m in user orderby m.firstname select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(user);
        }
    }
}