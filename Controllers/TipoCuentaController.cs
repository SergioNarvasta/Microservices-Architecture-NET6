using Microsoft.AspNetCore.Mvc;
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
    }
}
