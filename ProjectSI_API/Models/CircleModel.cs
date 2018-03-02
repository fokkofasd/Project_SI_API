using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models
{
    public class CircleModel
    {
   
        public int id { get; set; }


        [Required(ErrorMessage = "กรุณากรอกชื่อรอบการดำเนินงาน")]
        [Display(Name = "circleName")]
        public string circleName { get; set; }


        [Required(ErrorMessage = "กรุณากรอกระยะเวลา (เป็นจำนวนวัน)")]
        [Display(Name = "circleTime")]
        public int circleTime { get; set; }

        [Display(Name = "status")]
        public int status { get; set; }
    }
}