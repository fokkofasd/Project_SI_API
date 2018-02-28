using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.ModelBinding;

namespace ProjectSI_API.Models
{
    public class ErrorMessage
    {
        public string key { get; set; }
        public string message { get; set; }

        public static List<ErrorMessage> getErrorMessage(ModelStateDictionary modelState)
        {
            int index = 0;
            var keys = modelState.Keys.ToArray();
            List<ErrorMessage> list = new List<ErrorMessage>();
            foreach (var val in modelState.Values)
            {
                ErrorMessage message = new ErrorMessage();
                var key = keys[index].Split('.');
                message.key = key[1];
                message.message = val.Errors[0].ErrorMessage;
                list.Add(message);
                index++;
            }
            return list;
        }
    }
}