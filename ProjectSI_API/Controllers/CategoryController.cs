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
    [RoutePrefix("api/category")]
    public class CategoryController : ApiController
    {
        SIDBEntities _db = new SIDBEntities();

        [Route("create")]
        public async Task<IHttpActionResult> create(DAL.Category model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                _db.Category.Add(model);
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
        public async Task<IHttpActionResult> update(DAL.Category model)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                DAL.Category category = _db.Category.Where(p => p.id == model.id).FirstOrDefault();
                category.categoryName = model.categoryName;
                category.status = model.status;
                _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

        [Route("delete/{id}")]
        [HttpGet]
        public async Task<IHttpActionResult> delete(int id)
        {
            Boolean result = true;
            try
            {
                System.Web.HttpContext.Current.Application.Lock();
                DAL.Category category = _db.Category.Where(p => p.id == id).FirstOrDefault();
                _db.Category.Remove(category);
                _db.SaveChanges();
                System.Web.HttpContext.Current.Application.UnLock();
            }
            catch (Exception e)
            {
                result = false;
            }

            return Json(new { result = result });
        }

  

        [Route("isDuplicateName")]
        public async Task<IHttpActionResult> isDuplicateName(DAL.Category model)
        {
            Boolean result = true;
            System.Web.HttpContext.Current.Application.Lock();
            var category = from m in _db.Category where m.categoryName == model.categoryName select m;
            if (model.id != 0)
            {
                category = from m in category where m.id != model.id select m;
            }

            if (!category.Any())
            {
                result = false;
            }
            System.Web.HttpContext.Current.Application.UnLock();

            return Json(new { result = result });
        }

        [Route("getcategory/{categoryId}")]
        [HttpGet]
        public async Task<IHttpActionResult> getCategory(int categoryId)
        {
            System.Web.HttpContext.Current.Application.Lock();
            DAL.Category category = _db.Category.Where(p => p.id == categoryId).FirstOrDefault();
            System.Web.HttpContext.Current.Application.UnLock();
            return Json(category);
        }

        [Route("search")]
        public async Task<IHttpActionResult> search(DAL.Category model)
        {
            System.Web.HttpContext.Current.Application.Lock();


            //var category = from m in _db.Categories select m;
            var category = from m in _db.Category select
                new
                {
                    id = m.id,
                    categoryName = m.categoryName,
                    status = m.status
                };
            if (model.categoryName != null)
            {
                category = from m in category where m.categoryName.Contains(model.categoryName) select m;
            }
            if (model.status != 0)
            {
                category = from m in category where m.status == model.status select m;
            }

            category = from m in category orderby m.categoryName select m;

            System.Web.HttpContext.Current.Application.UnLock();
            return Json(category);
        }

    }
}
