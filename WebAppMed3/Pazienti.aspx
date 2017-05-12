<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pazienti.aspx.cs" Inherits="WebAppMed3.Pazienti" %>

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
    <form id="form1" runat="server">
    <!--#include file="templates/menu.tpl"-->
    
    <section class="container content-container">
        <h3>Tabella Pazienti</h3>
        <div class="table-wrapper col-md-12">
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idPaziente" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="idPaziente" HeaderText="idPaziente" InsertVisible="False" ReadOnly="True" SortExpression="idPaziente" />
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                    <asp:BoundField DataField="cognome" HeaderText="cognome" SortExpression="cognome" />
                    <asp:BoundField DataField="data_nascita" HeaderText="data_nascita" SortExpression="data_nascita" />
                    <asp:BoundField DataField="luogo" HeaderText="luogo" SortExpression="luogo" />
                    <asp:BoundField DataField="cod_fis" HeaderText="cod_fis" SortExpression="cod_fis" />
                    <asp:BoundField DataField="residenza" HeaderText="residenza" SortExpression="residenza" />
                    <asp:BoundField DataField="provincia" HeaderText="provincia" SortExpression="provincia" />
                    <asp:BoundField DataField="indirizzo" HeaderText="indirizzo" SortExpression="indirizzo" />
                    <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                    <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="cod_sanitario" HeaderText="cod_sanitario" SortExpression="cod_sanitario" />
                    <asp:BoundField DataField="cod_medico" HeaderText="cod_medico" SortExpression="cod_medico" />
                    <asp:BoundField DataField="data_update" HeaderText="data_update" SortExpression="data_update" />
                    <asp:BoundField DataField="data_inserimento" HeaderText="data_inserimento" SortExpression="data_inserimento" />
                    <asp:BoundField DataField="Sesso" HeaderText="Sesso" SortExpression="Sesso" />
                    <asp:BoundField DataField="cap" HeaderText="cap" SortExpression="cap" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>" SelectCommand="SELECT * FROM [paziente]"></asp:SqlDataSource>
            <br />
            
        </div>
    </section>


    <!--#include file="templates/footer.tpl"-->

   <script type="text/javascript">
       //var dataset = PatologieApiClienti.getApi();
       $(document).ready(function () {
           $("table#Pazienti").DataTable({
               //"ajax":"test/patologie.json"
               //data:dataset
           });
       });

   </script>

    </form>

</body>

</html>
