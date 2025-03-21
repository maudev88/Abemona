<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="FormularioAccesorio.aspx.cs" Inherits="Abemona.FormularioAccesorio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
        .validacion {
            color: red;
            font-size: 12px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" ID="ScriptManager1" />



    <div style="margin-left: 100px;">

        <h1 style=" margin: 50px 0px;">Agregar Artículo</h1>


        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div class="row mb-xxl-5" style="max-width: 1200px;">
                    <div class="col-6">
                        <div class="mb-3">
                            <label for="txtId" class="form-label">Id:</label>
                            <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <label for="txtCodigo" class="form-label">Código:</label>
                            <asp:TextBox runat="server" required ID="txtCodigo" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <label for="txtNombre"  class="form-label">Nombre:</label>
                            <asp:TextBox runat="server" required ID="txtNombre" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <label for="txtCategoria" class="form-label">Categoría:</label>
                            <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="txtMaterial" class="form-label">Material:</label>
                            <asp:DropDownList runat="server" ID="ddlMaterial" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="txtPrecio" class="form-label">Precio:</label>
                            <asp:TextBox runat="server" ID="txtPrecio" required CssClass="form-control" />
                            <asp:RegularExpressionValidator ErrorMessage="Sólo Números" CssClass="validacion" ValidationExpression="^[0-9]+$" ControlToValidate="txtPrecio" runat="server" />
                        </div>
                        <div class="mb-3">
                            <label for="txtDescripcion" class="form-label">Descripción:</label>
                            <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" />
                        </div>

                        <div class="mb-3">
                            <label for="txtImagen" class="form-label">Imagen:</label>
                            <asp:TextBox runat="server" ID="txtImagen" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagen_TextChanged" />
                        </div>
                        <asp:Image ImageUrl="https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg"
                            runat="server" ID="imgArticulos" CssClass="mb-xxl-4" Style="max-height: 484px;" />


                        <% if (!ConfirmaEliminacion)
                            { %>

                        <div class="mb-3" style="margin-top: 5px;">
                            <asp:Button Text="Agregar" ID="btnAgregar" CssClass="btn btn-primary" Style="margin-right: 127px;"
                                OnClick="btnAgregar_Click" runat="server" />
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


            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
    </div>

        <div class="row">
            <div class="col-6">

                <div class="mb-5">
                    <a href="Administracion.aspx" style="color: blue!important;">Cancelar</a>
                </div>

            </div>
        </div>

    </div>

</asp:Content>
