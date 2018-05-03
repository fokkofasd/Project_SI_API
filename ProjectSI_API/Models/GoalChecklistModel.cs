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

        [Range(1, int.MaxValue, ErrorMessage = "กรุณาเลือกหมวดหมู่ของเป้าหมาย")]
        [Display(Name = "categoryID")]
        public int categoryID { get; set; }


        [Range(1, int.MaxValue, ErrorMessage = "กรุณาเลือกรูปแบบรอบการดำเนินงาน")]
        [Display(Name = "circleType")]
        public int circleType { get; set; }

        //[Required(ErrorMessage = "กรุณากรอกวันเริ่มต้นของเป้าหมาย")]
        //[RegularExpression(@"^([0]\d|[1][0-2])\/([0-2]\d|[3][0-1])\/([2][01]|[1][6-9])\d{2}(\s([0-1]\d|[2][0-3])(\:[0-5]\d){1,2})?$", ErrorMessage = "กรุณกรอกวันตามรูปแบบ ")]
        //[DataType(DataType.Date, ErrorMessage = "Invalid Date")]
        public DateTime startDate { get; set; }

        public DateTime endDate { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "กรุณาเลือกรอบการดำเนินงานของเป้าหมาย")]
        [Display(Name = "circleID")]
        public int circleID { get; set; }

        [Display(Name = "userID")]
        public string userID { get; set; }

        public String[] users { get; set; }

        public List<Checklist> checklists { get; set; }

        public List<ChecklistPro> checklistProgresses { get; set; }

        public int goalHandlerId { get; set; }

        public int flag { get; set; }
    }
  }