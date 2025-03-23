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
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                if (string.IsNullOrWhiteSpace(txtNombre.Text) || string.IsNullOrWhiteSpace(txtMail.Text) || string.IsNullOrWhiteSpace(txtMensaje.Text))
                {
                    // Si los campos no están completos, no se ejecuta la acción.
                    return;
                }

                Mensaje nuevo = new Mensaje();
                MensajesNegocio negocio = new MensajesNegocio();

                nuevo.Nombre = txtNombre.Text;
                nuevo.Mail = txtMail.Text;
                nuevo.Mensajee = txtMensaje.Text;



                negocio.agregar(nuevo);

                txtNombre.Text = string.Empty;
                txtMail.Text = string.Empty;
                txtMensaje.Text = string.Empty;



                // Usamos ScriptManager para ejecutar el JavaScript que abre el modal
                // Esto le dice a jQuery que muestre el modal
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#exampleModal').modal('show');", true);





            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}