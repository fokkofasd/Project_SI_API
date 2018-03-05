using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.ComponentModel.DataAnnotations;

namespace ProjectSI_API.Models
{
    public class ChecklistProgressModel
    {

        public int id { get; set; }


        //[Required(ErrorMessage = "กรุณากรอกชื่อรอบการดำเนินงาน")]
        [Display(Name = "checklistProgress1")]
        public string checklistProgress1 { get; set; }


        //[Required(ErrorMessage = "กรุณากรอกระยะเวลา (เป็นจำนวนวัน)")]
        [Display(Name = "checklistID")]
        public int checklistID { get; set; }

        [Display(Name = "userID")]
        public int userID { get; set; }

        [Display(Name = "goalID")]
        public int goalID { get; set; }
    }
}
