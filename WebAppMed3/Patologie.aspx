<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patologie.aspx.cs" Inherits="WebAppMed3.Patologie" %>

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
        <form id="form1" runat="server">
        <div class="col-md-2"></div>

        <div class="table-wrapper col-md-8">
            <h3>Tabella patologie</h3>
                <!--cerca patologie-->
            <div class="searchInput">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Cerca" />
            </div>
            
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1052px" class="table table-bordered table-hover">
                    <Columns>
                        <asp:BoundField DataField="descrizione" HeaderText="Descrizione" SortExpression="descrizione" />
                        <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="White" />
                </asp:GridView>

                <table border="1" style="border-collapse: collapse" class="auto-style2">
                    <tr>
                        <td style="width: 150px">Codice Patologia:<br />
                            <asp:TextBox ID="txtCod_Patologia" runat="server" Width="140" />
                        </td>
                        <td style="width: 150px">Nome:<br />
                            <asp:TextBox ID="txtNome" runat="server" Width="140" />
                        </td>
                        <td style="width: 150px">Descrizione:<br />
                            <asp:TextBox ID="txtDescrizione" runat="server" Width="140" />
                        </td>
                        <td class="auto-style1">
                            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" Width="236px" />
                        </td>
                    </tr>
                </table>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>"
                    SelectCommand="SELECT [cod_patologia], [descrizione], [nome] FROM [patologia]"
                    DeleteCommand="DELETE FROM [patologia] WHERE @cod_patologia=cod_patologia" >


                </asp:SqlDataSource>
            </form>
            </div>

        <div class="col-md-2"></div>

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