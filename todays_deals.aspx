<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="todays_deals.aspx.cs" Inherits="project.todays_deals" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Button ID="btn_login" runat="server" Text="Create todays deals" onclick="GoToCreatingDeal" Width="186px"/>
            <br />
            <br />
        <asp:Button ID="btn_login0" runat="server" Text="Add todays deal on product" onclick="GoToAddTodaysDeal" Width="187px"/>
            <br />
            <br />
        <asp:Button ID="btn_login1" runat="server" Text="Remove expired deal" onclick="GoToRemoveExpiredDeal" Width="185px"/>
        </div>
    </form>
</body>
</html>
