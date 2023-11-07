<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_consultas.aspx.cs" Inherits="App_ConsultaPrestamosDeportivos.frm_consultas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Consultas de prestamos</title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div>
                <asp:TextBox ID="txt_id" runat="server" placeholder="Ingrese su documento de identidad"></asp:TextBox>
                <asp:Button ID="btn_consultar" runat="server" Text="Consultar" OnClick="btn_consultar_Click" />
                <asp:Button ID="btn_nuevo" runat="server" Text="Nuevo" />
            </div>
            <br />
            <div>
                <asp:GridView ID="dtg_prestamos" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </div>
        </center>
    </form>
</body>
</html>
