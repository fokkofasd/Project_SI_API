using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models
{
    public class graphCommanderModel
    {
        public string studentName { get; set; }
        public double percentAverage { get; set; }

        public graphCommanderModel(string studentName, double percentAverage)
        {
            this.studentName = studentName;
            this.percentAverage = percentAverage;
        }
    }
}