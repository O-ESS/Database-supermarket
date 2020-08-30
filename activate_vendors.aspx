<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activate_vendors.aspx.cs" Inherits="project.AdminMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            vendor_username:<asp:TextBox ID="txt_vendor_username" runat="server"></asp:TextBox>
             &nbsp;<br />
        <asp:Button ID="btn_post2" runat="server" Text="acivate_vendor" onclick="ActivateVendor" Width="90px"/>
        </div>
    </form>
</body>
</html>
