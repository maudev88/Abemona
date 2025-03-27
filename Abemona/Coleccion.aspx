<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Coleccion.aspx.cs" Inherits="Abemona.Colección" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        // Función para cambiar la imagen si no es válida
        function setDefaultImage(img) {
            img.onerror = null; // Evitar que la función se llame repetidamente
            img.src = 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg'; // Imagen por defecto
        }
  </script>

    <style>
        body {
            background-color: #efefef !important;
        }

        .buscar {
            background-color: #e2aed5;
            color: white;
            font-weight: bolder;
            transition: transform .3s ease !important;
        }

            .buscar:hover {
                transform: scale(1.1) !important;
                background-color: #e2aed5;
                color: white;
            }

            .buscar:active {
                transform: scale(1.1) !important;
                background-color: #e2aed5 !important;
                color: white !important;
            }

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
                width: 300px !important;
                font-size: 35px !important;
            }

            .filtros {
                flex-direction: column;
                align-items: center;
            }


           
            h4 {
                font-size: 40px;
            }

            .divColor p {
                font-size: 30px !important;
            }

            #loUltimo {
                font-size: 30px !important;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />

    <h1 style="text-align: center; margin: 50px 0px;">Colección</h1>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class=" gap-4 filtros " style="margin-bottom: 50px; display: flex; justify-content: center;">

                <asp:DropDownList runat="server" CssClass="form-select desple1" Style="width: 160px;" ID="ddlCampo" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                    <asp:ListItem Text="Seleccione" disabled="true" />
                    <asp:ListItem Text="Categoría" />
                    <asp:ListItem Text="Material" />
                </asp:DropDownList>

                <asp:DropDownList runat="server" CssClass="form-select dropdown-toggle desple1" ID="ddlCriterio" Style="width: 160px;">
                    <asp:ListItem Text=" " />
                </asp:DropDownList>


                <asp:Button Text="Buscar" CssClass="btn desple1 buscar" ID="btnBuscar" OnClick="btnBuscar_Click" runat="server" />
                <asp:Button Text="Nueva Búsqueda" CssClass="btn desple1 buscar" ID="btnNuevaBusqueda" OnClick="btnNuevaBusqueda_Click" runat="server" />
            </div>



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


        </ContentTemplate>
    </asp:UpdatePanel>

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

</asp:Content>
