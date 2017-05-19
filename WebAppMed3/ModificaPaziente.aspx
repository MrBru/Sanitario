<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificaPaziente.aspx.cs" Inherits="WebAppMed3.ModificaPaziente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Modifica Paziente</title>
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
                <form id="formPaziente" runat="server">
                    <fieldset>
                        <legend>Modifica Paziente</legend>
                       <div class="form-group">
                            <label for="txtnome">Nome: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtnome" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtcognome">Cognome: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtcognome" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtdatanascita">Data di nascita: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtdatanascita" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtluogo">Luogo di nascita: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtluogo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtcodicefiscale">Codice fiscale: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtcodicefiscale" runat="server" class="form-control" MaxLength="16"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtresidenza">Residenza: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtresidenza" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtprovincia">Provincia:</label>
                            <asp:TextBox ID="txtprovincia" runat="server" class="form-control" MaxLength="2"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtindirizzo">Indirizzo:</label>
                            <asp:TextBox ID="txtindirizzo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txttel">Telefono:</label>
                            <asp:TextBox ID="txttel" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtcell">Mobile:</label>
                            <asp:TextBox ID="txtcell" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtemail">Email:</label>
                            <asp:TextBox ID="txtemail" runat="server" class="form-control" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="form-group">

                            <label for="CodiceSanitario">Codice sanitario: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtcodicesanitario" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="ddlmedico">Codice medico:</label><br />
                            <asp:DropDownList ID="ddlmedico" runat="server" DataSourceID="SqlDataSource2" DataValueField="codice" DataTextField="dottore" Width="100%" ></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="txtdata_update">Data update: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtdata_update" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtdata_inserimento">Data inserimento: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtdata_inserimento" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtsesso">Sesso:</label>
                            <asp:TextBox ID="txtsesso" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">

                            <label for="txtcap">CAP:<span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtcap" runat="server" class="form-control" MaxLength="5"></asp:TextBox>
                        </div>
                        <br />
                        <div class="btn-group">
                            <asp:Button ID="btnsalva" runat="server" Text="Salva Modifiche" class="btn btn-primary"  Style="margin-right: 10px" />
                            <a href="Pazienti.aspx" class="btn btn-primary">Annulla</a>
                        </div>
                    </fieldset>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        SelectCommand="SELECT [cod_medico] as codice, [nome] + ' ' + [cognome] as dottore FROM medico" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>">
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
