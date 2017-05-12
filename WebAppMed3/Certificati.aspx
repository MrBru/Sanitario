<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Certificati.aspx.cs" Inherits="WebAppMed3.Certificati" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Patologie</title>
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

    <h3>Tabella Certificati</h3>

        <div class="table-wrapper col-md-12">

            <!-- TABELLA VERSIONE GRIDVIEW -->
             <form id="form1" runat="server">
                <div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idCertificato" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="idCertificato" HeaderText="idCertificato" InsertVisible="False" ReadOnly="True" SortExpression="idCertificato" />
                            <asp:BoundField DataField="cod_paziente" HeaderText="cod_paziente" SortExpression="cod_paziente" />
                            <asp:BoundField DataField="cod_medico" HeaderText="cod_medico" SortExpression="cod_medico" />
                            <asp:BoundField DataField="data_emissione" HeaderText="data_emissione" SortExpression="data_emissione" />
                            <asp:BoundField DataField="cod_patologia" HeaderText="cod_patologia" SortExpression="cod_patologia" />
                            <asp:BoundField DataField="data_inizio" HeaderText="data_inizio" SortExpression="data_inizio" />
                            <asp:BoundField DataField="data_fine" HeaderText="data_fine" SortExpression="data_fine" />
                            <asp:BoundField DataField="note" HeaderText="note" SortExpression="note" />
                            <asp:BoundField DataField="tipologia" HeaderText="tipologia" SortExpression="tipologia" />
                            <asp:BoundField DataField="domicilio" HeaderText="domicilio" SortExpression="domicilio" />
                            <asp:BoundField DataField="indirizzo" HeaderText="indirizzo" SortExpression="indirizzo" />
                            <asp:BoundField DataField="comune" HeaderText="comune" SortExpression="comune" />
                            <asp:BoundField DataField="provincia" HeaderText="provincia" SortExpression="provincia" />
                            <asp:BoundField DataField="CAP" HeaderText="CAP" SortExpression="CAP" />
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView> 

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>" SelectCommand="SELECT * FROM [certificato]"></asp:SqlDataSource>
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
