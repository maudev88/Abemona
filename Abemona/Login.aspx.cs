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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Session.Add("error", "Debes SALIR de tu Sesión para LOGUEARTE con un Usuario nuevo");
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {

               
                    usuario.Email = txtEmail.Text;
                    usuario.Pass = txtPassword.Text;

                    if (negocio.Login(usuario))
                    {
                        Session.Add("usuario", usuario);
                        Response.Redirect("MiPerfil.aspx", false);
                    }
                    else
                    {
                        Session.Add("error", "User o Pass incorrectos");
                        Response.Redirect("Error.aspx", false);
                    }
                


            }
            catch (System.Threading.ThreadAbortException) { }

            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}