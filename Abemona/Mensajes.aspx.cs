using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Abemona
{
    public partial class Mensajes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MensajesNegocio negocio = new MensajesNegocio();
                Session.Add("listaMensajes", negocio.listar());
                dgvMensajes.DataSource = Session["listaMensajes"];
                dgvMensajes.DataBind();
            }
        }

        protected void dgvMensajes_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvMensajes.SelectedDataKey.Value.ToString();
            Response.Redirect("MensajeCompleto.aspx?id=" + id);
        }
    }
}