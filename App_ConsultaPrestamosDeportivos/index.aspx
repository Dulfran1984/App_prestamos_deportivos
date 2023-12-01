<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="App_ConsultaPrestamosDeportivos.frm_consultas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Consultas de prestamos</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
<link href="estilo.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <br />
      
            <div class="div_control">
                 <h1 class="display-6">Formulario de consulta</h1>
                <br />
                <table class="table table-bordered table-striped">
            <tr>
                <td><asp:TextBox ID="txt_id" runat="server" placeholder="Ingrese su documento de identidad" CssClass="form-control" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32)" MaxLength="10"></asp:TextBox></td>
                <td><asp:Button ID="btn_consultar" runat="server" Text="Consultar registros" OnClick="btn_consultar_Click" CssClass="btn btn-outline-success"/>
                <asp:Button ID="btn_nuevo" runat="server" Text="Nueva consulta" CssClass="btn btn-outline-warning" OnClick="btn_nuevo_Click"/></td>
            </tr>
                </table>
            
            <br />
            <div>
                <asp:GridView ID="dtg_prestamos" runat="server" CssClass="table">
                    <Columns>
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Imagenes/consulta(7).png" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
                <div>
                    <asp:Label ID="lbl_mensaje" runat="server" Text="Mensaje" Visible="False"></asp:Label>
                </div>
            </div>
        </center>
    </form>
</body>
</html>
