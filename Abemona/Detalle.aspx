<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Abemona.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        // Función para cambiar la imagen si no es válida
        function setDefaultImage(img) {
            img.onerror = null; // Evitar que la función se llame repetidamente
            img.src = 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg'; // Imagen por defecto
        }
  </script>
    <style>
       #datos h4 {
            color: #e2aed5 !important;
        }

        body {
            background-color: #efefef !important;
        }

        .botones {
            font-family: Quicksand;
            font-weight: bolder;
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

        @media screen and (max-width: 1399px) {
            .blanco {
                margin: 60px 0px !important;
                padding: 15px;
            }
        }

        @media screen and (max-width: 991px) {

            .botonn {
                font-size: 32px !important;
            }

            .botones {
                 font-size: 32px !important;
            }

             h1 {
                font-size: 60px;
            }

            .fav {
                font-size: 32px !important;
            }

             #texto p {
                font-size: 50px;
                text-align: center;
            }

            h4 {
                font-size: 40px;
            }

             h5 {
                font-size: 35px;
            }

             .botoGrandes {
                 margin-top: 57px;
             }

             .iniSesion {
                 font-size: 30px;
             }

            .divColor p {
                font-size: 30px !important;
            }

            #loUltimo {
                font-size: 30px !important;
            }
        }

        @media screen and (min-width: 1400px) {
            .botonnDiv {
                position: relative;
                bottom: 24px;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" />

     <asp:UpdatePanel runat="server" >
            <ContentTemplate>

    <h1 class="acheuno" style="text-align: center; margin: 50px 0px;">Detalle del Producto</h1>


    <h2 id="txtId" class="d-none" runat="server"></h2>

    <div class="d-flex justify-content-around flex-column  p-xxl-5 blanco" style="margin: 200px; margin-bottom: 62px; margin-top: 50px; background-color: white;">

        <div style="display: flex; justify-content: space-around;">

            <div>
                <img src="" id="txtImg" runat="server" onerror="setDefaultImage(this)" alt="Alternate Text" style="max-height: 484px; max-width: 540px; padding-top: 31px; padding-bottom: 31px;" />
            </div>
            <div class="d-flex flex-column gap-3" id="datos">
                <div>
                    <h4>Código:</h4>
                    <h5 id="txtCodigo" runat="server"></h5>
                </div>
                <div>
                    <h4>Nombre:</h4>
                    <h5 id="txtNombre" runat="server"></h5>
                </div>
                <div>
                    <h4>Material:</h4>
                    <h5 id="txtMaterial" runat="server"></h5>
                </div>
                <div>
                    <h4>Categoría:</h4>
                    <h5 id="txtCategoria" runat="server"></h5>
                </div>
                <div>
                    <h4>Precio:</h4>
                    <h5 id="txtPrecio" runat="server"></h5>
                </div>
                <div style="width: 300px;">
                    <h4>Descripción:</h4>
                    <h5 id="txtDescripcion" runat="server"></h5>
                </div>

            </div>

        </div>


       

                <div style="display: flex; justify-content: space-around;" class="align-items-lg-center botoGrandes">
                    <div class="botonnDiv">
                        <asp:Button Text="Ir al Catálogo" ID="btnVolver" CssClass="btn botonn d-block mx-auto mt-xxl-5 botones" OnClick="btnVolver_Click" runat="server" Style="color: white; background-color: #e2aed5;" />
                    </div>



                    <div style="display: flex; justify-content: center; align-items: center;">



                        <asp:LinkButton Text="" runat="server" Style="position: relative; bottom: 0px; "
                            ID="btnFavorito"
                            CssClass="flex-shrink-0 "
                            OnCommand="btnFavorito_Command"
                            >

                       

                            <%if (esFavorito())
                                {  %>
                            <div class="btn botones" style="background-color: transparent; color: red; border: 2px solid red"><i class="fa-solid fa-circle-minus" ></i> Quitar de favoritos</div>
                                
                            <%  }
                                else
                                {  %>
                            <div class="btn botones" style="background-color: red; color: white;">  <i class='fas fa-heart'></i> Agregar a favoritos </div>
            <%  }%>
                        </asp:LinkButton>

                        <div style="display: flex; align-items: center;">
                            <asp:Label Text="" Style="position: absolute; margin-left: 11px;" ID="lblError" ForeColor="Red" runat="server" CssClass="iniSesion"/>
                        </div>

                    </div>
                </div>


    </div>

                 <%--FOOTER--%>

    <footer>
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
        <div class="divColor" id="loUltimo" style="font-family: Quicksand; font-weight: bolder; font-weight: bolder; text-align: center; background-color: #e2aed5; padding-bottom: 16px; margin: 0;">
            © 2025 Restaurant. Todos los derechos reservados. Diseñado por Mauro Etchegoyen.
        </div>
    </footer>

            </ContentTemplate>
        </asp:UpdatePanel>

</asp:Content>
