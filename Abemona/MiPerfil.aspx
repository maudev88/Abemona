<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Abemona.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .botonn {
            transition: transform .3s ease !important;
        }

            .botonn:hover {
                transform: scale(1.1);
            }

        @media screen and (max-width: 991px) {
            h1 {
                font-size: 60px;
            }

            #sinH1 {
                display: flex;
                flex-wrap: wrap;
                flex-direction: column;
                gap: 77px;
            }

            .lab {
                font-size: 50px;
            }

            .tclass {
                width: 90vw !important;
                height: 70px;
                font-size: 50px !important;
                border: #e2aed5 solid 2px;
                margin-top: 5px;
            }

            .margLeft {
                display: flex;
                flex-direction: column;
                margin-left: 0;
                width: 100%;
            }

            .margBoton {
                margin-bottom: 17px !important;
            }

            .inputImg {
                width: 90vw !important;
            }

            .botonn {
                font-size: 45px !important;
                margin-right: 14px;
            }

            .botonn2 {
                position: relative;
                top: 4px;
            }

            #botones {
                display: flex;
                margin-top: 55px;
                gap: 30px;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin: 50px 50px;">

        <h1 class="ache1 .margBoton" style="margin-bottom: 20px;">Mi Perfil</h1>

        <div class="row" id="sinH1">
            <div class="col-md-4">
                <div class="margBoton " style="margin-bottom: 17px;">
                    <asp:Label Text="Email" CssClass="form-label lab" runat="server" />
                    <asp:TextBox runat="server" CssClass="form-control tclass" ID="txtMail" />
                </div>
                <div class=" margBoton" style="margin-bottom: 17px;">
                    <asp:Label Text="Nombre" runat="server" CssClass="lab" />
                    <asp:TextBox runat="server" CssClass="form-control tclass" ID="txtNombre" />
                </div>
                <div class=" margBoton" style="margin-bottom: 17px;">
                    <asp:Label Text="Apellido" CssClass="form-label lab" runat="server" />
                    <asp:TextBox runat="server" CssClass="form-control tclass" ID="txtApellido" />
                </div>
                <div class="col-md-4" style="display: flex;" id="botones">
                    <asp:Button Text="Guardar" OnClick="btnGuardar_Click" CssClass="btn botonn" Style="background-color: #e2aed5; color: white; font-weight: bolder;" ID="btnGuardar" runat="server" />
                    <a href="/" class="botonn2 lab" style="color: #e2aed5!important; margin-left: 5px; font-family: sans-serif; position: relative; bottom: -8px;">Regresar</a>
                </div>
            </div>
            <div class="col-md-4 margLeft">
                <div class="mb-3">
                    <asp:Label Text="Imagen de Perfil" CssClass="form-label lab " runat="server" />
                    <input type="file" id="txtImagen" runat="server" class="form-control tclass inputImg " />
                </div>
                <asp:Image ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg" ID="imgNuevoPerfil" runat="server" CssClass="img-fluid mb-3 " />

            </div>
        </div>

        <div class="row">
        </div>


    </div>

</asp:Content>
