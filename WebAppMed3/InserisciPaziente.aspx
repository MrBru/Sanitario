<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InserisciPaziente.aspx.cs" Inherits="WebAppMed3.InserisciPaziente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Inserisci Paziente</title>
    <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com" />
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template" />

    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
    <form id="form1" runat="server">
        <!--#include file="templates/menu.tpl"-->

        <div class="container">
            <div class="col-md-2"></div>
            <div class="col-md-8">

                <section class="container content-container">

                    <fieldset>
                        <legend>Inserimento nuovo paziente</legend>
                        <div class="form-group">
                            <label for="Nome">Nome: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtnome" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="Cognome">Cognome: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtcognome" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="Data di nascita">Data di nascita: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtdatanascita" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="Luogo di nascita">Luogo di nascita: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtluogo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="Codice fiscale">Codice fiscale: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtcodicefiscale" runat="server" class="form-control" MaxLength="16"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="Residenza">Residenza: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtresidenza" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="Provincia">Provincia:</label>
                            <asp:TextBox ID="txtprovincia" runat="server" class="form-control" MaxLength="2"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="Indirizzo">Indirizzo:</label>
                            <asp:TextBox ID="txtindirizzo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="Telefono">Telefono:</label>
                            <asp:TextBox ID="txttel" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="Mobile">Mobile:</label>
                            <asp:TextBox ID="txtcell" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="Email">Email:</label>
                            <asp:TextBox ID="txtemail" runat="server" class="form-control" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="CodiceSanitario">Codice sanitario: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtcodicesanitario" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="CodiceMedico">Codice medico:</label>
                            <asp:TextBox ID="txtcod_medico" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="DataUpdate">Data update: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtdata_update" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="DataInserimento">Data inserimento: <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtdata_inserimento" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="Sesso">Sesso:</label>
                            <asp:TextBox ID="txtsesso" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="CAP">CAP:<span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtcap" runat="server" class="form-control" MaxLength="5"></asp:TextBox>
                        </div>

                        <asp:Button ID="btninseriscinuovo" runat="server" Text="Inserisci Nuovo Paziente" class="btn btn-default" OnClick="btninseriscinuovo_Click" OnClientClick="return confirm('Paziente aggiunto con successo')" />
                    </fieldset>

                </section>

            </div>



            <div class="col-md-2"></div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>"
                InsertCommand="INSERT INTO [paziente] 
                            ([nome], [cognome], [data_nascita], [luogo], [cod_fis], [residenza], [provincia], [indirizzo], [telefono], [mobile], [email], [cod_sanitario], [cod_medico], [data_update], [data_inserimento], [Sesso], [cap]) 
                            VALUES (@nome, @cognome, @data_nascita, @luogo, @cod_fis, @residenza, @provincia, @indirizzo, @telefono, @mobile, @email, @cod_sanitario, @cod_medico, @data_update, @data_inserimento, @Sesso, @cap)">
                
                <InsertParameters>
                    <asp:FormParameter Name="nome" Type="String" FormField="txtnome" />
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
                    <asp:FormParameter Name="cod_sanitario" Type="String" FormField="txtcodicesanitario" />
                    <asp:FormParameter Name="cod_medico" Type="String" FormField="txtcod_medico" />
                    <asp:FormParameter Name="data_update" Type="DateTime" FormField="txtdata_update" />
                    <asp:FormParameter Name="data_inserimento" Type="DateTime" FormField="txtdata_inserimento" />
                    <asp:FormParameter Name="Sesso" Type="String" FormField="txtsesso" />
                    <asp:FormParameter Name="cap" Type="String" FormField="txtcap" />
                </InsertParameters>

            </asp:SqlDataSource>

        </div>

        <!--#include file="templates/footer.tpl"-->

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.easing.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/custom.js"></script>
        <!--<script src="contactform/contactform.js"></script>-->

    </form>

</body>
</html>
