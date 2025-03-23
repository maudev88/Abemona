using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Abemona
{
    public partial class Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                string user = Request.QueryString["id"].ToString();

                if (user != "" && !IsPostBack)
                {
                    AccesoriosNegocio negocio = new AccesoriosNegocio();
                    Accesorio seleccionado = (negocio.listar(user))[0];

                    Session.Add("accesorio", seleccionado);

                    txtId.InnerText = user;
                    txtImg.Src = seleccionado.Imagen;
                    txtCodigo.InnerText = seleccionado.Codigo;
                    txtNombre.InnerText = seleccionado.Nombre;
                    txtMaterial.InnerText = seleccionado.Material.Nombre;
                    txtCategoria.InnerText = seleccionado.Categoria.Nombre;
                    txtPrecio.InnerText = seleccionado.Precio.ToString();
                    txtDescripcion.InnerText = seleccionado.Descripcion;

                    esFavorito();
                }
            }

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Coleccion.aspx", false);
        }







        //AGREGADO LUCIANO FAVORITOS

        List<int> lstFavoritos = new List<int> { };

        protected void btnFavorito_Command(object sender, CommandEventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {


                AccesoriosNegocio negocio = new AccesoriosNegocio();

                // Obtener el ID de la persona desde la sesión
                Usuario persona = (Usuario)Session["usuario"];
                int idPersona = (int)persona.Id;

                // Obtener el ID del articulo desde la sesión
                Accesorio accesorio = (Accesorio)Session["accesorio"];
                int idAccesorio = (int)accesorio.Id;


                if (idPersona != 0)
                {
                    // Obtener los IDs de los artículos favoritos del usuario
                    lstFavoritos = negocio.IDsFavoritos(idPersona);
                }

                // Si ya es favorito, negocio.eliminar
                if (lstFavoritos.Contains(idAccesorio))
                {
                    negocio.eliminarFav(idAccesorio, idPersona);
                }
                else
                    negocio.agregarFav(idAccesorio, idPersona);


                // Recargo la página
                //Response.Redirect(Request.RawUrl, false);
                //Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                lblError.Text = "Debes iniciar sesión.";
            }

           
        }

        protected bool esFavorito()
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {

                AccesoriosNegocio negocio = new AccesoriosNegocio();

                Usuario persona = (Usuario)Session["usuario"];
                int idPersona = (int)persona.Id;

                Accesorio articulo = (Accesorio)Session["accesorio"];
                int idArticulo = (int)articulo.Id;

                lstFavoritos = negocio.IDsFavoritos(idPersona);

                bool esFavorito = lstFavoritos.Contains(idArticulo);
                return esFavorito;
            }
            else
            {
                return false;
            }
        }
    }
}