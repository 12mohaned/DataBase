<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="WebApplication1.Customer.Wishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <ul>
  <li><a href="#home">Home</a></li>
  <li><a href="#news">Cart</a></li>
  <li><a href="#contact">Contact</a></li>
  <li id ="CreateWishList"><a href ="Wishlist.aspx">Create Wish List</a></li>
  <li style="float:right"><a class="active" href="#about">About</a></li>
</ul>

    <form id ="formwish" runat="server">
        <div id ="div1" runat ="server">
         <asp:TextBox id="Username" MaxLength = "20" runat="server" type = "text" placeholder = "Your Name"   />
        <asp:TextBox id="WishName" MaxLength = "20" runat="server" type = "text" placeholder = "Wish List"   />
        <asp:Button id="AddWishlist" runat="server" type ="submit" Text="Add WishList" OnClick="AddWishList" />
        <asp:Label runat="server" id ="LabelWishName" value = "Wish List can't be empty" />
        </div>
        <div id ="div2">
        <asp:GridView ID ="WishListUser" runat ="server"/>
        </div>
       </form>

</body>
   <style>
       #WishName {
          align-content:center;
       }
       #LabelWishName {
       color:red;
       }
        
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}
    #myTable {
    margin-right:60px;
    }
    #row {
    margin-right:60px;
    }
        #TbProducts {
        margin-bottom:100px;
        align-content:center;
        }
</style>
   
</html>
