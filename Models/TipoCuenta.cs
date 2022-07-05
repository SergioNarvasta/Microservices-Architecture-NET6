using PersonalFi.Validaciones;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PersonalFi.Models
{
    public class TipoCuenta /* : IValidatableObject*/
    {
        public int Id { get; set; }
        [Required(ErrorMessage ="El Campo {0} es requerido")]
        [StringLength(maximumLength:50,MinimumLength =3,ErrorMessage ="La longitud del campo{0} debe {2} y {1} caracteres")]
        [Display(Name ="Nombre del tipo cuenta")]
        [PrimeraLetraMayus]

        public string Nombre { get; set; }
        public int UsuarioId { get; set; }
        public int Orden { get; set; }

        //public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        //{
        //   if(Nombre != null && Nombre.Length > 0)
        //    {
        //        var primeraletra = Nombre[0].ToString();
        //        if(primeraletra != primeraletra.ToUpper())
        //        {
        //            yield return new ValidationResult("La primera letra debe ser mayuscula",
        //                new[] { nameof(Nombre) });
        //        }
        //    }
        //}
    }
}
