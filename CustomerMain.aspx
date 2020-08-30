<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerMain.aspx.cs" Inherits="project.mainpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:Button ID="btn_login" runat="server" Text="products_sorted" onclick="productsSorted" Width="90px"/>
    
  
    
                    <asp:Label ID="lbl_username" runat="server" Text="wishlist_name: "></asp:Label>
    
        <asp:TextBox ID="txt_wishlist_name" runat="server"></asp:TextBox>
    
  
    
                    <asp:Label ID="lbl_username0" runat="server" Text="product_ID: "></asp:Label>
    
        <asp:TextBox ID="txt_prodcut_ID" runat="server"></asp:TextBox>
    
  
    
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
  
    
                    <asp:Label ID="lbl_username1" runat="server" Text="wishlist_name: "></asp:Label>
    
        <asp:TextBox ID="txt_wishlist_name1" runat="server"></asp:TextBox>
    
  
    
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
  
    
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btn_login0" runat="server" Text="create_wishlist" onclick="wishlist" Width="90px"/>
    
  
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:Button ID="btn_login1" runat="server" Text="addTo_wishlist" onclick="addToWishlist" Width="90px"/>
    
  
    
        </div>
        <p>
    
  
    
                    <asp:Label ID="lbl_username2" runat="server" Text="product_ID: "></asp:Label>
    
        <asp:TextBox ID="txt_prodcut_ID0" runat="server"></asp:TextBox>
    
  
    
            </p>
        <p>
    
  
    
                    <asp:Label ID="lbl_username3" runat="server" Text="wishlist_name: "></asp:Label>
    
        <asp:TextBox ID="txt_wishlist_name2" runat="server"></asp:TextBox>
    
  
    
            </p>
        <p>
        <asp:Button ID="btn_login2" runat="server" Text="removeFrom_wishlist" onclick="removeFromWishlist" Width="90px"/>
    
  
    
        </p>
        <p>
    
  
    
                    <asp:Label ID="lbl_username4" runat="server" Text="Credit Card Number:"></asp:Label>
    
        <asp:TextBox ID="txt_Credit_Card_Number" runat="server"></asp:TextBox>
    
  
    
            </p>
        <p>
    
  
    
                    <asp:Label ID="lbl_username5" runat="server" Text="expiry date:"></asp:Label>
    
        <asp:TextBox ID="txt_expiry_date" runat="server"></asp:TextBox>
    
  
    
            </p>
        <p>
    
  
    
                    <asp:Label ID="lbl_username6" runat="server" Text="CVC_Code: "></asp:Label>
    
        <asp:TextBox ID="txt_CVC" runat="server"></asp:TextBox>
    
  
    
            </p>
        <p>
        <asp:Button ID="btn_login3" runat="server" Text="add_Creditcard" onclick="add_Creditcard" Width="90px"/>
    
  
    
        </p>
        <p>
    
  
    
                    <asp:Label ID="lbl_username7" runat="server" Text="product_ID: "></asp:Label>
    
        <asp:TextBox ID="txt_Id" runat="server"></asp:TextBox>
    
  
    
            </p>
        <p>
        <asp:Button ID="btn_login4" runat="server" Text="addToCart" onclick="addToCart" Width="90px"/>
    
  
    
        </p>
        <p>
    
  
    
                    <asp:Label ID="lbl_username8" runat="server" Text="product_ID: "></asp:Label>
    
        <asp:TextBox ID="txt_id1" runat="server"></asp:TextBox>
    
  
    
            </p>
        <p>
        <asp:Button ID="btn_login5" runat="server" Text="removeFromCart" onclick="removeFromCart" Width="90px"/>
    
  
    
        </p>
        <p>
    
  
    
                    phone number:<asp:TextBox ID="txt_phone_number" runat="server"></asp:TextBox>
    
  
    
            </p>
        <p>
        <asp:Button ID="btn_login6" runat="server" Text="addPhoneNumber" onclick="addPhoneNumber" Width="90px"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
    
    <asp:Button ID="btn_make_an_order" runat="server" Text="Make an order" onclick="Order" Width="233px"/>
    
        </p>
        <p>
            <asp:Label ID="lbl_Cash" runat="server" Text="Cash: "></asp:Label>
            <asp:TextBox ID="txt_cash" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lbl_Credit" runat="server" Text="Credit: "></asp:Label>
            <asp:TextBox ID="txt_credit" runat="server" TextMode="Number"></asp:TextBox>
    
        </p>
        <p>
            <asp:Label ID="lbl_Creditcardnumber0" runat="server" Text="order id: "></asp:Label>
            <asp:TextBox ID="txt_id3" runat="server" MaxLength="20"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn_finish" runat="server" onclick="finish" Text="finish" Width="90px" />
    
        </p>
        <p>
            <asp:Label ID="lbl_Creditcardnumber" runat="server" Text="CreditCard number: "></asp:Label>
            <asp:TextBox ID="txt_cc" runat="server" MaxLength="20"></asp:TextBox>
    
        </p>
        <p>
            <asp:Label ID="lbl_Creditcardnumber1" runat="server" Text="order id: "></asp:Label>
            <asp:TextBox ID="txt_id5" runat="server" MaxLength="20"></asp:TextBox>
            <br />
            <asp:Button ID="btn_finish0" runat="server" onclick="finish1" Text="finish" Width="90px" />
    
        </p>
        <p>
            <asp:Label ID="lbl_order" runat="server" Text="Order number: "></asp:Label>
            <asp:TextBox ID="txt_order" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn_cancel" runat="server" onclick="cancel" Text="Cancel" Width="90px" />
&nbsp;</p>
        <p>
            <asp:Button ID="btn_cancel0" runat="server" onclick="PageView" Text="viewOrders" Width="90px" />
    
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
