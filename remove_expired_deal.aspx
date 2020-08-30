<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="remove_expired_deal.aspx.cs" Inherits="project.remove_expired_deal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            removing expired deals<br />
            <asp:Label ID="lbl_username" runat="server" Text="deal id       :         "></asp:Label>
    
        <asp:TextBox ID="txt_dealid" runat="server"></asp:TextBox>
    
            <br />
        </div>
        <p>
        <asp:Button ID="btn_login" runat="server" Text="remove this deal" onclick="RemoveExpiredDeal" Width="142px"/>
        </p>
    </form>
</body>
</html>
