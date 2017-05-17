<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificaPatologia.aspx.cs" Inherits="WebAppMed3.ModificaPatologia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Inserisci Medico</title>
    <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com" />
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template" />

    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
    <!--#include file="templates/menu.tpl"-->

    <div class="container">

        <div class="col-md-3"></div>
        <div class="col-md-6">
            <section class="container content-container">
                <form runat="server">
                    <h3>Modifica Patologia</h3>
                    <div>
                        <label for="txtcodice">Codice:</label>
                        <asp:TextBox ID="txtcodice" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <label for="txtnome">Nome:</label>
                        <asp:TextBox ID="txtnome" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <label for="txtdescrizione">Descrizione:</label>
                        <asp:TextBox ID="txtdescrizione" runat="server" class="form-control"></asp:TextBox>
                    </div><br />
                    <div class="btn-group">
                        <asp:Button ID="btnmodifica" runat="server" Text="Modifica Patologia" class="btn btn-primary" OnClick="btnmodifica_Click"  style="margin-right:10px"/>
                        <a href ="Patologie.aspx" class="btn btn-primary">Annulla</a>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>"></asp:SqlDataSource>
                </form>
            </section>
        </div>
    </div>

    <!--#include file="templates/footer.tpl"-->

    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
    <!--<script src="contactform/contactform.js"></script>-->

</body>
</html>

