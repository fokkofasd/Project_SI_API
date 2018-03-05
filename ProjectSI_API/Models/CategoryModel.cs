using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models
{
    public class CategoryModel
    {
   
        public int id { get; set; }


        [Required(ErrorMessage = "กรุณากรอกชื่อหมวดหมู่")]
        [Display(Name = "categoryName")]
        public string categoryName { get; set; }

        [Display(Name = "status")]
        public int status { get; set; }
    }
}