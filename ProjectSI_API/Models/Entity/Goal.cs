using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models.Entity
{
    public class Goal
    {
        public int goalID { get; set; }
        public string goalName { get; set; }
        public string goalDescription { get; set; }
    }
}