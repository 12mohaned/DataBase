<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebApplication1.Customer.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
        <asp:GridView ID ="TbCart" runat ="server" AutoGenerateColumns ="false">
    <Columns>
    <asp:boundfield DataField ="serial_no" headertext ="Serial No" />
    <asp:boundfield DataField ="product_name" headertext ="product name" />
    <asp:boundfield DataField ="category" headertext ="category" />
    <asp:boundfield DataField ="product_description" headertext ="product description" />
    <asp:boundfield DataField ="final_price" headertext ="price" />
    <asp:boundfield DataField ="color" headertext ="color" />

    </Columns>
</asp:GridView>
        <div id ="AddToCart">
            <h5>Add To Cart </h5>
        <asp:TextBox id="SerialCartAdd" MaxLength = "20" runat="server" type = "text" placeholder = "Serial No"  />
        <asp:Label runat="server" id ="LabelSerialNumber" />
           
        <asp:Button id="AddCart" runat="server" type ="submit" Text="Add To Cart" onclick="AddtoCart" />     
        <asp:Label runat="server" id ="GeneralLabel"  />
        </div>
        <div>
              <h5>Remove From Cart </h5>
        <asp:TextBox id="SerialCartRemove" MaxLength = "20" runat="server" type = "text" placeholder = "Serial No"  />
        <asp:Label runat="server" id ="LabelSerialNumber2" />
           
        <asp:Button id="RemoveCart" runat="server" type ="submit" Text="Remove From Cart" onclick="RemoveFromCart" />     
         <asp:Label runat="server" id ="GeneralLabel2"  />
        </div>
    </form>
</body>
</html>
<style>
    #GeneralLabel {
    color:red;
    }
    #LabelSerialNumber{
    color:red;
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
</style>