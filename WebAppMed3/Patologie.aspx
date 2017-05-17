<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patologie.aspx.cs" Inherits="WebAppMed3.Patologie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Patologie</title>
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
            <asp:Panel ID="tabella" runat="server">
                <h3>Tabella patologie</h3>
                 <div class="searchInput">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" Text="Cerca" />
            </div>
            
                <div class="table-wrapper col-md-12">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" class="table table-bordered table-striped table-responsive" DataKeyNames="cod_patologia">
                        <HeaderStyle BackColor="#128482" ForeColor="White" />

                        <Columns>
                            <asp:BoundField DataField="cod_patologia" HeaderText="Codice Patologia" SortExpression="cod_patologia" ReadOnly="True" />
                            <asp:BoundField DataField="descrizione" HeaderText="Descrizione" SortExpression="descrizione" />
                            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:TemplateField> 
                                <a href='ModificaPatologia.aspx?ID=<%#Eval("cod_patologia")%>'>Modifica</a> 
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:Panel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>"
                SelectCommand="SELECT [cod_patologia], [descrizione], [nome] FROM [patologia]" DeleteCommand="DELETE FROM [patologia] WHERE [cod_patologia] = @cod_patologia">

                <DeleteParameters>
                    <asp:Parameter Name="cod_patologia" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:FormParameter Name="descrizione" Type="String" FormField="txtdescrizione" />
                    <asp:FormParameter Name="nome" Type="String" FormField="txtnome" />
                    <asp:FormParameter Name="cod_patologia" Type="String" FormField="txtcodice" />
                </UpdateParameters>

            </asp:SqlDataSource>
        </form>
    </section>

    <!--#include file="templates/footer.tpl"-->

    <script type="text/javascript">
        //var dataset = PatologieApiClienti.getApi();
        $(document).ready(function () {
            $("table#Patologie").DataTable({
                //"ajax":"patologie.json"
                //data:dataset
            });
        });

    </script>

</body>

</html>
