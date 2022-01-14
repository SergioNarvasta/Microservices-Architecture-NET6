using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace PersonalFi.Validaciones
{
    public class PrimeraLetraMayusAttribute: ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value == null || string.IsNullOrEmpty(value.ToString())){
                return ValidationResult.Success;
            }
            var primeraletra = value.ToString()[0].ToString();
            if(primeraletra != primeraletra.ToUpper())
            {
                return new ValidationResult("La Primera letra debe ser mayuscula");
            }
            return ValidationResult.Success;
        }
    }
}
