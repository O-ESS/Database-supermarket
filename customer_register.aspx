<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer_register.aspx.cs" Inherits="project.register" %>

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
            First name
    
        <asp:TextBox ID="txt_firstname" runat="server"></asp:TextBox>
    
            <br />
            Last name <asp:TextBox ID="txt_lastname" runat="server"></asp:TextBox>
    

        </div>
        <p>
            Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
    
        </p>
        <p>
  Password&nbsp;&nbsp;
        <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
    
        </p>
        <p>
        <asp:Button ID="btn_login" runat="server" Text="Register" onclick="Register" Width="155px" Height="57px"/>
    
        &nbsp;</p>
    </form>
</body>
</html>
