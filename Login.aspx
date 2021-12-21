<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyFirstWebApplication.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" runat="server" media="screen" href="Register.css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
		

</head>
<body>
  <div class="signup-form">
    <form id="form1" runat="server">
		<h2>כניסה לחשבונך</h2>
		
		<hr/>
		<div class="form-group">
					<asp:TextBox ID="Email" runat="server" TextMode="Email"  class="form-control" placeholder="כתובת אימייל" ></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Email" ErrorMessage="" ForeColor="Red">*</asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">האימייל שהוקלד לא תקין</asp:RegularExpressionValidator>
		</div>
		<div class="form-group">
					<asp:TextBox ID="Password" runat="server" TextMode="Password" class="form-control" placeholder="הקלד סיסמא" ></asp:TextBox>
				    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Password" ErrorMessage="" ForeColor="Red">הקלד סיסמא</asp:RequiredFieldValidator>
		</div>	
		<div class="form-group" align="center">
			<asp:Button ID="BtnLogin" runat="server" Text="התחבר" OnClick="BtnLogin_Click"  class="btn btn-primary btn-lg"  /> 
        </div>
		<div class="form-group">
			<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
		</div>
    </form>
	<div class="hint-text">טרם נרשמת לאתר? <a href="Register.aspx" style="color:blue">הרשם כאן</a></div>
</div>
</body>
</html>
