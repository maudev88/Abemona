<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Articulo3.aspx.cs" Inherits="Abemona.Articulo3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        p {
            font-family: Quicksand;
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
                background-color: #e2aed5 !important;
                color: white !important;
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

    <h1 style="text-align: center; margin: 50px 0px;">Cómo cuidar tus accesorios y mantenerlos siempre brillantes</h1>

    <div style="display: flex; align-items: center; flex-direction: column;">
        <div>
            <img src="Imagenes/Articulo3.jpg" alt="Alternate Text" />
        </div>
        <div style="padding: 0 60px; font-size: 30px; margin: 60px 0;">
            <p>
                Para que tus accesorios siempre luzcan impecables, es fundamental cuidarlas adecuadamente. Un paso esencial es guardarlos en un lugar adecuado,
                como una caja forrada con tela suave que evite el contacto con otros metales o piedras. Evita el contacto de tus piezas con productos 
                químicos como perfumes, cremas o limpiadores, ya que pueden dañar los materiales y reducir el brillo de las piedras. Si tus accesorios tienen detalles
                de piedras preciosas o cristales, asegúrate de limpiarlos regularmente con un paño suave para eliminar cualquier suciedad.
            </p>
            <p>
                Otro consejo importante es no exponerte a ambientes con alta humedad, como la piscina o el baño, ya que esto puede oxidar las piezas de metal
                con el tiempo. Si algún accesorio se moja, sécalo inmediatamente para evitar que se deteriore. Con un poco de atención y cuidado, tus piezas de 
                bijouterie pueden seguir siendo brillantes y elegantes durante muchos años.
            </p>

            <div style="display: flex; justify-content: center; margin-top: 50px;">
                <a href="Blog.aspx" class="botonn btn" style="font-size: 20px;">Volver</a>
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
