using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace Abemona
{
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Accesorio> ListaAccesorios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Seguridad.sesionActiva(Session["usuario"]))
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Usuario usuario = (Usuario)Session["usuario"];
                    AccesoriosNegocio negocio = new AccesoriosNegocio();
                    ListaAccesorios = negocio.listarFavs(usuario.Id.ToString());


                    repRepetidor.DataSource = ListaAccesorios;
                    repRepetidor.DataBind();
                }
            }
        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;

            Response.Redirect("Detalle.aspx?id=" + valor, false);
        }
    }
}