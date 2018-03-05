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

        [Required(ErrorMessage = "กรุณากรอกชื่อแบบประเมิน")]
        [Display(Name = "goalName")]
        public string evaluationName { get; set; }


        [Display(Name = "description")]
        public string description { get; set; }


        [Display(Name = "startDate")]
        public string startDate { get; set; }

        //[Display(Name = "endDate")]
        //public string endDate { get; set; }


        [Required(ErrorMessage = "กรุณาเลือกหมวดหมู่ของเป้าหมาย")]
        [Display(Name = "categoryID")]
        public int circleTime { get; set; }

        [Required(ErrorMessage = "กรุณาเลือกรอบของเป้าหมาย")]
        [Display(Name = "circleID")]
        public int circleID { get; set; }


        public List<Checklist> checklistName { get; set; }
    }
  }