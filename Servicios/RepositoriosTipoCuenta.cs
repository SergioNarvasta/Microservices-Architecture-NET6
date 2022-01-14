using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using PersonalFi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PersonalFi.Servicios
{
    public interface IRepositoriosTipoCuenta
    {

    }
    public class RepositoriosTipoCuenta: IRepositoriosTipoCuenta
    {
        public readonly string connectionString;
        public RepositoriosTipoCuenta(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public void Crear(TipoCuenta tipoCuenta)
        {
            using var connection = new SqlConnection(connectionString);
        }
    }
}
