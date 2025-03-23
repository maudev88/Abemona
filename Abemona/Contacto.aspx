<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="Abemona.Contacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
        h1 {
            text-align: center;
            margin: 55px 0px;
        }

        .divP {
            align-items: center;
            display: flex;
            flex-direction: column;
            width: 100vw;
        }

        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
        }

         .btnhover {
             transition: transform .3s ease!important;
         }

         .btnhover:hover {
             transform: scale(1.1)!important;
         }

         @media (max-width: 991px) {
             h1 {
                text-align: center;
                margin: 50px 0px !important;
                font-size: 68px;
            }
             .divP {
                 font-size: 43px;
                 text-align: center;
             }

             .textBox {
                 width: 80%!important;

             }

             .textBoxPosta {
                 height: 60px;
                 font-size: 43px;

             }

             #multiline {
                 width: 80%!important;
             }

             .txtMensaje {
                 height: 500px;
                 font-size: 43px;
             }

             .button {
                 font-size: 43px!important;
             }

             .botonModal {
                 font-size: 43px;
             }
             
         }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:ScriptManager runat="server" />


    <h1>Hacenos tu pedido o dejanos un mensaje ❤</h1>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="divP">
                <div class="mb-3 w-25 textBox">
                    <asp:Label Text="Nombre" CssClass="form-label" runat="server" />
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control textBoxPosta" oninput="validateFields()" />
                </div>
                <div class="mb-3 w-25 textBox">
                    <asp:Label Text="Mail" CssClass="form-label" runat="server" />
                    <asp:TextBox runat="server" ID="txtMail" CssClass="form-control textBoxPosta"  TextMode="Email" oninput="validateFields()" />
                </div>
                <div class="mb-3 w-25 " id="multiline">
                    <asp:Label Text="Mensaje" CssClass="form-label" runat="server" />
                    <asp:TextBox runat="server" ID="txtMensaje" CssClass="form-control txtMensaje" TextMode="MultiLine" Rows="8" oninput="validateFields()" />
                </div>

                <asp:Button Text="Enviar" ID="btnEnviar" OnClick="btnEnviar_Click"  CssClass="btn btnhover button" style="background-color: #e2aed5; color: white; font-weight: bolder;"  runat="server" />



                <%--MODAL--%>

                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">

                            <div class="modal-body" style="color: forestgreen; border-bottom: solid 1px black; text-align:center; font-weight: 600;">
                                Tu mensaje se ha enviado correctamente!
                            </div>
                            <div style="display: flex; justify-content: center;">
                                <button type="button" class="btn  m-2 botonModal btnhover"  style="background-color: #e2aed5; color: white; font-weight: bolder;" data-bs-dismiss="modal">Aceptar</button>
                            </div>

                        </div>
                    </div>
                </div>

            </div>



        </ContentTemplate>
    </asp:UpdatePanel>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</asp:Content>
