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

                    Session.Add("articuloSeleccionado", seleccionado);

                    txtId.InnerText = user;
                    txtImg.Src = seleccionado.Imagen;
                    txtCodigo.InnerText = seleccionado.Codigo;
                    txtNombre.InnerText = seleccionado.Nombre;
                    txtMaterial.InnerText = seleccionado.Material.Nombre;
                    txtCategoria.InnerText = seleccionado.Categoria.Nombre;
                    txtPrecio.InnerText = seleccionado.Precio.ToString();
                    txtDescripcion.InnerText = seleccionado.Descripcion;
                }
            }

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Coleccion.aspx", false);
        }

        protected void btnFavoritos_Click(object sender, EventArgs e)
        {
            string p = "p";
        }
    }
}