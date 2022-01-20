using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using PersonalFi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SFP.Controllers
{
    public class TipoCuentaController : Controller
    {
        //private readonly string connectionString;

        public TipoCuentaController(/*IConfiguration configuration*/)
        {
            //connectionString = configuration.GetConnectionString("DefaultConnection");
        }
        public IActionResult Crear()
        { 
            //using(var connection = new SqlConnection(connectionString))
            //{
            //    var query = connection.Query("SELECT 1").FirstOrDefault();
            //}

            return View();
        }
        [HttpPost]
        public IActionResult Crear(TipoCuenta tipoCuenta)
        {
            if (!ModelState.IsValid)
            {
                return View(tipoCuenta);
            }
            return View();
        }
    }
}
