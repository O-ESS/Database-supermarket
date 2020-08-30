<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vendorMain.aspx.cs" Inherits="project.vendorMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
        <div>
             <asp:Label ID="lbl_productname" runat="server" Text="Product Name: "></asp:Label>
    
        <asp:TextBox ID="txt_productname" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_post0" runat="server" Text="viewProducts" onclick="ViewProducts" Width="90px"/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="lbl_productname0" runat="server" Text="Product Name: "></asp:Label>
    
        <asp:TextBox ID="txt_productname0" runat="server"></asp:TextBox>
        <br />
             <asp:Label ID="lbl_category" runat="server" Text="Category: "></asp:Label>
    
        <asp:TextBox ID="txt_category" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="lbl_category0" runat="server" Text="Category: "></asp:Label>
    
        <asp:TextBox ID="txt_category0" runat="server"></asp:TextBox>
             &nbsp;&nbsp;&nbsp;<br />
             <asp:Label ID="lbl_product_description" runat="server" Text="Product Description: "></asp:Label>
    
        <asp:TextBox ID="txt_product_description" runat="server"></asp:TextBox>
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="lbl_product_description0" runat="server" Text="Product Description: "></asp:Label>
    
        <asp:TextBox ID="txt_product_description0" runat="server"></asp:TextBox>
    
        <br />
            <asp:Label ID="lbl_price" runat="server" Text="Price: "></asp:Label>
    
        <asp:TextBox ID="txt_price" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbl_price0" runat="server" Text="Price: "></asp:Label>
    
        <asp:TextBox ID="txt_price0" runat="server"></asp:TextBox>
        <br />
            <asp:Label ID="lbl_color" runat="server" Text="Color: "></asp:Label>
    
        <asp:TextBox ID="txt_color" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbl_color0" runat="server" Text="Color: "></asp:Label>
    
        <asp:TextBox ID="txt_color0" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btn_post" runat="server" Text="Post" onclick="PostProduct" Width="90px"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbl_color1" runat="server" Text="id: "></asp:Label>
    
        <asp:TextBox ID="txt_id" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
             <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btn_post1" runat="server" Text="edit" onclick="editProduct" Width="90px"/>
             <br />
             &nbsp;
            <asp:Label ID="lbl_color2" runat="server" Text="offer_amount: "></asp:Label>
    
        <asp:TextBox ID="txt_offer" runat="server"></asp:TextBox>
             &nbsp;&nbsp;<br />
             &nbsp; expiry date:<asp:TextBox ID="txt_date" runat="server"></asp:TextBox>
             &nbsp;<br />
        <asp:Button ID="btn_post2" runat="server" Text="createOffer" onclick="CreateOffer" Width="90px"/>
             <br />
             offer_id:<asp:TextBox ID="txt_offer0" runat="server"></asp:TextBox>
             &nbsp;&nbsp;<br />
             &nbsp; serial_number:<asp:TextBox ID="txt_date0" runat="server"></asp:TextBox>
             &nbsp;<br />
        <asp:Button ID="btn_post3" runat="server" Text="ApplyOffer" onclick="ApplyOffer" Width="90px"/>
             <br />
             offer_id:<asp:TextBox ID="txt_offer1" runat="server"></asp:TextBox>
             &nbsp;&nbsp;<br />
        <asp:Button ID="btn_post4" runat="server" Text="RemoveExpiredOffers:" onclick="RemoveExpiredOffers" Width="90px"/>
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
