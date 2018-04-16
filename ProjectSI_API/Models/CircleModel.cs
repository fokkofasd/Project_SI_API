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

        //        [Required(ErrorMessage = "กรุณากรอกระยะเวลา (เป็นจำนวนวัน)")]
        //       [Range(1, int.MaxValue, ErrorMessage = "กรุณากรอกระยะเวลา (เป็นจำนวนวัน)")]
        //        [Display(Name = "circleTime")]
        //        public int circleTime { get; set; }



        // [DataType(DataType.Date, ErrorMessage = "Invalid Date")]
        //[RegularExpression(@"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$", ErrorMessage = "กรุณกรอกวันตามรูปแบบ ")]
        //[Required(ErrorMessage = "กรุณากรอกวันสิ้นสุดของเป้าหมาย")]
        [Display(Name = "startDate")]
        public DateTime startDate { get; set; }


        //  [DataType(DataType.Date, ErrorMessage = "Invalid Date")]
        // [RegularExpression(@"^([0]\d|[1][0-2])\/([0-2]\d|[3][0-1])\/([2][01]|[1][6-9])\d{2}(\s([0-1]\d|[2][0-3])(\:[0-5]\d){1,2})?$", ErrorMessage = "กรุณกรอกวันตามรูปแบบ ")]
        [Required(ErrorMessage = "กรุณากรอกวันสิ้นสุดของเป้าหมาย")]
        [Display(Name = "endDate")]
        public DateTime endDate { get; set; }

        [Display(Name = "status")]
        public int status { get; set; }
    }
}