<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="Abemona.AccesoriosLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .oculto {
            display: none;
        }

        .dgv a {
            color: #e2aed5 !important;
            font-weight: bolder;
        }

         .botonn {
             transition: transform .3s ease!important;
        }

        .botonn:hover {
            transform: scale(1.1);
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <h1 style="text-align: center; margin: 50px 0px;">Lista de Artículos</h1>

            <div style="margin: 0 30px 30px;">
                <div class="row">
                    <div class="col-6" style="display: flex; justify-content: center; align-items: center; width: 100%; gap: 148px; margin-bottom: 20px;">
                        <div  style="width: 300px; display: flex; gap: 20px;">
                            <asp:Label Text="Filtrar:" runat="server"  style="line-height: 2;"/>
                            <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" />
                        </div>
                        <div>
                            <a href="FormularioAccesorio.aspx" class="btn botonn" style="background-color: #e2aed5; color: white;
            font-weight: bolder; font-family: Quicksand;">Agregar</a>
                        </div>
                    </div>


                </div>

                <asp:GridView runat="server" ID="dgvAccesorios" DataKeyNames="Id" CssClass="table dgv" AutoGenerateColumns="false"
                    OnSelectedIndexChanged="dgvAccesorios_SelectedIndexChanged" Style="text-align: center;">

                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                        <asp:BoundField HeaderText="Código" DataField="Codigo" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Categoría" DataField="Categoria.Nombre" />
                        <asp:BoundField HeaderText="Material" DataField="Material.Nombre" />
                        <asp:BoundField HeaderText="Precio" DataField="Precio" />
                        <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="Seleccionar" />
                    </Columns>

                </asp:GridView>


            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
