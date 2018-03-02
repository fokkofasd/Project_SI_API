﻿using ProjectSI_API.DAL;
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
        public async Task<IHttpActionResult> create(DAL.Goal model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                _db.Goals.Add(model);
                _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
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
                DAL.Goal goal = _db.Goals.Where(p => p.id == model.id).FirstOrDefault();
                goal.goalName = model.goalName;
                goal.description = model.description;
                goal.startDate = model.startDate;
                goal.endDate = model.endDate;
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
                DAL.Goal goal = _db.Goals.Where(p => p.id == goalId).FirstOrDefault();
                _db.Goals.Remove(goal);
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


            //var category = from m in _db.Categories select m;
            var goal = from g in _db.Goals
                       select new
                {
                    goalName = g.goalName,
                    description = g.description,
                    startDate = g.startDate,
                    endDate = g.endDate,
                    circleID = g.circleID,
                    categoryID = g.categoryID,
                    categoryName = g.Category.categoryName,
                    circleName = g.Circle.circleName,
                    userID = g.userID
                };
            if (model.goalName != null)
            {
                goal = from g in goal where g.goalName.Contains(model.goalName) && g.userID.Equals(model.userID) select g;
            }
            //if (model.status != 0)
            //{
            //    category = from m in category where m.status == model.status select m;
            //}

            goal = from m in goal orderby m.goalName select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(goal);
        }

        [Route("getgoal/{userId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getGoal(string userId)
        {
            System.Web.HttpContext.Current.Application.Lock();
            var goal = from g in _db.Goals
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
            var goal = from g in _db.Goals
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
            var goal = from g in _db.Goals
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