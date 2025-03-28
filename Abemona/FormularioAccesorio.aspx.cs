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
    public partial class FormularioAccesorio : System.Web.UI.Page
    {
        public bool SeleccionarURL { get; set; }
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;

            try
            {
              
                if (!IsPostBack)
                {
                    CategoriaNegocio negocio = new CategoriaNegocio();
                    List<Elemento> lista = negocio.listar();

                    ddlCategoria.DataSource = lista;
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataTextField = "Nombre";
                    ddlCategoria.DataBind();

                    MaterialNegocio negocio2 = new MaterialNegocio();
                    List<Elemento> lista2 = negocio2.listar();

                    ddlMaterial.DataSource = lista2;
                    ddlMaterial.DataValueField = "Id";
                    ddlMaterial.DataTextField = "Nombre";
                    ddlMaterial.DataBind();
                }

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    AccesoriosNegocio negocio = new AccesoriosNegocio();
                    Accesorio seleccionado = (negocio.listar(id))[0];

                    Session.Add("accesorioSeleccionado", seleccionado);

                    txtId.Text = id;
                    txtCodigo.Text = seleccionado.Codigo;
                    txtNombre.Text = seleccionado.Nombre;
                    ddlCategoria.SelectedValue = seleccionado.IdCategoria.ToString();
                    ddlMaterial.SelectedValue = seleccionado.IdMaterial.ToString();
                    txtPrecio.Text = seleccionado.Precio.ToString();
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtImagen.Text = seleccionado.Imagen;
                    txtImagen_TextChanged(sender, e);

                }

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void txtImagen_TextChanged(object sender, EventArgs e)
        {
            imgArticulos.ImageUrl = txtImagen.Text;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                Accesorio nuevo = new Accesorio();
                AccesoriosNegocio negocio = new AccesoriosNegocio();

                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Categoria = new Elemento();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);
                nuevo.Material = new Elemento();
                nuevo.Material.Id = int.Parse(ddlMaterial.SelectedValue);
                nuevo.Precio = int.Parse(txtPrecio.Text);
                nuevo.Descripcion = txtDescripcion.Text;


                if (txtImagen.Text == "")
                {
                    nuevo.Imagen = "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg";
                }
                else
                {
                    nuevo.Imagen = txtImagen.Text;
                }


                if (cargaImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Imagenes/");
                    cargaImagen.PostedFile.SaveAs(ruta + "Producto-" + nuevo.Codigo + ".jpg");
                    nuevo.Imagen = "Imagenes/Producto-" + nuevo.Codigo + ".jpg";
                    
                }



               



                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificar(nuevo);
                }
                else
                 negocio.agregar(nuevo);


                Response.Redirect("Administracion.aspx", false);


            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void btnConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            try
            {

                if (string.IsNullOrWhiteSpace(txtId.Text) || !int.TryParse(txtId.Text, out int id) || id <= 0)
                {
                    // Si no hay un ID válido, no hacer nada o mostrar un mensaje
                 
                    return;
                }


                if (chkConfirmaEliminacion.Checked)
                {
                    AccesoriosNegocio negocio = new AccesoriosNegocio();
                    negocio.eliminar(int.Parse(txtId.Text));
                    Response.Redirect("Administracion.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

       

        protected void CheckBoxURL_CheckedChanged(object sender, EventArgs e)
        {
            SeleccionarURL = CheckBoxURL.Checked;
            

        }
    }
}