<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificaPatologia.aspx.cs" Inherits="WebAppMed3.ModificaPatologia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Inserisci Medico</title>
    <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com"/>
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template"/>

    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal"/>
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
    <!--#include file="templates/menu.tpl"-->
    
    
    
<div class="container">
    
    <div class="col-md-3"></div>
        <div class="col-md-6">
            <section class="container content-container">
            <form runat="server">
                <h3>Inserimento nuova Patologia</h3>
                <div class="form-group">
                    <label for="txtcodice">Codice:</label>
                    <asp:TextBox ID="txtcodice" runat="server"  class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtnome">Nome:</label>
                    <asp:TextBox ID="txtnome" runat="server"  class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtdescrizione">Descrizione:</label>
                    <asp:TextBox ID="txtdescrizione" runat="server"  class="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btninseriscinuovo" runat="server" Text="Inserisci Nuova Patologia" class="btn btn-default" OnClick="btninseriscinuovo_Click"/>
             
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>" InsertCommand="INSERT INTO [patologia] ([cod_patologia], [descrizione], [nome], [data_update]) VALUES (@cod_patologia, @descrizione, @nome, @data_update)" >
             
                    <InsertParameters>
                    <asp:FormParameter Name="cod_patologia" Type="String" FormField="txtcodice" />
                    <asp:FormParameter Name="descrizione" Type="String" FormField="txtdescrizione" />
                    <asp:FormParameter Name="nome" Type="String" FormField="txtnome" />
                </InsertParameters>
                 
                </asp:SqlDataSource>
             
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

