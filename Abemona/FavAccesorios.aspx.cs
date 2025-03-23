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
    public partial class Estadisticas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AccesoriosNegocio negocio = new AccesoriosNegocio();
                Session.Add("listaAccesorios", negocio.cantidadFavoritos());
                dgvAccesorios.DataSource = Session["listaAccesorios"];
                dgvAccesorios.DataBind();
            }
        }

       
    }
}