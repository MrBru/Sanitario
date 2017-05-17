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

            <div class="col-md-3"></div>

            <div class="col-md-6">
                <section class="container content-container">
                    <h3>Inserimento nuovo paziente</h3>
                    <div class="form-group">
                        <label for="txtnome">Nome:</label>
                        <asp:TextBox ID="txtnome" runat="server" class="form-control"></asp:TextBox> 
                    </div>
                    <div class="form-group">
                        <label for="txtcognome">Cognome:</label>
                        <asp:TextBox ID="txtcognome" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtdatanascita">Data di nascita:</label>
                        <asp:TextBox ID="txtdatanascita" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtluogo">Luogo di nascita:</label>
                        <asp:TextBox ID="txtluogo" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtcodicefiscale">Codice fiscale:</label>
                        <asp:TextBox ID="txtcodicefiscale" runat="server" class="form-control" MaxLength="16"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtresidenza">Residenza:</label>
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
                        <label for="txtcodicesanitario">Codice sanitario:</label>
                        <asp:TextBox ID="txtcodicesanitario" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtcod_medico">Codice medico:</label>
                        <asp:DropDownList ID="ddlcodmedico" runat="server" DataSourceID="SqlDataSource1"  DataTextField="medico" DataValueField="codice"></asp:DropDownList>
                        <asp:TextBox ID="txtcod_medico" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtdata_udate">Data Update:</label>
                        <asp:TextBox ID="txtdata_update" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtdata_inserimento">Data inserimento:</label>
                        <asp:TextBox ID="txtdata_inserimento" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtsesso">Sesso:</label>
                        <asp:TextBox ID="txtsesso" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtcap">CAP:</label>
                        <asp:TextBox ID="txtcap" runat="server" class="form-control" MaxLength="5"></asp:TextBox>
                    </div>

                    <asp:Button ID="btninseriscinuovo" runat="server" Text="Inserisci Nuovo Paziente" class="btn btn-default" OnClick="btninseriscinuovo_Click" />
                </section>
            </div>

            <div class="col-md-3"></div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>"
                 SelectCommand="SELECT m.cod_medico as codice, m.[nome] + ' ' + m.[cognome] as medico FROM paziente AS p JOIN medico As m ON p.cod_medico = m.cod_medico"
                InsertCommand="INSERT INTO [paziente] 
                ([nome], [cognome], [data_nascita], [luogo], [cod_fis], [residenza], [provincia], [indirizzo], [telefono], [mobile], [email], [cod_sanitario], [cod_medico], [data_update], [data_inserimento], [Sesso], [cap]) 
                VALUES (@nome, @cognome, @data_nascita, @luogo, @cod_fis, @residenza, @provincia, @indirizzo, @telefono, @mobile, @email, @cod_sanitario, @cod_medico, @data_update, @data_inserimento, @Sesso, @cap)" >
                <InsertParameters>

                    <asp:FormParameter Name="nome" Type="String" formfield="txtnome"/>
                    <asp:FormParameter Name="cognome" Type="String" formfield="txtcognome"/>
                    <asp:FormParameter DbType="Date" Name="data_nascita" formfield="txtdatanascita"/>
                    <asp:FormParameter Name="luogo" Type="String" formfield="txtluogo"/>
                    <asp:FormParameter Name="cod_fis" Type="String" formfield="txtcodicefiscale"/>
                    <asp:FormParameter Name="residenza" Type="String" formfield="txtresidenza"/>
                    <asp:FormParameter Name="provincia" Type="String" formfield="txtprovincia"/>
                    <asp:FormParameter Name="indirizzo" Type="String" formfield="txtindirizzo"/>
                    <asp:FormParameter Name="telefono" Type="String" formfield="txttel"/>
                    <asp:FormParameter Name="mobile" Type="String" formfield="txtcell"/>
                    <asp:FormParameter Name="email" Type="String" formfield="txtemail"/>
                    <asp:FormParameter Name="cod_sanitario" Type="String" formfield="txtcodicesanitario"/>
                    <asp:FormParameter Name="cod_medico" Type="String" formfield="ddl.codmedico.selectedindex"/>
                    <asp:FormParameter Name="data_update" Type="DateTime" formfield="txtdata_update"/>
                    <asp:FormParameter Name="data_inserimento" Type="DateTime" formfield="txtdata_inserimento"/>
                    <asp:FormParameter Name="Sesso" Type="String" formfield="txtsesso"/>
                    <asp:FormParameter Name="cap" Type="String" formfield="txtcap"/>
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
