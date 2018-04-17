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
using System.Web.Http.ModelBinding;

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
                return Json(new { error = true, message = Models.ErrorMessage.getErrorMessage(ModelState) });
            }

            var user = new ApplicationUser() { UserName = model.email, Email = model.email };

            IdentityResult result = await UserManager.CreateAsync(user, "password");

            if (!result.Succeeded)
            {
                return Json(GetErrorResult(result));
            }

            AspNetUsers nowUser = _db.AspNetUsers.Where(p => p.Email == user.Email).First();
            DAL.User gen = new DAL.User();
            gen.userID = nowUser.Id;
            gen.titleNameID = (int)model.titleNameID;
            gen.personalID = model.personalID;
            gen.firstname = model.firstname;
            gen.lastname = model.lastname;
            gen.userTypeID = (int)model.userTypeID;
            gen.commanderID = model.commanderID;
            gen.status = Models.Enum.STATUS_ACTIVE;

            _db.User.Add(gen);
            _db.SaveChanges();

            return Json(new { result = result });
        }

        [Route("update")]
        public async Task<IHttpActionResult> update(UserModels model)
        {
            if (!ModelState.IsValid)
            {

                return Json(new { error = true, message = Models.ErrorMessage.getErrorMessage(ModelState) });
            }
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                DAL.User nowUser = _db.User.Where(p => p.userID == model.userID).First();
                //DAL.User gen = new DAL.User();
                nowUser.titleNameID = (int)model.titleNameID;
                nowUser.personalID = model.personalID;
                nowUser.firstname = model.firstname;
                nowUser.lastname = model.lastname;
                nowUser.userTypeID = (int)model.userTypeID;
                nowUser.status = (int)model.status;
                nowUser.commanderID = model.commanderID;
                nowUser.personalID = model.personalID;


                _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("delete/{userId}")]
        [HttpGet]
        public async Task<IHttpActionResult> delete(string userId)
        {
            //if (!ModelState.IsValid)
            //{
            //    return BadRequest(ModelState);
            //}

            Boolean result = true;
            DAL.User nowUser = _db.User.Where(p => p.userID == userId).First();
            DAL.AspNetUsers nowAccount = _db.AspNetUsers.Where(p => p.Id == userId).First();
            if (nowUser != null && nowAccount != null)
            {
                try
                {
                    System.Web.HttpContext.Current.Application.Lock();
                    _db.User.Remove(nowUser);
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

        [Route("UpdateisDuplicatePersonalId")]
        public async Task<IHttpActionResult> UpdateisDuplicatePersonalId(UserModels model)
        {
            Boolean result = false;


            var nowUser = _db.User.Where(p => p.userID == model.userID).FirstOrDefault();

            if (nowUser == null || nowUser.personalID == model.personalID)
            {
                result = true;
            }
            
            return Json(new { result = result });
        }

        [Route("CreateisDuplicatePersonalId")]
        public async Task<IHttpActionResult> CreateisDuplicatePersonalId(UserModels model)
        {
            Boolean result = false;

            var nowUser = _db.User.Where(p => p.personalID == model.personalID).FirstOrDefault();
            if (nowUser == null)
            {
                result = true;
            }

            return Json(new { result = result });
        }


        [Route("isDuplicateEmail")]
        public async Task<IHttpActionResult> isDuplicateEmail(UserModels model)
        {
            Boolean result = false;

            var nowUser = _db.AspNetUsers.Where(p => p.Email == model.email).FirstOrDefault();
            if (nowUser == null)
            {
                result = true;
            }

            return Json(new { result = result });
        }

        [Route("getuser/{userId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getUser(string userId)
        {
            System.Web.HttpContext.Current.Application.Lock();
            DAL.User user = _db.User.Find(userId);
            DAL.AspNetUsers aspNetUser = _db.AspNetUsers.Find(userId);
            var daoUser = new
            {
                titleNameID = user.titleNameID,
                personalID = user.personalID,
                firstname = user.firstname,
                lastname = user.lastname,
                userTypeID = user.userTypeID,
                commanderID = user.commanderID,
                email = aspNetUser.Email,
                status = user.status
            };
            
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(daoUser);
        }

        [Route("search")]
        public async Task<IHttpActionResult> search(DAL.User model)
        {
            System.Web.HttpContext.Current.Application.Lock();
            
            var user = from u in _db.User
                       join aspUser in _db.AspNetUsers on u.userID equals aspUser.Id join TitleName in _db.TitleName on u.titleNameID equals TitleName.titleNameID
                       where u.userTypeID.Equals(model.userTypeID)
                       select
                new
                {
                    firstname = u.firstname,
                    lastname = u.lastname,
                    personalID = u.personalID,
                    userID = u.userID,
                    commanderID = u.commanderID,
                    status = u.status,
                    email = aspUser.Email,
                    userTypeID = u.userTypeID,
                    titleNameID = u.titleNameID,
                    titleName = TitleName.titleName1

           
                };
            if (model.firstname != null)
            {
                user = from m in user where m.firstname.Contains(model.firstname) select m;
            }
            if (model.commanderID != null)
            {
                user = from m in user where m.commanderID.Contains(model.commanderID) select m;
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

        [Route("getuserByCommanderId")]
        [HttpGet]
        public async Task<IHttpActionResult> getuserByCommanderId()
        {
            System.Web.HttpContext.Current.Application.Lock();
            var cmID = User.Identity.GetUserId();
            var usersinCM = from u in _db.User
                            join aspUser in _db.AspNetUsers on u.userID equals aspUser.Id
                       where u.commanderID.Equals(cmID)
                       select new
                       {
                           firstname = u.firstname,
                           lastname = u.lastname,
                           personalID = u.personalID,
                           email = aspUser.Email,
                           status = u.status,
                           userID = u.userID,
                           commanderID = u.commanderID,
                           userTypeID = u.UserType.UserTypeName
                       };
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(usersinCM);
        }

        [Route("getuserCommander")]
        [HttpGet]
        public async Task<IHttpActionResult> getuserCommander()
        {
            System.Web.HttpContext.Current.Application.Lock();
            var userCM = from u in _db.User
                         where u.userTypeID.Equals(2) || u.userTypeID.Equals(3)
                         select new
                            {
                                firstname = u.firstname,
                                lastname = u.lastname,
                                userID = u.userID,
                                UserTypeName = u.UserType.UserTypeName
                            };
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(userCM);
        }

        [Route("titleName")]
        public async Task<IHttpActionResult> titleName(DAL.TitleName model)
        {
            System.Web.HttpContext.Current.Application.Lock();

            var title = from t in _db.TitleName
                         select
            new
            {
                titleNameID = t.titleNameID,
                titleName1 = t.titleName1,
                status = t.status
            };
            if (model.titleName1 != null)
            {
                title = from t in title where t.titleName1.Contains(model.titleName1) select t;
            }
            if (model.status != 0)
            {
                title = from m in title where m.status == model.status select m;
            }
            title = from t in title orderby t.titleNameID select t;


            System.Web.HttpContext.Current.Application.UnLock();
            return Json(title);
        }

        [Route("getusersession")]
        [HttpGet]
        public async Task<IHttpActionResult> getusersession()
        {
            System.Web.HttpContext.Current.Application.Lock();
            var userID = User.Identity.GetUserId();
            var user = from u in _db.User
                           where u.userID.Equals(userID)
                           select new
                           {
                               firstname = u.firstname,
                               lastname = u.lastname,
                               UserTypeId = u.UserType.UserTypeId,
                               UserTypeName = u.UserType.UserTypeName
                           };
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(user);
        }

        //[Route("getuserbytab/{UserTypeId1}/{UserTypeId2}")]
        //[HttpGet]
        //public async Task<IHttpActionResult> getuserbytab(int UserTypeId1, int UserTypeId2)
        //{
        //    System.Web.HttpContext.Current.Application.Lock();
        //    var users = from u in _db.Users
        //                 join aspUser in _db.AspNetUsers on u.userID equals aspUser.Id
        //                 where u.userTypeID.Equals(UserTypeId1) || u.userTypeID.Equals(UserTypeId2)
        //                 orderby u.firstname
        //                select new
        //                 {
        //                     firstname = u.firstname,
        //                     lastname = u.lastname,
        //                     personalID = u.personalID,
        //                     userID = u.userID,
        //                     commanderID = u.commanderID,
        //                     status = u.status,
        //                     email = aspUser.Email,
        //                     userTypeID = u.userTypeID
        //                 };
        //    System.Web.HttpContext.Current.Application.UnLock();
        //    return Json(users);
        //}
    }
}