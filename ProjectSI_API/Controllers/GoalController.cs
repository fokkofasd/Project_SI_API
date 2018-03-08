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
    [RoutePrefix("api/goal")]
    public class GoalController : ApiController
    {
        SIDBEntities _db = new SIDBEntities();

        [Route("create")]
        public async Task<IHttpActionResult> create(Models.GoalChecklistModel model)
        {
            if (!ModelState.IsValid)
            {
                return Json(new { error = true, message = Models.ErrorMessage.getErrorMessage(ModelState) });
            }
            Boolean result = true;
            string[] date = model.startDate.Split('/');
            try
            {
                Goal goal = new Goal();
                goal.goalName = model.goalName;
                goal.description = model.description;
                goal.startDate = DateTime.Parse(date[1] + "/" + date[0] + "/" + ( Convert.ToInt32(date[2])+543));
                goal.endDate = model.endDate;
                goal.categoryID = model.categoryID;
                goal.circleID = model.circleID;
                goal.userID = User.Identity.GetUserId();

                System.Web.HttpContext.Current.Application.Lock();
                _db.Goal.Add(goal);
                int isSave = _db.SaveChanges();
                if (isSave == 1)
                {
                    Goal g = _db.Goal.Where(p => p.goalName == model.goalName).FirstOrDefault();
                    List<Checklist> cList = new List<Checklist>();
                    foreach (var c in model.checklists)
                    {
                        Checklist checklist = new Checklist();
                        checklist.checklistName = c.value;
                        checklist.goalID = g.id;
                        cList.Add(checklist);
                    }
                    _db.Checklist.AddRange(cList);
                    _db.SaveChanges();

                }
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }

            return Json(new { result = result });
        }

        [Route("update")]
        public async Task<IHttpActionResult> update(DAL.Goal model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                DAL.Goal goal = _db.Goal.Where(p => p.id == model.id).FirstOrDefault();
                goal.goalName = model.goalName;
                goal.description = model.description;
                goal.startDate = model.startDate;
               // goal.endDate = model.endDate;
                goal.categoryID = model.categoryID;
                goal.circleID = model.circleID;
                _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("delete/{goalId}")]
        [HttpGet]
        public async Task<IHttpActionResult> delete(int goalId)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                DAL.Goal goal = _db.Goal.Where(p => p.id == goalId).FirstOrDefault();
                _db.Goal.Remove(goal);
                _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("search")]
        public async Task<IHttpActionResult> search(DAL.Goal model)
        {
            System.Web.HttpContext.Current.Application.Lock();

            var Goal = from m in _db.Goal
                             select
                new
                     {
                        goalName = m.goalName,
                        description = m.description,
                        categoryID = m.categoryID,
                        circleID = m.circleID,
                        startDate = m.startDate,
                        endDate = m.endDate
                    };
            if (model.goalName != null)
            {
                Goal = from m in Goal where m.goalName.Contains(model.goalName) select m;
            }

            Goal = from m in Goal orderby m.goalName select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(Goal);
        }

        [Route("getgoal/{userId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getGoal(string userId)
        {
            System.Web.HttpContext.Current.Application.Lock();
            var goal = from g in _db.Goal
                       where g.userID.Equals(userId)
                       select new
                       {
                           goalName = g.goalName,
                           description = g.description,
                           startDate = g.startDate,
                           endDate = g.endDate,
                           circleID = g.circleID,
                           categoryID = g.categoryID,
                           categoryName = g.Category.categoryName,
                           circleName = g.Circle.circleName
                       };
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(goal);
        }

        [Route("getGoalByCategoryName/{userId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getGoalByCategoryName(string userId)
        {
            System.Web.HttpContext.Current.Application.Lock();
            //DAL.Goal goal = _db.Goals.Where(p => p.userID == userId).FirstOrDefault();
            var goal = from g in _db.Goal
                       where g.userID.Equals(userId)
                       select new
                       {
                           goalName = g.goalName,
                           description = g.description,
                           startDate = g.startDate,
                           endDate = g.endDate,
                           circleID = g.circleID,
                           categoryID = g.categoryID,
                           categoryName = g.Category.categoryName,
                           circleName = g.Circle.circleName
                       };

            goal = from m in goal orderby m.categoryName select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(goal);
        }

        [Route("getGoalByCircleyName/{userId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getGoalByCircleName(string userId)
        {
            System.Web.HttpContext.Current.Application.Lock();
            var goal = from g in _db.Goal
                       where g.userID.Equals(userId)
                       select new
                       {
                           goalName = g.goalName,
                           description = g.description,
                           startDate = g.startDate,
                           endDate = g.endDate,
                           circleID = g.circleID,
                           categoryID = g.categoryID,
                           categoryName = g.Category.categoryName,
                           circleName = g.Circle.circleName
                       };

            goal = from m in goal orderby m.circleName select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(goal);
        }

        //[Route("getGoalByCommander/{userId}")]
        //[HttpGet]
        //public async Task<IHttpActionResult> getGoalByCommander(string userId)
        //{
        //    System.Web.HttpContext.Current.Application.Lock();
        //    //DAL.Goal goal = _db.Goals.Where(p => p.userID == userId).FirstOrDefault();
        //    var user = from u in _db.Users
        //               where u.userID.Equals(userId)
        //               select new
        //               {
        //                   userID = u.userID,
        //                   firstname = u.firstname,
        //                   lastname = u.lastname
        //               };
        //    var goal = from g in _db.Goals
        //               join cate in _db.Categories on g.id equals cate.id
        //               join cir in _db.Circles on g.id equals cir.id
        //               where g.userID.Contains(userId)
        //               orderby cir.circleTime
        //               select new
        //               {
        //                   goalName = g.goalName,
        //                   description = g.description,
        //                   startDate = g.startDate,
        //                   endDate = g.endDate,
        //                   categoryName = cate.categoryName,
        //                   circleName = cir.circleName
        //               };
        //    System.Web.HttpContext.Current.Application.UnLock();
        //    return Json(goal);
        //}
    }
}