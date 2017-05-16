<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Certificati.aspx.cs" Inherits="WebAppMed3.Certificati" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Certificati</title>
    <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <link href="./css/DataTables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="./scripts/modernizr-2.6.2.js"></script>
    <script src="./scripts/jquery-2.2.0.min.js"></script>
    <script src="./scripts/jquery-ui-1.10.2.min.js"></script>
    <script src="./scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="./scripts/MyScripts.js"></script>
    <script src="./scripts/bootstrap.min.js"></script>

</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
    <!--#include file="templates/menu.tpl"-->

    <section class="container content-container">
        <form id="form1" runat="server">
            <div class="col-md-6">
                <h3>Tabella Certificati</h3>
                <!--cerca certificati-->
                <div class="searchInput">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Cerca" />
                </div>
            </div>
            <div class="table-wrapper col-md-12">

                <!-- TABELLA VERSIONE GRIDVIEW -->

                <div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="data_emissione" HeaderText="Data Emissione" SortExpression="data_emissione" />
                            <asp:BoundField DataField="data_inizio" HeaderText="Data Inizio" SortExpression="data_inizio" />
                            <asp:BoundField DataField="data_fine" HeaderText="Data Fine" SortExpression="data_fine" />
                            <asp:BoundField DataField="note" HeaderText="Note" SortExpression="note" />
                            <asp:BoundField DataField="tipologia" HeaderText="Tipologia" SortExpression="tipologia" />
                            <asp:BoundField DataField="domicilio" HeaderText="Domicilio" SortExpression="domicilio" />
                            <asp:BoundField DataField="indirizzo" HeaderText="Indirizzo" SortExpression="indirizzo" />
                            <asp:BoundField DataField="comune" HeaderText="Comune" SortExpression="comune" />
                            <asp:BoundField DataField="provincia" HeaderText="Provincia" SortExpression="provincia" />
                            <asp:BoundField DataField="CAP" HeaderText="CAP" SortExpression="CAP" />
                            <asp:BoundField DataField="patologia" HeaderText="Patologia" SortExpression="patologia" />
                            <asp:BoundField DataField="nome medico" HeaderText="Nome Medico" SortExpression="nome medico" />
                            <asp:BoundField DataField="cognome medico" HeaderText="Cognome Medico" SortExpression="cognome medico" />
                            <asp:BoundField DataField="cod_sanitario" HeaderText="Codice Sanitario" SortExpression="cod_sanitario" />
                            <asp:BoundField DataField="nome paziente" HeaderText="Nome Paziente" SortExpression="nome paziente" />
                            <asp:BoundField DataField="cognome paziente" HeaderText="Cognome Paziente" SortExpression="cognome paziente" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>"
                        SelectCommand="SELECT c.[data_emissione], c.[data_inizio], c.[data_fine], c.[note], c.[tipologia], c.[domicilio], c.[indirizzo], c.[comune], c.[provincia], c.[CAP], pt.[nome] as patologia, m.[nome] as 'nome medico', m.[cognome] as 'cognome medico', pz.[cod_sanitario], pz.[nome] as 'nome paziente', pz.[cognome] as 'cognome paziente'
                        FROM [certificato] AS c
                        JOIN [patologia] AS pt ON  c.[cod_patologia] = pt.[cod_patologia]
                        JOIN [medico] AS m ON c.[cod_medico] = m.[cod_medico]
                        JOIN [paziente] AS pz ON c.[cod_sanitario] = pz.[cod_sanitario]
                        "
                        DeleteCommand="DELETE FROM [certificato] WHERE @idCertificato=idCertificato"></asp:SqlDataSource>
                    <br />
                </div>
        </form>

            </div>
    </section>

    <!--#include file="templates/footer.tpl"-->

    <script type="text/javascript">
        //var dataset = PatologieApiClienti.getApi();
        $(document).ready(function () {
            $("table#Certificati").DataTable({
                //"ajax":"test/patologie.json"
                //data:dataset
            });
        });

    </script>

</body>

</html>
