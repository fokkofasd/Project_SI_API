using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models
{
    public class GoalChecklistModel
    {

        public int id { get; set; }

        [Required(ErrorMessage = "กรุณากรอกชื่อเป้าหมาย")]
        [Display(Name = "goalName")]
        public string goalName { get; set; }

        [Required(ErrorMessage = "กรุณากรอกคำอธิบาย")]
        [Display(Name = "description")]
        public string description { get; set; }


        [Display(Name = "startDate")]
        public DateTime startDate { get; set; }

        [Display(Name = "endDate")]
        public DateTime endDate { get; set; }


       // [Required(ErrorMessage = "กรุณาเลือกหมวดหมู่ของเป้าหมาย")]
        [Display(Name = "categoryID")]
        public int categoryID { get; set; }

       // [Required(ErrorMessage = "กรุณาเลือกรอบของเป้าหมาย")]
        [Display(Name = "circleID")]
        public int circleID { get; set; }

        [Display(Name = "userID")]
        public string userID { get; set; }

        public List<Checklist> checklistName { get; set; }
    }
  }