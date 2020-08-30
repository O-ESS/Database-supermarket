<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create_todays_deal.aspx.cs" Inherits="project.create_todays_deal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

            <asp:Label ID="lbl_username" runat="server" Text="deal amount      "></asp:Label>
    
        <asp:TextBox ID="txt_dealamount" runat="server"></asp:TextBox>
    
        <br />
            <asp:Label ID="lbl_username0" runat="server" Text="expiry date     "></asp:Label>
    
        <asp:TextBox ID="txt_expirydate" runat="server"></asp:TextBox>
    
        <div>
        </div>
        <p>
        <asp:Button ID="btn_login" runat="server" Text="create this deal" onclick="CreateTodaysDeal" Width="131px"/>
        </p>
    </form>
</body>
</html>
