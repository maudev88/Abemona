<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="FormularioAccesorio.aspx.cs" Inherits="Abemona.FormularioAccesorio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .validacion {
            color: red;
            font-size: 12px;
        }

        .bolder {
            font-weight: bolder;
        }

        .botonAgregar {
            transition: transform .3s ease !important;
            margin-right: 127px;
            color: white;
            font-family: Quicksand;
            font-weight: bolder;
            background-color: #e2aed5;
        }

        .botonAgregar:hover {
                transform: scale(1.1);
                background-color: #e2aed5;
                color: white;
            }
        .botonAgregar:active {
                transform: scale(1.1);
                background-color: #e2aed5!important;
                color: white!important;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div style="margin-left: 100px;">

        <h1 style="margin: 50px 0px 40px;">Agregar Artículo</h1>


        <div style="display: flex; align-items: baseline; gap: 30px; margin-bottom: 30px;">
            <% if (!ConfirmaEliminacion)
                { %>

            <div class="mb-3" style="margin-top: 5px;">

                <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" runat="server" />


            </div>

            <% } %>

            <% if (ConfirmaEliminacion)
                {  %>

            <div class="mb-3 d-flex gap-3" style="margin-top: 5px;">
                <asp:CheckBox Text="Confirmar Eliminación" ID="chkConfirmaEliminacion" runat="server" CssClass="d-flex gap-3 align-items-lg-center" />
                <asp:Button Text="Eliminar" ID="btnConfirmarEliminacion" CssClass="btn btn-outline-danger" runat="server" OnClick="btnConfirmarEliminacion_Click" />
            </div>
            <% } %>

            <div>
                <a href="Administracion.aspx" style="color: blue!important;">Cancelar</a>
            </div>
        </div>




        <div class="row mb-xxl-5" style="max-width: 1200px;">
            <div class="col-6">

                <div style="border: 2px solid #e2aed5; padding: 25px 16px 16px; margin-bottom: 37px;">
                    <div style="display: flex;">
                        <div>
                            Carga Imagen desde su Dispositivo
                        </div>

                        <div style="margin-left: 21px; font-weight: bolder; font-size: larger; position: relative; bottom: 3px; color: #e2aed5">
                            <----->
                        </div>

                        <div class="mb-5 d-flex gap-1" style="margin-left: 21px;">
                            <asp:CheckBox Text="Seleccionar desde URL" ID="CheckBoxURL" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBoxURL_CheckedChanged" />

                        </div>
                    </div>

                    <% if (!CheckBoxURL.Checked)
                        { %>
                    <div style="margin-bottom: 37px; margin-top: 10px;">
                        <input type="file" id="cargaImagen" runat="server" class="form-control tclass inputImg " />
                    </div>


                    <% } %>



                    <% if (CheckBoxURL.Checked)
                        { %>


                    <div class="mb-3">
                        <label for="txtImagen" class="form-label">URL de la Imagen:</label>
                        <asp:TextBox runat="server" ID="txtImagen" CssClass="form-control"
                            AutoPostBack="true" OnTextChanged="txtImagen_TextChanged" />
                    </div>

                    <% } %>


                    <asp:Image ImageUrl="https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg"
                        runat="server" ID="imgArticulos" CssClass="mb-xxl-4" Style="max-height: 484px;" />
                </div>

                <div class="mb-3">
                    <label for="txtId" class="form-label bolder">Id:</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtCodigo" class="form-label bolder">Código:</label>
                    <asp:TextBox runat="server" required ID="txtCodigo" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label bolder">Nombre:</label>
                    <asp:TextBox runat="server" required ID="txtNombre" CssClass="form-control" />
                </div>
                <div class="mb-3" style="margin-top: 20px;">
                    <label for="txtCategoria" class="form-label bolder">Categoría:</label>
                    <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select"></asp:DropDownList>
                </div>
                <div class="mb-3" style="margin-top: 20px;">
                    <label for="txtMaterial" class="form-label bolder">Material:</label>
                    <asp:DropDownList runat="server" ID="ddlMaterial" CssClass="form-select"></asp:DropDownList>
                </div>
                <div style="margin-top: 20px;">
                    <label for="txtPrecio" class="form-label bolder">Precio:</label>
                    <asp:TextBox runat="server" ID="txtPrecio" required CssClass="form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Sólo Números" CssClass="validacion" ValidationExpression="^[0-9]+$" ControlToValidate="txtPrecio" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label bolder">Descripción:</label>
                    <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                </div>


            </div>

            <div class="mb-3" style="margin-top: 5px;">

                <asp:Button Text="Agregar" ID="btnAgregar" CssClass="btn botonAgregar" OnClick="btnAgregar_Click" runat="server" />

            </div>

        </div>

    </div>


</asp:Content>
