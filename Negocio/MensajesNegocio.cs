using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace Negocio
{
    public class MensajesNegocio
    {

        public List<Mensaje> listar(string id = "")
        {
            List<Mensaje> lista = new List<Mensaje>();
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = ConfigurationManager.AppSettings["cadenaConexion"];
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "Select Id, Nombre, Mail, Mensaje from Mensajes where 1 = 1";

                if (!string.IsNullOrEmpty(id))
                {
                    comando.CommandText += " AND Id = @Id";
                    comando.Parameters.AddWithValue("@Id", id); // Uso de parámetro para evitar inyección de SQL
                }

                comando.Connection = conexion;

                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Mensaje aux = new Mensaje();
                    aux.Id = (int)lector["Id"];
                    aux.Nombre = (string)lector["Nombre"];
                    aux.Mail = (string)lector["Mail"];
                    aux.Mensajee = (string)lector["Mensaje"];

                    lista.Add(aux);
                }

                conexion.Close();
                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void agregar(Mensaje nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Insert into Mensajes values (@nombre, @mail, @mensaje)");
                datos.setearParametro("nombre", nuevo.Nombre);
                datos.setearParametro("mail", nuevo.Mail);
                datos.setearParametro("mensaje", nuevo.Mensajee);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public void eliminar(int id)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("Delete from Mensajes where id = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
