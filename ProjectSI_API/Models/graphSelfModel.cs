using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models
{
    public class graphSelfModel
    {
        public string goalName { get; set; }
        public double percent { get; set; }

        public graphSelfModel(string goalName, double percent)
        {
            this.goalName = goalName;
            this.percent = percent;
        }
    }
}