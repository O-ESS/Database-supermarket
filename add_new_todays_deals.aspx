<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_new_todays_deals.aspx.cs" Inherits="project.add_new_todays_deals" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Deal Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:TextBox ID="txt_dealId" runat="server"></asp:TextBox>
    
            <br />
            Product Serial Number <asp:TextBox ID="txt_serialNo" runat="server" ></asp:TextBox>
    
            <br />
        <asp:Button ID="btn_login" runat="server" Text="insert this deal" onclick="InsertTodaysDeals" Width="147px"/>
        </div>
    </form>
</body>
</html>
