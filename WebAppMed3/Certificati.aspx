<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Certificati.aspx.cs" Inherits="WebAppMed3.Certificati" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" >
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Certificati</title>
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
                </div>

                <!-- TABELLA VERSIONE GRIDVIEW -->

                <div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" class="table table-bordered table-striped table-responsive">
                 <HeaderStyle BackColor="#128482" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="cod_sanitario" HeaderText="Codice Sanitario" SortExpression="cod_sanitario" />
                            <asp:BoundField DataField="cod_medico" HeaderText="Codice del Medico" SortExpression="cod_medico" />
                            <asp:BoundField DataField="data_emissione" HeaderText="Data di Emissione" SortExpression="data_emissione" />
                            <asp:BoundField DataField="cod_patologia" HeaderText="Codice Patologia" SortExpression="cod_patologia" />
                            <asp:BoundField DataField="data_inizio" HeaderText="Data Inizio" SortExpression="data_inizio" />
                            <asp:BoundField DataField="data_fine" HeaderText="Data Fine" SortExpression="data_fine" />
                            <asp:BoundField DataField="note" HeaderText="Note" SortExpression="note" />
                            <asp:BoundField DataField="CAP" HeaderText="CAP" SortExpression="CAP"/>
                            <asp:BoundField DataField="provincia" HeaderText="Provincia" SortExpression="provincia" />
                            <asp:BoundField DataField="comune" HeaderText="Comune" SortExpression="comune" />
                            <asp:BoundField DataField="indirizzo" HeaderText="Indirizzo" SortExpression="indirizzo" />
                            <asp:BoundField DataField="domicilio" HeaderText="Domicilio" SortExpression="domicilio" />
                            <asp:BoundField DataField="tipologia" HeaderText="Tipologia" SortExpression="tipologia" />
                        </Columns>
                    </asp:GridView>

                    
                   
                </div>
        </form>
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>" 
     SelectCommand="SELECT [cod_sanitario], [cod_medico], [data_emissione], [cod_patologia], [data_inizio], [data_fine], [note], [CAP], [provincia], [comune], [indirizzo], [domicilio], [tipologia] FROM [certificato]" >
    </asp:SqlDataSource>

</body>

</html>
