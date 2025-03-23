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
    public class UsuarioNegocio
    {
        public void insertarUsuario(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Insert into Users (email, pass, admin) values (@email, @pass, 0)");
                datos.setearParametro("@email", nuevo.Email);
                datos.setearParametro("@pass", nuevo.Pass);
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

        public void actualizar(Usuario user)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Update Users set Imagen = @imagen, Nombre = @nombre, Apellido = @apellido Where Id = @Id");
                datos.setearParametro("@imagen", (object)user.Imagen ?? DBNull.Value);
                datos.setearParametro("@nombre", user.Nombre);
                datos.setearParametro("@apellido", user.Apellido);
                datos.setearParametro("@id", user.Id);
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

        public bool Login (Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id, email, pass, nombre, apellido, Imagen, Admin from Users Where email = @email And pass = @pass");
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@pass", usuario.Pass);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.Admin = (bool)datos.Lector["admin"];
                    if (!(datos.Lector["imagen"] is DBNull))
                        usuario.Imagen = (string)datos.Lector["imagen"];
                    if (!(datos.Lector["nombre"] is DBNull))
                        usuario.Nombre = (string)datos.Lector["nombre"];
                    if (!(datos.Lector["apellido"] is DBNull))
                        usuario.Apellido = (string)datos.Lector["apellido"];

                    return true;
                }
                return false;
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

        public int TraerId(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id from Users Where email = @email And pass = @pass");
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@pass", usuario.Pass);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                    usuario.Id = (int)datos.Lector["Id"];
                return usuario.Id;
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

        public List<Usuario> ObtenerUsuariosConMasFavoritos()
        {
            List<Usuario> listaUsuarios = new List<Usuario>();

            // Establecer conexión a la base de datos
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                // Cadena de conexión
                conexion.ConnectionString = ConfigurationManager.AppSettings["cadenaConexion"];

                // Comando SQL
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "SELECT " +
                                      "U.Id AS UsuarioId, " +
                                      "U.Nombre AS UsuarioNombre, " +
                                      "U.Apellido AS UsuarioApellido, " +
                                      "U.Email AS UsuarioEmail, " +
                                      "COUNT(F.IdAccesorio) AS CantidadFavoritos " +
                                      "FROM Users U " +
                                      "INNER JOIN Favoritos F ON U.Id = F.IdUser " +
                                      "GROUP BY U.Id, U.Nombre, U.Apellido, U.Email " +
                                      "ORDER BY CantidadFavoritos DESC";

                // Asignar la conexión al comando
                comando.Connection = conexion;

                // Abrir conexión
                conexion.Open();

                // Ejecutar el comando y obtener los resultados
                lector = comando.ExecuteReader();

                // Leer los resultados
                while (lector.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.Id = (int)lector["UsuarioId"];

                    // Verificar si el nombre está vacío o nulo y asignar valor predeterminado
                    usuario.Nombre = lector["UsuarioNombre"] != DBNull.Value ? (string)lector["UsuarioNombre"] : "Nombre no disponible";

                    // Verificar si el apellido está vacío o nulo y asignar valor predeterminado
                    usuario.Apellido = lector["UsuarioApellido"] != DBNull.Value ? (string)lector["UsuarioApellido"] : "Apellido no disponible";

                    // Verificar si el email está vacío o nulo y asignar valor predeterminado
                    usuario.Email = lector["UsuarioEmail"] != DBNull.Value ? (string)lector["UsuarioEmail"] : "Email no disponible";

                    usuario.CantFavoritos = (int)lector["CantidadFavoritos"];

                    listaUsuarios.Add(usuario);
                }

                // Cerrar la conexión
                conexion.Close();

                // Retornar la lista de usuarios
                return listaUsuarios;
            }
            catch (Exception ex)
            {
                // Manejo de excepciones: puedes registrar el error en un log o mostrar un mensaje más detallado.
                throw new Exception("Ocurrió un error al obtener los usuarios con más favoritos: " + ex.Message);
            }
        }




    }
}
