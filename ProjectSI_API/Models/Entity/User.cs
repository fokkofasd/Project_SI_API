using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models.Entity
{
    public class User
    {
        public int userID { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        //public DateTime EnrollmentDate { get; set; }

        // use ICollection<..> if a navigation property can hold multiple entities
        public Goal goals { get; set; }
    }
}