using ProjectSI_API.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models
{
    public class EvaluationQuestionModel
    {

        public int id { get; set; }

        [Required(ErrorMessage = "กรุณากรอกชื่อแบบประเมิน")]
        [Display(Name = "evaluationName")]
        public string evaluationName { get; set; }

        [Required(ErrorMessage = "กรุณากรอกคำชี้แจง")]
        [Display(Name = "description")]
        public string description { get; set; }

        public List<Question> questions { get; set; }

        public List<UserType> UserTypes { get; set; }
    }
}