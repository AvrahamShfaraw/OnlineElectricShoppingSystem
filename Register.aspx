<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MyFirstWebApplication.WebForm3" %>

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
		<h2>לקוחות חדשים</h2>
		<p>אנא מלאו טופס זה כדי ליצור חשבון</p>
		<hr>
        <div class="form-group">
			<div class="row">
				<div class="col-xs-6"><asp:TextBox ID="Fname"  runat="server" class="form-control" placeholder="שם פרטי" ></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Fname" ErrorMessage="" ForeColor="Red">הקלד שם פרטי</asp:RequiredFieldValidator>
				</div>
				<div class="col-xs-6"><asp:TextBox ID="Lname" runat="server" class="form-control" placeholder="שם משפחה" ></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Lname" ErrorMessage="" ForeColor="Red">הקלד שם משפחה</asp:RequiredFieldValidator>
				</div>
			</div>        	
        </div>
		<div class="form-group">
			<div class="row">
				<div class="col-xs-6">
					<asp:TextBox ID="Email" runat="server" TextMode="Email"  class="form-control" placeholder="כתובת אימייל" ></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Email" ErrorMessage="" ForeColor="Red">*</asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="" ForeColor="Red" ValidationExpression="(?:[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+)*|&quot;(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*&quot;)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])">האימייל שהוקלד לא תקין</asp:RegularExpressionValidator>
				</div>
				<div class="col-xs-6">
					<asp:TextBox ID="Address" runat="server" class="form-control" placeholder="כתובת מגורים"></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Address" ErrorMessage="" ForeColor="Red">הקלד כתובת מגורים</asp:RequiredFieldValidator>
				</div>
			</div>
		</div>
		<div class="form-group">
			<asp:TextBox ID="Phone" runat="server" TextMode="Phone"  class="form-control" placeholder="הקלד מספר טלפון" ></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Phone" ErrorMessage="" ForeColor="Red">הקלד מס טפלון</asp:RequiredFieldValidator>
		</div>
		<div class="form-group">
			<div calss="row">
				<div class="col-xs-6">
					 <asp:TextBox ID="Password" runat="server" TextMode="Password" class="form-control" placeholder="הקלד סיסמא" ></asp:TextBox>
					 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Password" ErrorMessage="" ForeColor="Red">הקלד סיסמא</asp:RequiredFieldValidator>
				</div>
				<div class="col-xs-6">
					<asp:TextBox ID="Cpassword" runat="server" TextMode="Password"  class="form-control" placeholder="הקלד אימות סיסמא" ></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Cpassword" ErrorMessage="" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="Cpassword" ErrorMessage="" ForeColor="Red">סיסמא ואימות סיסמא אינם נכונים</asp:CompareValidator>
				</div>
			</div>        
        </div>
		<div class="form-group" align="center">
			<asp:Button ID="BtnRegister" runat="server" Text="הרשם" class="btn btn-primary btn-lg" onclick="BtnRegister_Click" />
        </div>
		<div align="center">כבר יש לך חשבון? <asp:HyperLink ID="HyperLink1"  runat="server" Font-Underline="True" ForeColor="blue" NavigateUrl="~/Login.aspx">התחבר כאן</asp:HyperLink></div>
    </form>
	
</div>
</body>
</html>
