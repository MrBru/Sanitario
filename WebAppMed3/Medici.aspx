<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medici.aspx.cs" Inherits="WebAppMed3.Medici" %>

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
    <form id="form1" runat="server">

    <section class="container content-container">
        <h3>Tabella Medici</h3>
        <div class="table-wrapper col-md-12">
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idMedico" DataSourceID="SqlDataSource1" Width="664px">
            <Columns>
                <asp:BoundField DataField="idMedico" HeaderText="idMedico" InsertVisible="False" ReadOnly="True" SortExpression="idMedico" />
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
                <asp:BoundField DataField="cod_albo" HeaderText="cod_albo" SortExpression="cod_albo" />
                <asp:BoundField DataField="cod_medico" HeaderText="cod_medico" SortExpression="cod_medico" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>"
            
            SelectCommand="SELECT * FROM [medico]"
            InsertCommand="INSERT INTO [medico] VALUES (@idMedico, @nome ,@cognome ,@data_nascita, @luogo, @cod_fis, @residenza, @provincia, @indirizzo, 
            @telefono, @mobile, @email, @cod_albo, @cod_medico)"
            UpdateCommand="UPDATE [medico] SET nome=@nome , cognome=@cognome , data_nascita=@data_nascita, luogo=@luogo, cod_fis=@cod_fis, residenza=@residenza, provincia=@provincia, indirizzo=@indirizzo, 
            telefono=@telefono, mobile=@mobile, email=@email, cod_albo=@cod_albo, cod_medico=@cod_medico WHERE idMedico = @idMedico"
            DeleteCommand="DELETE FROM [medico] WHERE idMedico = @idMedico" 
            >

            <InsertParameters>
                <asp:ControlParameter Name="nome" ControlID="txtNome" Type="String" />
                <asp:ControlParameter Name="cognome" ControlID="txtCognome" Type="String" />
                <asp:ControlParameter Name="data_nascita" ControlID="txtData_Nascita" Type="String" />
                <asp:ControlParameter Name="luogo" ControlID="txtLuogo" Type="String" />
                <asp:ControlParameter Name="cod_fis" ControlID="txtCod_Fis" Type="String" />
                <asp:ControlParameter Name="residenza" ControlID="txtResidenza" Type="String" />
                <asp:ControlParameter Name="provincia" ControlID="txtProvincia" Type="String" />
                <asp:ControlParameter Name="indirizzo" ControlID="txtIndirizzo" Type="String" />
                <asp:ControlParameter Name="telefono" ControlID="txtTelefono" Type="String" />
                <asp:ControlParameter Name="mobile" ControlID="txtMobile" Type="String" />
                <asp:ControlParameter Name="email" ControlID="txtEmail" Type="String" />
                <asp:ControlParameter Name="cod_albo" ControlID="txtCod_Albo" Type="String" />
                <asp:ControlParameter Name="cod_medico" ControlID="txtCod_Medico" Type="String" />
            </InsertParameters>

            <UpdateParameters>

                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter Name="cognome" Type="String" />
                <asp:Parameter Name="data_nascita" Type="String" />
                <asp:Parameter Name="luogo" Type="String" />
                <asp:Parameter Name="cod_fis" Type="String" />
                <asp:Parameter Name="residenza" Type="String" />
                <asp:Parameter Name="provincia" Type="String" />
                <asp:Parameter Name="indirizzo" Type="String" />
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter Name="mobile" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="cod_albo" Type="String" />
                <asp:Parameter Name="cod_medico" Type="String" />
            </UpdateParameters>

            <DeleteParameters>
                <asp:Parameter Name="idMedico" Type="String" />
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
