using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.IO;

namespace EmployeeApi.Filters
{
    public class CustomExceptionFilter : IExceptionFilter
    {
        public void OnException(ExceptionContext context)
        {
            var exceptionMessage = context.Exception.Message;
            File.AppendAllText("error_log.txt", exceptionMessage + "\n");
            
            context.Result = new ObjectResult("An internal server error occurred.") 
            { 
                StatusCode = 500 
            };
            context.ExceptionHandled = true;
        }
    }
}