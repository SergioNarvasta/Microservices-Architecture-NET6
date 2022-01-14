using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PersonalFi.Models
{
    public class TipoCuenta
    {
        public int Id { get; set; }
        [Required(ErrorMessage ="El Campo Nombre es requerido")]
        public string Nombre { get; set; }
        public int UsuarioId { get; set; }
        public int Orden { get; set; }

    }
}
