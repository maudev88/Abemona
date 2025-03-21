<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Nosotras.aspx.cs" Inherits="Abemona.Nosotros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        p {
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

    <h1 style="text-align: center; margin: 50px 0px;">Nuestra Historia</h1>

    <div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 60px;">
        <div style="width: 600px; font-size: 26px;">
            <p>Nuestra marca nació hace más de una década con el sueño de ofrecer accesorios de alta calidad, accesible y con un diseño único que reflejara la personalidad 
                de cada persona. Fundada por una apasionada del diseño y la moda, comenzó como un pequeño taller con el objetivo de crear piezas que fueran elegantes y modernas,
                pero al mismo tiempo atemporales. Con el tiempo, nuestra colección se ha expandido y adaptado a las últimas tendencias, siempre respetando un estilo clásico que
                nos caracteriza.</p>
            <p>Hoy, gracias al apoyo de nuestros clientas, somos una marca reconocida por su compromiso con la calidad, la creatividad y la personalización.
                Cada una de nuestros accesorios está diseñado para embellecer a quien las lleva y acompañarla en momentos especiales. Estamos agradecidas por poder 
                seguir creciendo junto a ustedes, y emocionadas por continuar ofreciendo piezas que resalten tu estilo único.</p>
           
        </div>
        <div>
            <img src="Imagenes/zz.jpg" alt="Alternate Text" style="height: 842px"; />
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
