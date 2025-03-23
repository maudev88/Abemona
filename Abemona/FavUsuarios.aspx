<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="FavUsuarios.aspx.cs" Inherits="Abemona.FavUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style> 
         .oculto {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <h1 style="text-align: center; margin: 50px 0px;">Usuarios con más actividad</h1>
    
    <asp:ScriptManager runat="server" />




    <asp:UpdatePanel runat="server">
        <ContentTemplate>   

             <asp:GridView runat="server" ID="dgvUsuarios" DataKeyNames="Id" CssClass="table dgv" AutoGenerateColumns="false"
                 Style="text-align: center;">
        <Columns>
            <asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
            <asp:BoundField HeaderText="Favoritos" DataField="CantFavoritos"/>
            <asp:BoundField HeaderText="Email" DataField="Email" />
        </Columns>
    </asp:GridView>

        </ContentTemplate>
    </asp:UpdatePanel>
   

</asp:Content>
