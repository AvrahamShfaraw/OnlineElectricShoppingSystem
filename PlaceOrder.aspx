<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="MyFirstWebApplication.PlaceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   
        <div  >
            <table align="center" style="margin-top:30px;" bgcolor="black">
                <tr>
                    <td colspan="2" align="center" class="auto-style1" >
                        פרטי כרטס</td>
                </tr>
                <tr>
                    <td align="left" >
                        <asp:TextBox ID="TextBox1" runat="server"  Font-Bold="True" Font-Size="Small" ForeColor="Black" placeholder="First Name" BorderWidth="2px"  Width="150px" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^[A-Za-z]*$" ErrorMessage="First Nmae must be in characters" ControlToValidate="TextBox1" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" >*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="First Name is Empty" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                
                    <td align="center" >
                        <asp:TextBox ID="TextBox2" runat="server"   Font-Bold="True" Font-Size="Small" ForeColor="Black" placeholder="Last Name" BorderWidth="2px"  Width="150px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^[A-Za-z]*$" ErrorMessage="Last Nmae must be in characters" ControlToValidate="TextBox2" Font-Bold="True" Font-Size="X-Small" ForeColor="Red">*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Last Name is Empty" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Image ID="Image1" runat="server" BorderWidth="2px" ImageUrl="~/Images/109-credit-cards-accepted-logo.jpg" Width="300px" />
                    </td>
                </tr>
               
                <tr>
                    <td colspan="2" align="left" class="auto-style2">

                        מספר כרטיס</td>
                </tr>
                <tr>
                    <td colspan="2" align="left">
                        <asp:TextBox ID="TextBox3" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Black" placeholder="16 Digits" BorderWidth="2px" Width="250px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationExpression="[0-9]{16}" ErrorMessage="Card Number must be of 16 digits" ControlToValidate="TextBox3" Font-Bold="True" Font-Size="X-Small" ForeColor="Red">*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Card number is Empty" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red">*</asp:RequiredFieldValidator>
                    
                     </td>
                </tr>
                <tr>
                    <td align="left"  >
                        <asp:Label ID="Label3" runat="server" Text="Expiry Date" Font-Bold="True" ForeColor="White" Font-Names="Arial" Font-Size="XX-Small"></asp:Label>
                    </td>
                    <td align="left" >
                        <asp:Label ID="Label4"  runat="server" Text="CWW" Font-Bold="True" ForeColor="White" Font-Names="Arial" Font-Size="Smaller" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" >

                        <asp:TextBox ID="TextBox4" runat="server" Font-Size="Small" ForeColor="Black" placeholder="MM/YY(Eg:061996)" BorderWidth="2px" Width="120px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Expiry Date is Empty" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red">*</asp:RequiredFieldValidator>

                    </td>
                    <td  align="left">
                         <asp:TextBox ID="TextBox5" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Black" placeholder="3 Digits" BorderWidth="2px" Width="50px"  ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationExpression="[0-9]{3}" ErrorMessage="CWW Number must be of 3 digits" ControlToValidate="TextBox5" Font-Bold="True" Font-Size="X-Small" ForeColor="Red">*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="CWW is Empty" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                         <asp:TextBox ID="TextBox6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Black" Height="100px"  TextMode="MultiLine" BorderWidth="2px" Placeholder="Billing Address include your country-city-adress" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Address is Empty" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="height:50px;" >
                        <asp:Button ID="Button1"  runat="server" Text="שלח" BackColor="Black" BorderColor="black" BorderWidth="2px" Font-Bold="True" Font-Size="Large" ForeColor="White" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" >
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Fix The erros" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"  >
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/AddToCart.aspx" Font-Overline="False" Font-Underline="False" ForeColor="Blue" Font-Names="Calibri">הדף הקודם</asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" NavigateUrl="~/Default.aspx" Font-Underline="False" ForeColor="Blue" Font-Names="Calibri">דך הבית</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>

</asp:Content>
