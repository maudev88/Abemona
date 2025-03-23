<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="Abemona.Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .tarjetas {
            width: 1200px;
        }

        .botonn {
            transition: transform .3s ease !important;
            background-color: #e2aed5;
            color: white;
            font-weight: bolder;
            font-family: Quicksand;
        }

            .botonn:hover {
                transform: scale(1.1);
                background-color: #e2aed5;
                color: white;
                font-weight: bolder;
                font-family: Quicksand;
            }

            .botonn:active {
                transform: scale(1.1);
                background-color: #e2aed5!important;
                color: white!important;
                font-weight: bolder;
                font-family: Quicksand;
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 style="text-align: center; margin: 50px 0px;">Blog</h1>

    <div style="display: flex; flex-direction: column; gap: 60px; align-items: center;">
        <div class="card mb-3 tarjetas">
            <img src="Imagenes/Articulo1Card.jpg" class="card-img-top" alt="...">
            <div class="card-body" style="text-align: center;">
                <h5 class="card-title">Cómo Elegir el Accesorio Perfecto para Cada Ocasión</h5>
                <p class="card-text">Elegir la joya adecuada puede marcar la diferencia en cualquier atuendo, ya sea para una cita casual o...</p>
                <a href="Articulo1.aspx" class="btn botonn">Ver Artículo</a>
            </div>
        </div>

        <div class="card mb-3 tarjetas">
            <img src="Imagenes/Articulo2Card.jpg" class="card-img-top" alt="...">
            <div class="card-body" style="text-align: center;">
                <h5 class="card-title">Tendencias en Bijouterie para el 2025</h5>
                <p class="card-text">El mundo de la bijouterie está siempre en constante evolución, y este año no es la excepción...</p>
                <a href="Articulo2.aspx" class="btn botonn">Ver Artículo</a>
            </div>
        </div>

        <div class="card mb-3 tarjetas">
            <img src="Imagenes/Articulo3Card.jpg" class="card-img-top" alt="...">
            <div class="card-body" style="text-align: center;">
                <h5 class="card-title">Cómo Cuidar Tus Joyas y Mantenerlas Siempre Brillantes</h5>
                <p class="card-text">Para que tus joyas siempre luzcan impecables, es fundamental cuidarlas adecuadamente...</p>
                <a href="Articulo3.aspx" class="btn botonn">Ver Artículo</a>
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
        <div class="divColor" style="font-family: Quicksand; font-weight: bolder; font-weight: bolder; text-align: center; background-color: #e2aed5; padding-bottom: 16px; margin: 0;">
            © 2025 Restaurant. Todos los derechos reservados. Diseñado por Mauro Etchegoyen.
        </div>
    </footer>

</asp:Content>
