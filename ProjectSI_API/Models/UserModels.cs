using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models
{
    public class UserModels
    {
        [Required(ErrorMessage = "กรุณากรอกรหัสประจำตัว")]
        [Display(Name = "personalID")]
        public string personalID { get; set; }

        [Required]
        [Display(Name = "firstname")]
        public string firstname { get; set; }

        [Required]
        [Display(Name = "lastname")]
        public string lastname { get; set; }

        public string nickname { get; set; }

        [Required(ErrorMessage = "Please enter how many Stream Entries are displayed per page.")]
        [Display(Name = "userType")]
        public Nullable<int> userTypeID { get; set; }

        public string commanderID { get; set; }

        [Required]
        public Nullable<int> status { get; set; }

        public string userID { get; set; }

        [Required]
        [Display(Name = "Email")]
        public string email { get; set; }

        //[Required]
        //[StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 8)]
        //[DataType(DataType.Password)]
        [Display(Name = "password")]
        public string Password { get; set; }

        ////[DataType(DataType.Password)]
        //[Display(Name = "Confirm password")]
        //[Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        //public string ConfirmPassword { get; set; }
    }
}