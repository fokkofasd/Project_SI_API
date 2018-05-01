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
            //string[] date = model.startDate.Split('/');
            try
            {
                Goal goal = new Goal();
                goal.goalName = model.goalName;
                goal.description = model.description;
                // goal.startDate = DateTime.Parse(date[1] + "/" + date[0] + "/" + ( Convert.ToInt32(date[2])+543));
                goal.startDate = model.startDate;
                goal.endDate = model.endDate;
                goal.categoryID = model.categoryID;
                goal.circleID = model.circleID;
                goal.userID = User.Identity.GetUserId();
                goal.circleType = model.circleType;

                System.Web.HttpContext.Current.Application.Lock();
                _db.Goals.Add(goal);
                int isSave = _db.SaveChanges();
                if (isSave == 1)
                {
                    Goal g = _db.Goals.Where(p => p.goalName == model.goalName).FirstOrDefault();
                    
                    List<Checklist> cList = new List<Checklist>();
                    foreach (var c in model.checklists)
                    {
                        Checklist checklist = new Checklist();
                        checklist.checklistName = c.value;
                        checklist.goalID = g.id;
                        cList.Add(checklist);
                    }
                    _db.Checklists.AddRange(cList);
                    _db.SaveChanges();

                    List<GoalHandler> ghList = new List<GoalHandler>();


                    if (model.users != null)
                    {
                        foreach (var u in model.users)
                        {
                            GoalHandler gh = new GoalHandler();
                            gh.userID = u;
                            gh.goalID = g.id;
                            _db.GoalHandlers.Add(gh);
                            _db.SaveChanges();

                            var c = from cl in _db.Checklists where cl.goalID.Equals(g.id) select cl;
                            List<ChecklistProgress> clpList = new List<ChecklistProgress>();
                            foreach (var clp in c)
                            {
                                ChecklistProgress checklistProgress = new ChecklistProgress();
                                checklistProgress.checklistProgress1 = 1;
                                checklistProgress.time = DateTime.Now;
                                checklistProgress.checklistID = clp.id;
                                checklistProgress.goalHandlerID = gh.id;
                                clpList.Add(checklistProgress);
                            }
                            _db.ChecklistProgresses.AddRange(clpList);
                        }
                    }
                    else
                    {
                        GoalHandler gh = new GoalHandler();
                        gh.userID = User.Identity.GetUserId();
                        gh.goalID = g.id;
                        _db.GoalHandlers.Add(gh);
                        _db.SaveChanges();

                        var c = from cl in _db.Checklists where cl.goalID.Equals(g.id) select cl;
                        List<ChecklistProgress> clpList = new List<ChecklistProgress>();
                        foreach (var clp in c)
                        {
                            ChecklistProgress checklistProgress = new ChecklistProgress();
                            checklistProgress.checklistProgress1 = 1;
                            checklistProgress.time = DateTime.Now;
                            checklistProgress.checklistID = clp.id;
                            checklistProgress.goalHandlerID = gh.id;
                            clpList.Add(checklistProgress);
                        }
                        _db.ChecklistProgresses.AddRange(clpList);
                    }

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
        public async Task<IHttpActionResult> update(Models.GoalChecklistModel model)
        {
            if (!ModelState.IsValid)
            {
                return Json(new { error = true, message = Models.ErrorMessage.getErrorMessage(ModelState) });
            }
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();

                var goal = _db.Goals.Where(p => p.id == model.id).FirstOrDefault();
                goal.goalName = model.goalName;
                goal.description = model.description;
                goal.startDate = model.startDate;
                goal.endDate = model.endDate;
                goal.categoryID = model.categoryID;
                goal.circleID = model.circleID;
                goal.userID = User.Identity.GetUserId();
                goal.circleType = model.circleType;

                System.Web.HttpContext.Current.Application.Lock();
                _db.SaveChanges();

                {
                    Goal g = _db.Goals.Where(p => p.id == model.id).FirstOrDefault();

                    var checklists = from cl in _db.Checklists where cl.goalID.Equals(g.id) select cl;
                    var checkused = 0;
                    foreach (var checklist in checklists)
                    {
                        var checklistPs = from clp in _db.ChecklistProgresses where clp.checklistID.Equals(checklist.id) select clp;

                        foreach (var checklistP in checklistPs)
                        {
                            if (checklistP.checklistProgress1 == 2)
                            {
                                checkused = 1;
                                break;
                            }
                        }
                    }
                    if (checkused == 0)
                    {

                        foreach (var checklist in checklists)
                        {
                            var checklistPs = from clp in _db.ChecklistProgresses where clp.checklistID.Equals(checklist.id) select clp;
                            foreach (var checklistP in checklistPs)
                            {
                                _db.ChecklistProgresses.Remove(checklistP);
                            }
                            _db.Checklists.Remove(checklist);
                        }

                        var goalHandlers = from gh in _db.GoalHandlers where gh.goalID.Equals(g.id) select gh;
                        foreach (var goalHandler in goalHandlers)
                        {
                            _db.GoalHandlers.Remove(goalHandler);
                        }
                        _db.SaveChanges();
                    }

                    List<Checklist> cList = new List<Checklist>();
     
                    foreach (var c in model.checklists)
                    {
                        Checklist checklist = new Checklist();
                        checklist.checklistName = c.value;
                        checklist.goalID = g.id;
                        cList.Add(checklist);
                    }
                    _db.Checklists.AddRange(cList);
                    _db.SaveChanges();

                    List<GoalHandler> ghList = new List<GoalHandler>();


                    if (model.users != null)
                    {
                        foreach (var u in model.users)
                        {
                            GoalHandler gh = new GoalHandler();
                            gh.userID = u;
                            gh.goalID = g.id;
                            _db.GoalHandlers.Add(gh);
                            _db.SaveChanges();

                            var c = from cl in _db.Checklists where cl.goalID.Equals(g.id) select cl;
                            List<ChecklistProgress> clpList = new List<ChecklistProgress>();
                            foreach (var clp in c)
                            {
                                ChecklistProgress checklistProgress = new ChecklistProgress();
                                checklistProgress.checklistProgress1 = 1;
                                checklistProgress.time = DateTime.Now;
                                checklistProgress.checklistID = clp.id;
                                checklistProgress.goalHandlerID = gh.id;
                                clpList.Add(checklistProgress);
                            }
                            _db.ChecklistProgresses.AddRange(clpList);
                        }
                    }
                    else
                    {
                        GoalHandler gh = new GoalHandler();
                        gh.userID = User.Identity.GetUserId();
                        gh.goalID = g.id;
                        _db.GoalHandlers.Add(gh);
                        _db.SaveChanges();

                        var c = from cl in _db.Checklists where cl.goalID.Equals(g.id) select cl;
                        List<ChecklistProgress> clpList = new List<ChecklistProgress>();
                        foreach (var clp in c)
                        {
                            ChecklistProgress checklistProgress = new ChecklistProgress();
                            checklistProgress.checklistProgress1 = 2;
                            checklistProgress.time = DateTime.Now;
                            checklistProgress.checklistID = clp.id;
                            checklistProgress.goalHandlerID = gh.id;
                            clpList.Add(checklistProgress);
                        }
                        _db.ChecklistProgresses.AddRange(clpList);
                    }

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

        [Route("delete/{goalid}")]
        [HttpGet]
        public async Task<IHttpActionResult> delete(int goalId)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();

                var checklists = from cl in _db.Checklists where cl.goalID.Equals(goalId) select cl;
                var checkused = 0;
                foreach (var checklist in checklists)
                {
                    var checklistPs = from clp in _db.ChecklistProgresses where clp.checklistID.Equals(checklist.id) select clp;
                    foreach (var checklistP in checklistPs)
                    {
                        if (checklistP.checklistProgress1 == 2)
                        {
                            checkused = 1;
                            break;
                        }
                    }
                }
                if (checkused == 0)
                {
                    
                    foreach (var checklist in checklists)
                    {
                        var checklistPs = from clp in _db.ChecklistProgresses where clp.checklistID.Equals(checklist.id) select clp;
                        foreach (var checklistP in checklistPs)
                        {
                            _db.ChecklistProgresses.Remove(checklistP);
                        }
                        _db.Checklists.Remove(checklist);
                    }

                    var goalHandlers = from gh in _db.GoalHandlers where gh.goalID.Equals(goalId) select gh;
                    foreach (var goalHandler in goalHandlers)
                    {
                        _db.GoalHandlers.Remove(goalHandler);
                    }

                    Goal goal = _db.Goals.Where(p => p.id == goalId).FirstOrDefault();
                    _db.Goals.Remove(goal);
                    _db.SaveChanges();
                }
                else
                {
                    result = false;
                }
                
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("searchbyself")]
        public async Task<IHttpActionResult> searchbyself(DAL.Goal model)
        {
            System.Web.HttpContext.Current.Application.Lock();

            var userId = User.Identity.GetUserId();
            var Goal = from gh in _db.GoalHandlers
                       join g in _db.Goals on gh.goalID equals g.id
                       where gh.userID.Equals(userId)
                       select
                new
                     {
                        id = g.id,
                        goalName = g.goalName,
                        description = g.description,
                        categoryID = g.categoryID,
                        circleID = g.circleID,
                        userName = g.User.firstname,
                        userLastName = g.User.lastname,
                        startDate = g.startDate,
                        endDate = g.endDate,
                        categoryName = g.Category.categoryName,
                        circleName = g.Circle.circleName,
                    //  circleTime = g.Circle.circleTime
                        circleType = g.circleType,
                        userID = g.userID
                };


            if (model.goalName != null)
            {
                Goal = from m in Goal where m.goalName.Contains(model.goalName) select m;
            }
            if (model.categoryID != 0)
            {
                Goal = from m in Goal where m.categoryID == model.categoryID select m;
            }
            if (model.circleID != 0)
            {
                Goal = from m in Goal where m.circleID == model.circleID select m;
            }
            Goal = from m in Goal orderby m.goalName select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(Goal);
        }

        [Route("searchbyCommander")]
        public async Task<IHttpActionResult> searchbyCommander(DAL.Goal model)
        {
            System.Web.HttpContext.Current.Application.Lock();

            var userId = User.Identity.GetUserId();
            var Goal = from g in _db.Goals
                       join gh in _db.GoalHandlers on g.id equals gh.goalID
                       where g.userID.Equals(userId) && gh.userID != userId
                       select
                new
                {
                    id = g.id,
                    goalName = g.goalName,
                    description = g.description,
                    categoryID = g.categoryID,
                    circleID = g.circleID,
                    userName = g.User.firstname,
                    userLastName = g.User.lastname,
                    startDate = String.Format("{0:yyyy-MM-dd}", g.startDate),
                    endDate = String.Format("{0:{yyyy-MM-dd}", g.endDate),
                    categoryName = g.Category.categoryName,
                    circleName = g.Circle.circleName,
                    //     circleTime = g.Circle.circleTime
                    circleType = g.circleType


                };
            if (model.goalName != null)
            {
                Goal = from m in Goal where m.goalName.Contains(model.goalName) select m;
            }
            if (model.categoryID != 0)
            {
                Goal = from m in Goal where m.categoryID == model.categoryID select m;
            }
            if (model.circleID != 0)
            {
                Goal = from m in Goal where m.circleID == model.circleID select m;
            }

            Goal = from m in Goal orderby m.goalName select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(Goal);
        }

        [Route("getgoal/{goalId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getGoal(int goalId)
        {
            System.Web.HttpContext.Current.Application.Lock();
            var goal = from g in _db.Goals
                       where g.id.Equals(goalId)
                       select new
                       {
                           id = g.id,
                           goalName = g.goalName,
                           description = g.description,
                           startDate = g.startDate,
                           endDate = g.endDate,
                           circleID = g.circleID,
                           categoryID = g.categoryID,
                           categoryName = g.Category.categoryName,
                           circleName = g.Circle.circleName,
                           circleType = g.circleType
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
                           circleName = g.Circle.circleName,
                           circleType = g.circleType
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
                           circleName = g.Circle.circleName,
                           circleType= g.circleType
                       };

            goal = from m in goal orderby m.circleName select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(goal);
        }

        [Route("isDuplicateNameCreate")]
        public async Task<IHttpActionResult> isDuplicateNameCreate(DAL.Goal model)
        {
            Boolean result = false;
            System.Web.HttpContext.Current.Application.Lock();
            var goal = _db.Goals.Where(p => p.goalName == model.goalName).FirstOrDefault();
            if (goal == null)
            {
                result = true;
            }

            System.Web.HttpContext.Current.Application.UnLock();

            return Json(new { result = result });
        }

        [Route("isDuplicateNameUpdate")]
        public async Task<IHttpActionResult> isDuplicateNameUpdate(DAL.Goal model)
        {
            Boolean result = false;
            System.Web.HttpContext.Current.Application.Lock();
            var goal = _db.Goals.Where(p => p.goalName == model.goalName).FirstOrDefault();
            if (goal == null || goal.goalName == model.goalName)
            {
                result = true;
            }
            System.Web.HttpContext.Current.Application.UnLock();

            return Json(new { result = result });
        }

        //[Route("getGoalByCommander/{userId}")]
        //[HttpGet]
        //public async Task<IHttpActionResult> getGoalByCommander(string userId)
        //{
        //    System.Web.HttpContext.Current.Application.Lock();
        //    DAL.Goal goal = _db.Goals.Where(p => p.userID == userId).FirstOrDefault();
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