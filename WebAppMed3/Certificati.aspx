﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Certificati.aspx.cs" Inherits="WebAppMed3.Certificati" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <form id="form1" runat="server">
        <section class="container content-container">
            <div class="table-wrapper col-md-12">
                <h3>Tabella Certificati</h3>
                <div class="searchInput">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Cerca" />
                </div>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" class="table table-bordered table-striped table-responsive" >
                    <HeaderStyle BackColor="#128482" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="cod_medico" HeaderText="Codice del Medico" SortExpression="cod_medico" />
                        <asp:BoundField DataField="data_emissione" HeaderText="Data di Emissione" SortExpression="data_emissione" DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:BoundField DataField="cod_patologia" HeaderText="Codice Patologia" SortExpression="cod_patologia" />
                        <asp:BoundField DataField="data_inizio" HeaderText="Data Inizio" SortExpression="data_inizio" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="data_fine" HeaderText="Data Fine" SortExpression="data_fine" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="note" HeaderText="Note" SortExpression="note" />
                        <asp:BoundField DataField="CAP" HeaderText="CAP" SortExpression="CAP" />
                        <asp:BoundField DataField="provincia" HeaderText="Provincia" SortExpression="provincia" />
                        <asp:BoundField DataField="comune" HeaderText="Comune" SortExpression="comune" />
                        <asp:BoundField DataField="indirizzo" HeaderText="Indirizzo" SortExpression="indirizzo" />
                        <asp:BoundField DataField="domicilio" HeaderText="Domicilio" SortExpression="domicilio" />
                        <asp:BoundField DataField="tipologia" HeaderText="Tipologia" SortExpression="tipologia" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project_workConnectionString %>"
                    SelectCommand="SELECT [cod_sanitario], [cod_medico], [data_emissione], [cod_patologia], [data_inizio], [data_fine], [note], [CAP], [provincia], [comune], [indirizzo], [domicilio], [tipologia] FROM [certificato]"></asp:SqlDataSource>
            </div>
        </section>
        <!--#include file="templates/footer.tpl"-->
    </form>
    <script type="text/javascript">
        //var dataset = PatologieApiClienti.getApi();
        $(document).ready(function () {
            $("table#Cerificati").DataTable({
                //"ajax":"patologie.json"
                //data:dataset
            });
        });

    </script>

</body>

</html>

