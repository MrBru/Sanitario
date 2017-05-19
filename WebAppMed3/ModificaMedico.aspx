<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificaMedico.aspx.cs" Inherits="WebAppMed3.ModificaMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Modifica Medico</title>
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
                <form id="formMedico" runat="server">
                    <fieldset>
                        <legend>Modifica Medico</legend>
                        <div class="form-group">
                            <label for="txtcodmedico">Codice medico:</label>
                            <asp:TextBox ID="txtcodmedico" runat="server" class="form-control"></asp:TextBox>
                        </div>
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
                            <label for="txtcodalbo">Codice albo:</label>
                            <asp:TextBox ID="txtcodalbo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                        <div class="btn-group">
                            <asp:Button ID="btnsalva" runat="server" Text="Salva Modifiche" class="btn btn-primary" OnClick="btnsalva_Click" Style="margin-right: 10px" />
                            <a href="Medici.aspx" class="btn btn-primary">Annulla</a>
                        </div>
                    </fieldset>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>" 
                        UpdateCommand="UPDATE [medico] SET [nome] = @nome, [cognome] = @cognome, [data_nascita] = @data_nascita, [luogo] = @luogo, [cod_fis] = @cod_fis, [residenza] = @residenza, [provincia] = @provincia, [indirizzo] = @indirizzo, [telefono] = @telefono, [mobile] = @mobile, [email] = @email, [cod_albo] = @cod_albo, [cod_medico] = @cod_medico WHERE [cod_medico] = @cod_medico">
                        <UpdateParameters>
                            <asp:FormParameter Name="nome" Type="String" FormField="txtnome"/>
                            <asp:FormParameter Name="cognome" Type="String" FormField="txtcognome" />
                            <asp:FormParameter DbType="Date" Name="data_nascita" FormField="txtdatanascita" />
                            <asp:FormParameter Name="luogo" Type="String" FormField="txtluogo" />
                            <asp:FormParameter Name="cod_fis" Type="String" FormField="txtcodicefiscale" />
                            <asp:FormParameter Name="residenza" Type="String" FormField="txtresidenza" />
                            <asp:FormParameter Name="provincia" Type="String" FormField="txtprovincia" />
                            <asp:FormParameter Name="indirizzo" Type="String" FormField="txtindirizzo" />
                            <asp:FormParameter Name="telefono" Type="String" FormField="txttel" />
                            <asp:FormParameter Name="mobile" Type="String" FormField="txtcell" />
                            <asp:FormParameter Name="email" Type="String" FormField="txtemail" />
                            <asp:FormParameter Name="cod_albo" Type="String" FormField="txtcodalbo" />
                            <asp:FormParameter Name="cod_medico" Type="String" FormField="txtcodmedico" />
                        </UpdateParameters>
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
