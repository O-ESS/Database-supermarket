<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="project.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

                    <asp:Label ID="lbl_username" runat="server" Text="Username: "></asp:Label>
    
        <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
    
        <br />
    
        <br />
        <asp:Label ID="lbl_password" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
    
        <br />
        <asp:Button ID="btn_login" runat="server" Text="Login" onclick="login" Width="90px"/>
    
        <asp:Button ID="btn_login0" runat="server" Text="Customer_Register " onclick="customerregister" Width="90px"/>
    
        <asp:Button ID="btn_login1" runat="server" Text="vendor_Register " onclick="vendorregister" Width="90px"/>
    
        </div>
    </form>
</body>
</html>
