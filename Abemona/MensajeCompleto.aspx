<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="MensajeCompleto.aspx.cs" Inherits="Abemona.MensajeCompleto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        h1 {
            text-align: center;
            margin: 30px 0px;
        }

        .espan {
            border-bottom: 3px #e2aed5 solid;
            color: #e2aed5;
        }

        h4 {
            margin-bottom: 20px;
        }

        h5 {
            margin-bottom: 30px;
        }

        .cuadroMensaje {
            max-width: 80vw;
            max-height: 350px;
            border: 2px solid;
            word-wrap: break-word;
            overflow-y: scroll;
            text-align: left;
            padding: 17px;
        }

         .botones {
             transition: transform .3s ease!important;
        }

        .botones:hover {
            transform: scale(1.1);
        }
               
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Mensaje Seleccionado</h1>

    <div class="d-flex flex-column gap-3" style="text-align: center; margin-top: 50px">
        <div class="d-flex flex-wrap justify-content-center" style="gap: 10vw;">

            <h5 id="txtId" style="position: absolute;" runat="server"></h5>

            <div>
                <h4><span class="espan">Nombre:</span></h4>
                <h5 id="txtNombre" runat="server"></h5>
            </div>
            <div>
                <h4><span class="espan">Mail:</span></h4>
                <h5 id="txtMail" runat="server"></h5>
            </div>
        </div>
        <div class="d-flex flex-column align-items-center gap-4">
            <div>
                <h4><span class="espan">Mensaje:</span></h4>
                <div class="cuadroMensaje" style="min-width: 400px;">
                    <h5 id="txtMensaje" runat="server"></h5>
                </div>
            </div>
            <div />

            <div class="d-flex" style="gap: 129px;">
                <div><a href="Mensajes.aspx" class="btn botones" style="background-color: #e2aed5; font-family: Quicksand; color: white; font-weight: bolder;">Volver</a></div>
                <div>
                    <asp:Button Text="Eliminar" CssClass="btn btn-danger botones" style="font-weight: bolder;" ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" /></div>
            </div>
        </div>
</asp:Content>
