<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InserisciPaziente.aspx.cs" Inherits="WebAppMed3.InserisciPaziente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Inserisci Paziente</title>
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
            <h3> Inserimento nuovo paziente</h3>
            <form>
                <div class="form-group">
                    <label for="Nome">Nome:</label>
                    <input type="text" class="form-control" id="nome"/>
                </div>
                <div class="form-group">
                    <label for="Cognome">Cognome:</label>
                    <input type="text" class="form-control" id="cognome"/>
                </div>
                <div class="form-group">
                    <label for="Data di nascita">Data di nascita:</label>
                    <input type="date" class="form-control" id="dataNascita"/>
                </div>
                <div class="form-group">
                    <label for="Luogo di nascita">Luogo di nascita:</label>
                    <input type="text" class="form-control" id="luogoNascita"/>
                </div>
                <div class="form-group">
                    <label for="Codice fiscale">Codice fiscale:</label>
                    <input type="text" maxlength="16" class="form-control" id="codiceFiscale"/>
                </div>
                <div class="form-group">
                    <label for="Residenza">Residenza:</label>
                    <input type="text" class="form-control" id="residenza"/>
                </div>
                <div class="form-group">
                    <label for="Provincia">Provincia:</label>
                    <input type="text" maxlength="2" class="form-control" id="provincia"/>
                </div>
                <div class="form-group">
                    <label for="Indirizzo">Indirizzo:</label>
                    <input type="text" class="form-control" id="indirizzo"/>
                </div>
                <div class="form-group">
                    <label for="Telefono">Telefono:</label>
                    <input type="number" class="form-control" id="telefono"/>
                </div>
                <div class="form-group">
                    <label for="Mobile">Mobile:</label>
                    <input type="number" class="form-control" id="mobile"/>
                </div>
                <div class="form-group">
                    <label for="Email">Email:</label>
                    <input type="email" class="form-control" id="email"/>
                </div>
                <div class="form-group">
                    <label for="CodiceSanitario">Codice sanitario:</label>
                    <input type="number" class="form-control" id="codiceSanitario"/>
                </div>
                <div class="form-group">
                    <label for="CodiceMedico">Codice medico:</label>
                    <input type="number" class="form-control" id="codiceMedico"/>
                </div>
                <button type="submit" class="btn btn-default">Inserisci nuovo paziente</button>
            </form>
            </section>
        </div>
        <div class="col-md-3"></div>
    </div>


    <!--#include file="templates/footer.tpl"-->

    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
<!--<script src="contactform/contactform.js"></script>-->

</body>
</html>