using Microsoft.AspNetCore.Mvc;
using PersonalFi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PersonalFi.Controllers
{
    public class TipoCuentaController : Controller
    {
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
