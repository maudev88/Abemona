<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Abemona.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <style>
        @media screen and (max-width: 991px) {
            .ache2 {
                font-size: 43px;
            }
            .lab {
                font-size: 31px;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <h1 class="mb-4 ache2">Error</h1>
    <div class="d-flex flex-column gap-3 lab">
         <asp:Label Text="text" ID="lblError" runat="server" />
    <a href="Default.aspx" class="lab">Inicio</a>
    </div>

</asp:Content>
