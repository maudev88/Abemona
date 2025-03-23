<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Abemona.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

          .btnhover {
             transition: transform .3s ease!important;
         }

         .btnhover:hover {
             transform: scale(1.1)!important;
         }

            /*FOOTER*/

        .footer {
            display: flex;
            flex-wrap: wrap;
            margin-top: 70px;
            justify-content: center;
            background-color: #e2aed5;
            font-family: Quicksand;
            font-weight: bolder;
            padding: 16px 70px;
            text-align: center;
            gap: 30px;
        }

            .footer p {
                margin: 0px;
            }

        h4 {
            font-weight: bolder;
        }

        .divColor {
            color: white;
            margin: 0px 50px;
        }
       

        @media screen and (max-width: 991px) {
            .ache2 {
                font-size: 43px;
            }

            .lab {
                font-size: 31px;
            }

            .botonn {
                font-size: 31px !important;
                margin-right: 14px;
            }

            .botonn2 {
                position: relative;
                top: 4px;
            }

            .tclass {
                width: 40vw !important;
                height: 47px;
                font-size: 29px !important;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin: 50px 50px;">

        <div class="row">
            <div class="col-4">
                <h1 class="ache2" style="margin-bottom: 20px;">Crea tu Perfil</h1>
                
                <div>
                    <label class="form-label lab">Email</label>
                    <asp:TextBox runat="server" CssClass="form-control tclass" Style="width: 400px;" ID="txtEmail" TextMode="Email" REQUIRED />
                </div>
                <div class="mb-3">
                    <label class="form-label lab">Password</label>
                    <asp:TextBox runat="server" CssClass="form-control tclass" ID="txtPassword" Style="width: 400px;" TextMode="Password" REQUIRED />
                </div>
                <asp:Button Text="Ingresar" CssClass="btn botonn btnhover" style="background-color: #e2aed5; color: white; font-weight: bolder;" ID="btnRegistro" OnClick="btnRegistro_Click" runat="server" CausesValidation="true" />
                <a href="/" class="lab botonn2 " style="color: #e2aed5!important; margin-left: 5px; font-family: sans-serif; position: relative; bottom: -3px;">Cancelar</a>
            </div>
        </div>

    </div>

     <%--FOOTER--%>

    <footer style="position: absolute;width: 100%;bottom: 0;">
        <div class="footer">
            <div class="divColor">
                <h4>DIRECCIÓN</h4>
                <p>La Calle 123</p>
                <p>Capital Federal, Bs. As.</p>
            </div>
            <div class="divColor">
                <h4>HORARIOS</h4>
                <p>Lun-Vie: 10:00 AM - 19:00 PM</p>
                <p>Sab: 11:00 AM - 18:00 AM</p>
            </div>
            <div class="divColor">
                <h4>REDES</h4>
                <p><a href="https://es-la.facebook.com/" target="_blank"><i class="fa fa-facebook" style="color: white; font-weight: bolder; margin-right: 3px;"></i></a>facebook.com/Restaurant</p>
                <p><a href="https://www.instagram.com/?hl=es-la" target="_blank"><i class="fa fa-instagram" style="color: white; font-weight: bolder; margin-right: 3px;"></i></a>instagram/Restaurant</p>
            </div>
        </div>
        <div class="divColor" style="font-family: Quicksand; font-weight: bolder; font-weight: bolder; text-align: center; background-color: #e2aed5; padding-bottom: 16px; margin: 0;">
            © 2025 Restaurant. Todos los derechos reservados. Diseñado por Mauro Etchegoyen.
        </div>
    </footer>

</asp:Content>
