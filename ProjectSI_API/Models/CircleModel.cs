using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectSI_API.Models
{
    public class CircleModel
    {
        public int id { get; set; }
        public string circleCode { get; set; }
        public string circleName { get; set; }
        public int circleTime { get; set; }
        public int status { get; set; }
    }
}