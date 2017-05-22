<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pazienti.aspx.cs" Inherits="WebAppMed3.Pazienti" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Pazienti</title>
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

            <div class="table-wrapper col-md-12">
                <h3>Tabella Pazienti</h3>
                <div class="searchInput">  
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Cerca" />
            </div><br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" class="table table-bordered table-striped table-responsive" OnRowEditing="GridView1_RowEditing" DataKeyNames="cod_sanitario">
                    <HeaderStyle BackColor="#128482" ForeColor="White" />

                    <Columns>
                        <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                        <asp:BoundField DataField="cognome" HeaderText="Cognome" SortExpression="cognome" />
                        <asp:BoundField DataField="data_nascita" HeaderText="Data Nascita" SortExpression="data_nascita" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="luogo" HeaderText="Luogo di Nascita" SortExpression="luogo" />
                        <asp:BoundField DataField="cod_fis" HeaderText="Codice Fiscale" SortExpression="cod_fis" />
                        <asp:BoundField DataField="residenza" HeaderText="Residenza" SortExpression="residenza" />
                        <asp:BoundField DataField="provincia" HeaderText="Provincia" SortExpression="provincia" />
                        <asp:BoundField DataField="indirizzo" HeaderText="Indirizzo" SortExpression="indirizzo" />
                        <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                        <asp:BoundField DataField="mobile" HeaderText="Cellulare" SortExpression="mobile" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="data_update" HeaderText="Data Aggiornamento" SortExpression="data_update" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="data_inserimento" HeaderText="Data Inserimento" SortExpression="data_inserimento" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="cod_sanitario" HeaderText="Codice Sanitario" SortExpression="cod_sanitario" />
                        <asp:BoundField DataField="Sesso" HeaderText="Sesso" SortExpression="Sesso" />
                        <asp:BoundField DataField="cap" HeaderText="CAP" SortExpression="cap" />
                        <%--<asp:BoundField DataField="cognome medico" HeaderText="Cognome Del Medico" SortExpression="cognome medico" />--%>
                        <asp:BoundField DataField="nome medico" HeaderText="Nome Del Medico" SortExpression="nome medico" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>"
                    SelectCommand="SELECT p.[nome], p.[cognome], p.[data_nascita], p.[luogo], p.[cod_fis], p.[residenza], p.[provincia], p.[indirizzo], p.[telefono], p.[mobile],
                 p.[email], p.[data_update], p.[data_inserimento], p.[cod_sanitario], p.[Sesso], p.[cap], m.[cognome] as 'cognome medico', m.[nome] as 'nome medico'
                FROM [paziente] AS p
                JOIN [medico] as m ON m.[cod_medico] = p.[cod_medico]"
                    DeleteCommand="DELETE FROM [paziente] WHERE @cod_sanitario=cod_sanitario"></asp:SqlDataSource>

            </div>
        </section>
        <!--#include file="templates/footer.tpl"-->
    </form>
    <script type="text/javascript">
        //var dataset = PatologieApiClienti.getApi();
        $(document).ready(function () {
            $("table#Pazienti").DataTable({
                //"ajax":"patologie.json"
                //data:dataset
            });
        });

    </script>

</body>

</html>

