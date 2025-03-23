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
        h4 {
            color: #e2aed5 !important;
        }

        body {
            background-color: #efefef !important;
        }

        .botones {
            font-family: Quicksand;
            font-weight: bolder;
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

            .acheuno {
                font-size: 41px;
            }

            .fav {
                font-size: 32px !important;
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
            <div class="d-flex flex-column gap-3">
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


       

                <div style="display: flex; justify-content: space-around;" class="align-items-lg-center">
                    <div class="botonnDiv">
                        <asp:Button Text="Volver al Catálogo" ID="btnVolver" CssClass="btn botonn d-block mx-auto mt-xxl-5 botones" OnClick="btnVolver_Click" runat="server" Style="color: white; background-color: #e2aed5;" />
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
                            <asp:Label Text="" Style="position: absolute; margin-left: 11px;" ID="lblError" ForeColor="Red" runat="server" />
                        </div>

                    </div>
                </div>



    </div>

            </ContentTemplate>
        </asp:UpdatePanel>

</asp:Content>
