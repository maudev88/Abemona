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
    public partial class MensajeCompleto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";

                if (id != "" && !IsPostBack)
                {
                    MensajesNegocio negocio = new MensajesNegocio();
                    Mensaje seleccionado = (negocio.listar(id))[0];

                    Session.Add("mensajeSeleccionado", seleccionado);


                    txtNombre.InnerText = seleccionado.Nombre.ToString();
                    txtMail.InnerText = seleccionado.Mail.ToString();
                    txtMensaje.InnerText = seleccionado.Mensajee.ToString();
                }
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(Request.QueryString["id"]);

                MensajesNegocio negocio = new MensajesNegocio();
                negocio.eliminar(id);
                Response.Redirect("Mensajes.aspx");

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}