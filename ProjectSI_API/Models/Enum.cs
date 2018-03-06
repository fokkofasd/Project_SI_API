using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models
{
    public class Enum
    {
        public const int STATUS_ACTIVE = 1;
        public const int STATUS_INACTIVE = 2;
    }

    public class Question
    {
        public string id { get; set; }

        [Required(ErrorMessage = "กรุณากรอกคำถาม")]
        [Display(Name = "questions")]
        public string value { get; set; }
    }

    public class Checklist
    {
        public string id { get; set; }

        [Required(ErrorMessage = "กรุณากรอกรายการตรวจสอบ")]
        [Display(Name = "checklists")]
        public string value { get; set; }
    }
}