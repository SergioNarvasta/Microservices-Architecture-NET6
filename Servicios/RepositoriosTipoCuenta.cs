using Dapper;
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
        void Crear(TipoCuenta tipoCuenta);
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
            var id = connection.QuerySingle <int> ($@"INSERT INTO TipoCuenta(Nombre,UsuarioId,Orden)
                                                     VALUES(@Nombre, @UsuarioId, 0);
                                                     SELECT SCOPE_IDENTITY();",tipoCuenta);
            tipoCuenta.Id = id;
        }
    }
}
