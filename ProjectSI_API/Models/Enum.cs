﻿using System;
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
        public int id { get; set; }

        [Required(ErrorMessage = "กรุณากรอกคำถาม")]
        [Display(Name = "questions")]
        public string value { get; set; }

        public List<Choice> choices { get; set; }


    }

    public class Checklist
    {
        public string id { get; set; }

        [Required(ErrorMessage = "กรุณากรอกรายการตรวจสอบ")]
        [Display(Name = "checklists")]
        public string value { get; set; }
    }

    public class ChecklistPro
    {
        public int id { get; set; }
        public int checklistProgress1 { get; set; }
    }

    public class Choice
    {
        public string id { get; set; }

       // [Required(ErrorMessage = "กรุณากรอกตัวเลือก")]
       // [Display(Name = "choices")]
        public string value { get; set; }
    }

    public class UserType
    {
        //public int userTypeid { get; set; }
        public string userTypeName { get; set; }
    }

    public class Circle
    {
        public int id { get; set; }
        public string circleName { get; set; }
        public int status { get; set; }
        public DateTime startDate { get; set; }
        public DateTime endDate { get; set; }
        public int year { get; set; }
        public int semester { get; set; }

    }
}