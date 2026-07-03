using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using EmployeeApi.Models;
using EmployeeApi.Filters;
using System;
using System.Collections.Generic;
using System.Linq;

namespace EmployeeApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    // [CustomAuthFilter] // Replaced with JWT Authorize
    [Authorize(Roles = "Admin, POC")]
    public class EmpController : ControllerBase
    {
        private static List<Employee> _employees = new List<Employee>
        {
            new Employee { Id = 1, Name = "John", Salary = 5000, Permanent = true },
            new Employee { Id = 2, Name = "Jane", Salary = 6000, Permanent = false }
        };

        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(500)]
        public ActionResult<List<Employee>> GetStandard()
        {
            // Throw exception for filter testing
            // throw new Exception("Testing custom exception filter");
            return Ok(_employees);
        }

        [HttpPut("{id}")]
        public ActionResult<Employee> UpdateEmployee(int id, [FromBody] Employee empData)
        {
            if (id <= 0)
                return BadRequest("Invalid employee id");

            var emp = _employees.FirstOrDefault(e => e.Id == id);
            if (emp == null)
                return BadRequest("Invalid employee id");

            emp.Name = empData.Name;
            emp.Salary = empData.Salary;
            emp.Permanent = empData.Permanent;

            return Ok(emp);
        }
        
        [HttpPost]
        public ActionResult CreateEmployee([FromBody] Employee empData)
        {
            _employees.Add(empData);
            return Ok();
        }
    }
}