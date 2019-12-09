<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegister.aspx.cs" Inherits="WebApplication1.CustomerRegister" %>
<!DOCTYPE html>
<html>
<head runat="server">
        <link rel="stylesheet" type="text/css" href="CustomerRegister.css" />
    <title>Default</title>
</head>
<body>
        <div id="login-box">
    <form id="form1" runat="server">
        <h2 id="signup">Sign up as a customer</h2>

              <div class="left">
        <asp:Label runat="server" id ="LabelUsername" value = "Username can't be empty" />

          <asp:TextBox id="user" MaxLength = "20" runat="server" type = "text" placeholder = "Username"/>
        <asp:TextBox id="FirstName" MaxLength = "20" runat="server" type = "text" placeholder = "FirstName"  />

        <asp:Label runat="server" id ="LabelFirstname" value = "Firstname can't be empty" />

        <asp:TextBox id="LastName"  MaxLength = "20" runat="server" type = "text" placeholder = "LastName"/> 
        <asp:Label runat="server" id ="LabelLastname" value = "Last Name can't be empty" />

        <asp:TextBox id="Email" MaxLength = "50" runat="server" type ="text" placeholder = "Email"/>
        <asp:Label runat="server" id ="LabelEmail" value = "Email can't be empty" />

        <asp:TextBox id="Password" MaxLength = "20" runat="server" TextMode ="Password" placeholder = "Password"/>
        <asp:Label runat="server" id ="LabelPassword" value = "Password can't be empty" />

        <asp:TextBox id="Repeat_Password"  MaxLength = "20" runat="server" TextMode ="Password" placeholder = "Re-Type Password"/>
        <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="Repeat_Password" errormessage="Please enter your name!" />

        <asp:Button id="Signup" runat="server" type ="submit" Text="Sign up" OnClick="Register"  />      
        </div>
        </form>
        </div>
</body>

</html>