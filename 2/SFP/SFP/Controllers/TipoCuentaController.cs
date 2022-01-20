using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using SFP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SFP.Servicios;
using PersonalFi.Models;

namespace SFP.Controllers
{
    public class TipoCuentaController : Controller
    {
        private IRepositoriosTipoCuenta repositoriosTipoCuenta;

        public TipoCuentaController(IRepositoriosTipoCuenta repositoriosTipoCuenta)
        {
            this.repositoriosTipoCuenta = repositoriosTipoCuenta;
        }
        public IActionResult Crear()
        {  
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
