<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="WebApplication1.Customer.Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat ="server">
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

    <form id ="form1" runat ="server">
<asp:GridView ID ="TbProducts" runat ="server" AutoGenerateColumns ="false">
    <Columns>
    <asp:boundfield DataField ="serial_no" headertext ="Serial No" />
    <asp:boundfield DataField ="product_name" headertext ="product name" />
    <asp:boundfield DataField ="category" headertext ="category" />
    <asp:boundfield DataField ="product_description" headertext ="product description" />
    <asp:boundfield DataField ="price" headertext ="price" />
    <asp:boundfield DataField ="available" headertext = "available" />
    <asp:boundfield DataField ="vendor_username" headertext = "vendor username" />
    <asp:buttonfield buttontype="Button" commandname="AddtoCart" HeaderText="Add to Cart" text="Add to Cart"/>
    <asp:buttonfield buttontype="Button" commandname="AddtoWishList" HeaderText="Add to WishList" text="Add to Wish List"/>
    </Columns>
</asp:GridView>
        <div id ="CreditCard">
            <h5>Add Your Credit Card</h5>
        <asp:TextBox id="CardNumber" MaxLength = "20" runat="server" type = "text" placeholder = "Credit Card Number" />
        <asp:Label runat="server" id ="CardNumberLabel" value = "" />

            <br />
            <br />
        <asp:TextBox id="ExpiryDate" MaxLength = "20" runat="server" type = "text" placeholder = "Expiry Date" />
        <asp:Label runat="server" id ="ExpiryDateLabel" value = "" />

            <br />
            <br />
        <asp:TextBox id="cvv_code" MaxLength = "20" runat="server" type = "text" placeholder = "CVV Code" />
        <asp:Label runat="server" id ="CvvCodeLabel" value = "" />
            <br />
            <br />
            <asp:Button id="AddCreditCard" runat="server" type ="submit" Text="Add Credit Card" onclick="AddCredit" />

                    <asp:Label runat="server" id ="CustomerNameLabel" value = "" />

            </div>

        <div id ="WishList">
            <h5>Add a Wish List</h5>

        <asp:TextBox id="WishName" MaxLength = "20" runat="server" type = "text" placeholder = "Wish List Name"   />
        <asp:Button id="AddWish" runat="server" type ="submit" Text="Add WishList" onclick="AddWishList" />         
        <asp:Label runat="server" id ="LabelWishName" value = "Wish List can't be empty" />
        </div>

 
            <h4 id ="WishListHeader">Add a Product to Wish List </h4>
        <asp:Label runat="server" id ="LabelSerialNo" value = "Wish List can't be empty" />
        <asp:TextBox id="WishNameProduct" MaxLength = "20" runat="server" type = "text" placeholder = "WishList Name" />
        <br />
          <br />
        <asp:TextBox id="SerialNo" MaxLength = "20" runat="server" type = "text" placeholder = "Serial No Number" />
        <asp:Label runat="server" id ="LabelWishNameProduct" value = "Wish List can't be empty" />
        <asp:Button id="AddSerialNo" runat="server" type ="submit" Text="Add WishProduct" onclick="AddSerialno" />
        <asp:Label runat="server" id ="GeneralLabel" value = "Wish List can't be empty" />
        </form>
</body>
    
</html>
<style>
    #WishListHeader {
    margin-left:615px;
    }
    #WishNameProduct{
    margin-left:41.5%;
    }
    #SerialNo{
    margin-right:30px;
    }
    #AddSerialNo{
    margin-right:40px;
    }
    #LabelSerialNo{
    color:red;  
    }
    #LabelWishNameProduct{
    color:red;
    }
    #GeneralLabel{
    color:red;
    }
    #SerialNo {
    margin-left:630px;
    }
    #CustomerNameLabel {
    color:red;
    }
    #ExpiryDateLabel {
    color:red;
    }
    #CvvCodeLabel {
    color:red;
    }
   #CardNumberLabel {
   color:red;
    }
    #LabelWishName {
    color:red;
    }
     #WishList {
       margin-left:10px;
      
       }
    #CreditCard {
    margin-top:-10%;
    margin-left:90.8%;
    align-content:center;
    }
    #TbProducts {
    margin-left:320px;
    margin-top:180px;
    border-color:#990000;

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