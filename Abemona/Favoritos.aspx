<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Abemona.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        // Función para cambiar la imagen si no es válida
        function setDefaultImage(img) {
            img.onerror = null; // Evitar que la función se llame repetidamente
            img.src = 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg'; // Imagen por defecto
        }
  </script>

    <style>
        .botonn {
            font-weight: bolder;
            transition: transform .3s ease !important;
            font-family: Quicksand;
        }

            .botonn:hover {
                transform: scale(1.1) !important;
                background-color: #e2aed5;
                color: white;
            }

       

        @media screen and (max-width: 1399px) {
            .responsive {
                margin: 25px 0;
            }
        }

      


        @media screen and (max-width: 991px) {

            h1 {
                font-size: 60px;
            }

            .botonn {
                font-size: 32px !important;
            }

            .tarjeta {
                font-size: 28px;
            }

            .elh5 {
                font-size: 28px;
            }

            .desple1 {
                width: 256px !important;
                font-size: 30px !important;
            }

            .filtros {
                flex-direction: column;
            }


        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 style="text-align: center; margin: 50px 0px;">Favoritos</h1>

    <div style="display: flex; flex-wrap: wrap;">

        <asp:Repeater runat="server" ID="repRepetidor">
            <ItemTemplate>

                <div class="col d-flex  justify-content-center responsive" style="min-width: 358px;">
                    <div style="width: 300px;" class="card mb-xxl-5  w-50px p-xl-1">
                        <div class="d-flex flex-wrap justify-content-center" style="padding: 12px; object-fit: cover">
                            <img src="<%#Eval("Imagen")%>" style="max-height: 293px; max-width: 296px;" onerror="setDefaultImage(this)" alt="..." />
                        </div>
                        <div class="card-body d-grid align-content-end tarjeta">
                            <h5 class="card-title elh5"><%#Eval("Nombre")%></h5>
                            <p class="card-text"><%#Eval("Categoria")%></p>
                            <p class="card-text"><%#Eval("Material")%></p>
                            <p class="card-text">$<%#Eval("Precio")%></p>
                            <asp:Button Text="Ver Detalle" CssClass="btn  botonn" ID="btnDetalle"
                                CommandArgument='<%#Eval("Id")%>' CommandName="AccesorioId"
                                OnClick="btnDetalle_Click" runat="server" Style="background-color: #e2aed5; color: white;" />



                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>

    </div>

   

</asp:Content>
