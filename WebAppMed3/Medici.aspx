<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medici.aspx.cs" Inherits="WebAppMed3.Medici" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Medici</title>
    <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com" />
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template" />

    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    
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
    <form id="form1" runat="server">

    <section class="container content-container">
        <h3>Tabella Medici</h3>
        <div class="table-wrapper col-md-12">
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" class="table table-bordered table-striped table-responsive" >
                 <HeaderStyle BackColor="#128482" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                <asp:BoundField DataField="cognome" HeaderText="Cognome" SortExpression="cognome" />
                <asp:BoundField DataField="data_nascita" HeaderText="Data Di Nascita" SortExpression="data_nascita" />
                <asp:BoundField DataField="luogo" HeaderText="Luogo" SortExpression="luogo" />
                <asp:BoundField DataField="cod_fis" HeaderText="Codice Fiscale" SortExpression="cod_fis" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="residenza" HeaderText="Residenza" SortExpression="residenza" />
                <asp:BoundField DataField="provincia" HeaderText="Provincia" SortExpression="provincia" />
                <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                <asp:BoundField DataField="mobile" HeaderText="Cellulare" SortExpression="mobile" />
                <asp:BoundField DataField="indirizzo" HeaderText="Indirizzo" SortExpression="indirizzo" />
                <asp:BoundField DataField="cod_albo" HeaderText="Codice Albo" SortExpression="cod_albo" />
                <asp:BoundField DataField="cod_medico" HeaderText="Codice Medico" SortExpression="cod_medico" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>"
            
            SelectCommand="SELECT [nome], [cognome], [data_nascita], [luogo], [cod_fis], [email], [residenza], [provincia], [mobile], [telefono], [indirizzo], [cod_albo], [cod_medico] FROM [medico]" 
            
            DeleteCommand="DELETE FROM [medico] WHERE @cod_medico=cod_medico" >
        
            <DeleteParameters>
                <asp:Parameter Name="cod_medico" Type="String"/>

            </DeleteParameters>

        </asp:SqlDataSource>


        </div>
    </section>
    </form>

    <!--#include file="templates/footer.tpl"-->

   <script type="text/javascript">
       //var dataset = PatologieApiClienti.getApi();
       $(document).ready(function () {
           $("table#Medici").DataTable({
               //"ajax":"patologie.json"
               //data:dataset
           });
       });

   </script>

</body>

</html>
