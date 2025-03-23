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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Session.Add("error", "Debes SALIR de tu Sesión para REGISTRAR un Usuario nuevo");
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario user = new Usuario();
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

                user.Email = txtEmail.Text;
                user.Pass = txtPassword.Text;
                usuarioNegocio.insertarUsuario(user);
                user.Id = usuarioNegocio.TraerId(user);

                Session.Add("usuario", user);


                Response.Redirect("MiPerfil.aspx", false);

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
            finally
            {
                Response.Redirect("MiPerfil.aspx");
            }
        }
    }
}