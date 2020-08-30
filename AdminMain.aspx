<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMain.aspx.cs" Inherits="project.AdminMain1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <asp:Button ID="btn_login" runat="server" Text="Activate Vendors" onclick="GoToActivatingVendors" Width="142px"/>
            <br />
            <br />
        <asp:Button ID="btn_login0" runat="server" Text="Review all orders" onclick="GoToReviewingOrders" Width="142px"/>
            <br />
            <br />
        <asp:Button ID="btn_login1" runat="server" Text="Update Order status" onclick="GoToUpdatingOrderStatus" Width="142px"/>
            <br />
            <br />
        <asp:Button ID="btn_login2" runat="server" Text="Today's deals" onclick="GoToTodaysDeals" Width="142px"/>
              <br />
        <p>
    
  
    
                    phone number:<asp:TextBox ID="txt_phone_number" runat="server"></asp:TextBox>
    
  
    
            </p>
        <p>
        <asp:Button ID="btn_login6" runat="server" Text="addPhoneNumber" onclick="addPhoneNumber" Width="90px"/>
    
  
    
        </p>
        </div>
    </form>
</body>
</html>
