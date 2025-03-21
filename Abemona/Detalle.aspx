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

        @media screen and (max-width: 1399px) {
            .blanco {
                 margin: 60px 0px !important;
                 padding: 15px;
             }
        }

         @media screen and (max-width: 991px) {
             
             .botonn {
                font-size: 32px!important;
            }
             .acheuno {
                 font-size: 41px;
             }
             .fav {
                 font-size: 32px!important;
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

    <h1 class="acheuno" style="text-align: center; margin: 50px 0px;">Detalle del Producto</h1>


    <h2 id="txtId" class="d-none" runat="server"></h2>

    <div class="d-flex justify-content-around  p-xxl-5 blanco"  style="margin: 200px; margin-bottom: 62px; margin-top: 50px; background-color: white;">
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

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div style="display: flex;  justify-content:space-around;" class="align-items-lg-center">
        <div class="botonnDiv">
             <asp:Button Text="Volver al Catálogo" ID="btnVolver" CssClass="btn botonn d-block mx-auto mt-xxl-5" OnClick="btnVolver_Click" runat="server" Style="color: white; background-color: #e2aed5;" />
        </div>
        <div>
            <asp:Button Text="Agregar a favoritos" CssClass="btn btn-danger botonn" id="btnFavoritos" OnClick="btnFavoritos_Click" runat="server" />    
        </div>
    </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    

</asp:Content>
