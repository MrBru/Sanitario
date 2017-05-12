<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patologie2.aspx.cs" Inherits="WebAppMed3.Patologie2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Panel ID="pnlPatologie" runat="server" Height="579px">
            Lista Patologie
            
            <asp:GridView ID="grdPatologie" runat="server" Height="133px" Width="378px" ItemType="Patologia" OnSelectedIndexChanged="grdPatologie_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="CodicePatologia" HeaderText="Codice Patologia" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" />
                    <asp:BoundField DataField="Descrizione" HeaderText="Descrizione" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <!--bottone cancella-->
                            <asp:Button Text="Elimina" ID="btnDelete" runat="server" CommandName="" CommandArgument='<%# BindItem.CodicePatologia %>'
                                OnClientClick="return confirm('Sei sicuro di voler cancellare questa Malattia?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                            <ItemTemplate>
                                <!--bottone modifica-->
                                <asp:Button Text="Modifica" ID="btnEdit" runat="server" CommandName="EditEditore" CommandArgument='<%# BindItem.Id %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                </Columns>



            </asp:GridView>
        </asp:Panel>
    </form>
</body>
</html>
