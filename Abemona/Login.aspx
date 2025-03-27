<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Abemona.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .btnhover {
            transition: transform .3s ease !important;
        }

            .btnhover:hover {
                transform: scale(1.1) !important;
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

            .lab {
                font-size: 50px;
            }

            .botonn {
                font-size: 45px !important;
                margin-right: 14px;
            }

            .botonn2 {
                position: relative;
                top: 4px;
                font-size: 45px !important;
            }

            .tclass {
                width: 80vw !important;
                height: 70px;
                font-size: 50px !important;
                border: #e2aed5 solid 2px;
            }

            #bloq1 {
                margin: 45px 0 40px;
            }

            #bloq2 {
                margin: 0 0 40px;
            }

            #botones {
                display: flex;
                margin-top: 55px;
                gap: 30px;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin: 50px 50px;">

        <div class="row">
            <div class="col-4">
                <h1 class="ache2" style="margin-bottom: 20px;">Login</h1>
                <div id="bloq1">
                    <label class="form-label lab">Email</label>
                    <asp:TextBox runat="server" CssClass="form-control tclass" Style="width: 400px;" ID="txtEmail" TextMode="Email" REQUIRED />
                </div>
                <div class="mb-3" id="bloq2">
                    <label class="form-label lab">Password</label>
                    <asp:TextBox runat="server" CssClass="form-control tclass" ID="txtPassword" Style="width: 400px;" TextMode="Password" REQUIRED />
                </div>

                <div id="botones">
                    <asp:Button Text="Ingresar" CssClass="btn  botonn btnhover " Style="background-color: #e2aed5; color: white; font-weight: bolder;" ID="btnLogin" OnClick="btnLogin_Click" runat="server" />
                    <a href="/" class="lab botonn2 " style="color: #e2aed5!important; margin-left: 5px; font-family: sans-serif; position: relative; bottom: -3px;">Cancelar</a>

                </div>

            </div>
        </div>

    </div>



</asp:Content>
