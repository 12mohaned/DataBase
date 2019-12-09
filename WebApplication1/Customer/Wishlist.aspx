<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="WebApplication1.Customer.Wishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div class="navbar">
  <a href="Customer.aspx">Home</a>
  <a href="#news">Contact us</a>
  <div class="dropdown">
    <button class="dropbtn">Settings
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="Cart.aspx">Your Cart </a>
      <a href="WishList.aspx">Your Wish List(s)</a>
      <a href="CreditCard.aspx">Payement and Credit Card</a>
    </div>
  </div>
</div>

    <form id ="formwish" runat="server">
      
        <div id ="div1">
        <asp:GridView ID ="WishListUser" runat ="server" AutoGenerateColumns ="false">
         <Columns>
         <asp:boundfield DataField ="serial_no" headertext ="Serial No" />
         <asp:boundfield DataField ="product_description" headertext ="product description" />
    </Columns>
</asp:GridView>
            </div>
                <h5>Search which WishListProduct You Want to See</h5>
                <asp:TextBox id="WishListProductName" MaxLength = "20" runat="server" type = "text" placeholder = "Enter WishList Product Name"  />
                <asp:Button id="WishProductButton" runat="server" type ="submit" Text="Search Your Wish List" onclick="SearchProduct" />                  

                <div id ="div2">
        <asp:TextBox id="RemoveSerialFromWishList" MaxLength = "20" runat="server" type = "text" placeholder = "Serial No"  />
        <asp:Label runat="server" id ="LabelRemoveSerial" />
        <asp:TextBox id="AddWishListName" MaxLength = "20" runat="server" type = "text" placeholder = "Wish List Name"  />
        <asp:Label runat="server" id ="LabelAddWishListName" />
        <asp:Label runat="server" id ="GeneralLabel" />
        <asp:Button id="RemoveWishList" runat="server" type ="submit" Text="Remove From Wish List" onclick="RemoveFromWishList" />                  
                </div>

       </form>

</body>
   
</html>
 <style>
     #WishListProductName {
     margin-bottom:100px;
     }
     #LabelRemoveSerial{
         color:red;
     }
     #LabelAddWishListName{
         color:red;
     }
     #GeneralLabel{
         color:red;
     }

       #div1 {
       margin-left:660px;
        margin-top:15%;
       }
       #WishName {
          align-content:center;
       }
       #LabelWishName {
       color:red;
       }
        

    #myTable {
    margin-right:60px;
    }
  .navbar {
  overflow: hidden;
  background-color: #990000;;
  font-family: Arial;
}

/* Links inside the navbar */
.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* The dropdown container */
.dropdown {
  float: left;
  overflow: hidden;
}

/* Dropdown button */
.dropdown .dropbtn {
  font-size: 16px;
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit; /* Important for vertical align on mobile phones */
  margin: 0; /* Important for vertical align on mobile phones */
}

/* Add a red background color to navbar links on hover */
.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

/* Dropdown content (hidden by default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

/* Add a grey background color to dropdown links on hover */
.dropdown-content a:hover {
  background-color: red;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}
        #TbProducts {
        margin-bottom:100px;
        align-content:center;
        }
</style>