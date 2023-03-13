

using EncuestasMacro.DTO;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace EncuestasMacro.Dat
{
    public class ClienteDat
    {
        private readonly IConfiguration _configuracion;
        public ClienteDat(IConfiguration configuration) => _configuracion = configuration;

        public DataTable ObtenerCliente(ReqGetCliente reqGetCliente)
        {
            SqlConnection conexion = new SqlConnection(_configuracion.GetConnectionString("ConnectionStrings"));

            try
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_buscar_clientes", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cedula", reqGetCliente.Cedula);

                var resultQuery = cmd.ExecuteNonQuery();
                DataTable tabla = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(tabla);

                return tabla;

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                conexion.Close();
            }


        }
    }
}
