<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Abemona.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .portada {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        h3 {
            font-size: 90px;
            font-weight: 100;
        }

        .estilo {
            height: 300px;
            background-image: url(Imagenes/Fondo.jpg);
            width: 100%;
            background-color: rgba(0, 0, 0, 0.589);
            background-attachment: fixed;
            background-blend-mode: overlay;
            margin-top: 30px;
            margin-bottom: 90px;
            font-family: 'Dancing Script';
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
        }

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

    <div class="portada">
        <div>
            <img src="Imagenes/FotoChica.jpg" alt="Alternate Text" />
        </div>
        <div style="margin-top: 85px;">
            <div style="text-align: center; margin-bottom: 5vh;">
                <img src="Imagenes/LogoNombreR.png" alt="Alternate Text" style="width: 400px;" />
            </div>
            <div style="width: 600px; font-size: 60px; text-align: center;">
                <p style="font-family: 'Dancing Script';">
                    En ABEMONA, creemos que cada accesorio tiene el poder de contar una historia única.
                
                </p>
            </div>
        </div>
    </div>

    <%--BOTON--%>

    <div style="display: flex; justify-content: center; margin-top: 30px;">
        <a href="#" style="font-family: 'Dancing Script'; font-size: 45px; background-color: #e2aed5; color: white; border-radius: 49%; padding: 19px;"
            class="btn">Ver Colección</a>
    </div>

    <%--ESTILO--%>

    <div class="estilo">
        <h3>Estilo</h3>
    </div>


    <div style="display: flex; justify-content: center; gap: 55px;">
        <div style="font-family: Quicksand; font-size: 34px; width: 400px;">
            <p>
                El estilo de nuestros productos de bijouterie está inspirado en la elegancia atemporal y la innovación moderna, fusionando lo clásico con lo contemporáneo en cada pieza. 
                Cada joya es cuidadosamente diseñada para resaltar la belleza natural y aportar un toque de sofisticación a cualquier ocasión.
            </p>
        </div>
        <div>
            <img src="Imagenes/zzzz.jpg" alt="Alternate Text" />
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
                <p><a href="https://es-la.facebook.com/" target="_blank"><i class="fa fa-facebook" style="color:white; font-weight: bolder; margin-right: 3px;"></i></a>facebook.com/Restaurant</p>
                <p><a href="https://www.instagram.com/?hl=es-la" target="_blank"><i class="fa fa-instagram" style="color:white; font-weight: bolder; margin-right: 3px;"></i></a>instagram/Restaurant</p>
            </div>
        </div>
        <div class="divColor" style="font-family: Quicksand; font-weight: bolder; font-weight: bolder; text-align: center; background-color: #e2aed5; padding-bottom: 16px; margin: 0;">
            © 2025 Restaurant. Todos los derechos reservados. Diseñado por Mauro Etchegoyen.
        </div>
    </footer>

</asp:Content>
