using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models
{
    public class graphSelfModel
    {
        public string goalName { get; set; }
        public float percent { get; set; }

        public graphSelfModel(string goalName, float percent)
        {
            this.goalName = goalName;
            this.percent = percent;
        }
    }
}