<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_order_status_to_in_progress.aspx.cs" Inherits="project.update_order_status_to_in_progress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              Updating Order status<br />
            <br />
            <asp:Label ID="lbl_username" runat="server" Text="Order number  "></asp:Label>
    
        <asp:TextBox ID="txt_ordernumber" runat="server"></asp:TextBox>
    
            <br />
            <br />
        <asp:Button ID="btn_login" runat="server" Text="Update to in process" onclick="SetToInProcess" Width="167px"/>
        </div>
    </form>
</body>
</html>
