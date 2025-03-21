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
    public partial class AccesoriosLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AccesoriosNegocio negocio = new AccesoriosNegocio();
                Session.Add("listaAccesorios", negocio.listar());
                dgvAccesorios.DataSource = Session["listaAccesorios"];
                dgvAccesorios.DataBind();
            }
        }

        protected void dgvAccesorios_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvAccesorios.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioAccesorio.aspx?id=" + id);
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Accesorio> lista = (List<Accesorio>)Session["listaAccesorios"];
            List<Accesorio> listaFiltrada = lista.FindAll(x => x.Categoria.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper())
                || x.Material.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper())
                || x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper())
                || x.Codigo.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvAccesorios.DataSource = listaFiltrada;
            dgvAccesorios.DataBind();
        }


    }
}