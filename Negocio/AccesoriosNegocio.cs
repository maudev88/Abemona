﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;
using System.Configuration;

namespace Negocio
{
    public class AccesoriosNegocio
    {

        public List<Accesorio> listar(string id = "")
        {
            List<Accesorio> lista = new List<Accesorio>();

            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = ConfigurationManager.AppSettings["cadenaConexion"];
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "Select IdCategoria, IdMaterial, Precio, Imagen, Codigo, Descripcion, A.Id as Aidi, A.Nombre as Nombree, C.Nombre as Categoria, M.Nombre as Material from Accesorios A, Categorias C, Materiales M where C.Id = A.IdCategoria And M.Id = A.IdMaterial";

                if (id != "")
                    comando.CommandText += " and A.Id = " + id;

                comando.Connection = conexion;

                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Accesorio aux = new Accesorio();
                    aux.Id = (int)lector["Aidi"];
                    aux.Codigo = (string)lector["Codigo"];
                    aux.Nombre = (string)lector["Nombree"];
                    aux.IdCategoria = (int)lector["IdCategoria"];
                    aux.IdMaterial = (int)lector["IdMaterial"];
                    aux.Precio = (int)lector["Precio"];
                    if(!(lector["Imagen"] is DBNull))
                        aux.Imagen = (string)lector["Imagen"];
                    aux.Material = new Elemento();
                    aux.Material.Nombre = (string)lector["Material"];
                    aux.Categoria = new Elemento();
                    aux.Categoria.Nombre = (string)lector["Categoria"];
                    aux.Descripcion = (string)lector["Descripcion"];

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

        public List<Elemento> ObtenerCategorias()
        {
            List<Elemento> categorias = new List<Elemento>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT Id, Nombre FROM CATEGORIAS";
                datos.setearConsulta(consulta);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Elemento categoria = new Elemento();
                    categoria.Id = (int)datos.Lector["Id"];
                    categoria.Nombre = (string)datos.Lector["Nombre"];
                    categorias.Add(categoria);
                }
                return categorias;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Elemento> ObtenerMateriales()
        {
            List<Elemento> materiales = new List<Elemento>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT Id, Nombre FROM MATERIALES";
                datos.setearConsulta(consulta);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Elemento material = new Elemento();
                    material.Id = (int)datos.Lector["Id"];
                    material.Nombre = (string)datos.Lector["Nombre"];
                    materiales.Add(material);
                }
                return materiales;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Accesorio> FiltrarBusqueda(string campoSeleccionado, string criterioSeleccionado)
        {
            // Inicializar la lista donde se guardarán los artículos filtrados
            List<Accesorio> listaFiltrada = new List<Accesorio>();
            AccesoDatos datos = new AccesoDatos(); // Acceso a datos

            try
            {
                // Iniciar la consulta base
                string consulta = "SELECT IdCategoria, IdMaterial, Descripcion, Precio, Imagen, Codigo, A.Id as Aidi, A.Nombre as Nombree, C.Nombre as Categoria, M.Nombre as Material " +
                                  "FROM Accesorios A " +
                                  "INNER JOIN Categorias C ON C.Id = A.IdCategoria " +
                                  "INNER JOIN Materiales M ON M.Id = A.IdMaterial ";

                // Filtrar por campo y criterio seleccionados
                bool whereAdded = false;

                if (campoSeleccionado == "Categoría")
                {
                    if (!string.IsNullOrEmpty(criterioSeleccionado))
                    {
                        consulta += "WHERE C.Nombre LIKE '%" + criterioSeleccionado + "%'"; // Filtro por categoría
                        whereAdded = true;
                    }
                }
                else if (campoSeleccionado == "Material")
                {
                    if (!string.IsNullOrEmpty(criterioSeleccionado))
                    {
                        if (whereAdded)
                        {
                            consulta += " AND M.Nombre LIKE '%" + criterioSeleccionado + "%'"; // Filtro por material
                        }
                        else
                        {
                            consulta += "WHERE M.Nombre LIKE '%" + criterioSeleccionado + "%'"; // Filtro por material
                            whereAdded = true;
                        }
                    }
                }

                // Establecer la consulta en el objeto de acceso a datos
                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Accesorio aux = new Accesorio();
                    aux.Id = (int)datos.Lector["Aidi"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombree"];
                    aux.IdCategoria = (int)datos.Lector["IdCategoria"];
                    aux.IdMaterial = (int)datos.Lector["IdMaterial"];
                    aux.Precio = (int)datos.Lector["Precio"];
                    if (!(datos.Lector["Imagen"] is DBNull))
                        aux.Imagen = (string)datos.Lector["Imagen"];
                    aux.Material = new Elemento();
                    aux.Material.Nombre = (string)datos.Lector["Material"];
                    aux.Categoria = new Elemento();
                    aux.Categoria.Nombre = (string)datos.Lector["Categoria"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];

                    listaFiltrada.Add(aux);
                }

                return listaFiltrada; // Retornar la lista filtrada
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void agregar(Accesorio nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Insert into Accesorios (Codigo, Nombre, Descripcion, IdMaterial, IdCategoria, Imagen, Precio) values (@Codigo, @Nombre, @Descripcion, @IdMaterial, @IdCategoria, @Imagen, @Precio)");
                datos.setearParametro("@Codigo", nuevo.Codigo);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Descripcion", nuevo.Descripcion);
                datos.setearParametro("@IdMaterial", nuevo.Material.Id);
                datos.setearParametro("@IdCategoria", nuevo.Categoria.Id);
                datos.setearParametro("@Imagen", nuevo.Imagen);
                datos.setearParametro("@Precio", nuevo.Precio);
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

        public void modificar (Accesorio acc)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Update Accesorios set Codigo = @Codigo, Nombre = @Nombre, Descripcion = @Descripcion, IdMaterial = @IdMaterial, IdCategoria = @IdCategoria, Imagen = @Imagen, Precio = @Precio Where Id = @Id");
                datos.setearParametro("@Codigo", acc.Codigo);
                datos.setearParametro("@Nombre", acc.Nombre);
                datos.setearParametro("@Descripcion", acc.Descripcion);
                datos.setearParametro("@IdMaterial", acc.Material.Id);
                datos.setearParametro("@IdCategoria", acc.Categoria.Id);
                datos.setearParametro("@Imagen", acc.Imagen);
                datos.setearParametro("@Precio", acc.Precio);
                datos.setearParametro("@Id", acc.Id);

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
                datos.setearConsulta("Delete from Accesorios where Id = @Id");
                datos.setearParametro("@Id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    }
}
