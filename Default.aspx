<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyFirstWebApplication.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

    <style type="text/css">
        .auto-style7 {
            width: 102px;
            height: 50px;
        }
        .form-control input {
        border: 2px solid #f0f0f0;
        border-radius: 4px;
        display: block;
        font-family: inherit;
        font-size: 14px;
        padding: 5px;
        width: 100%;
    }

        .form-control input:focus {
            outline: 0;
            border-color: #777;
        }
        .auto-style9 {
            width: 1100px;
        }
    </style>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" > 
    <script src="Scripts/bootstrap.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link href="Default.css" rel="stylesheet" type="text/css" />
   
    <br />  <br />
  
    <table dir="rtl" style=" margin:0 auto;" class="auto-style9"  >
        <tr style="width:1100px;text-align:right;"  > 
            <td style="text-align:center;" class="auto-style7">               
                <asp:Button ID="Login" runat="server" Text="התחבר" class="btn btn-dark" Font-Names="Arial" onclick="Login_Click" />
            </td>
            <td style="text-align:right;" class="auto-style4">
                <asp:Button ID="Logout" runat="server" Text="התנתק" class="btn btn-dark" Font-Nmae="Arial" OnClick="Logout_Click" Font-Names="Arial"  />
                <asp:Label ID="UserName" runat="server" Text="Label" Font-Bold="True" Font-Size="Small" Font-Names="Arial"></asp:Label>
            </td>
            <td style="text-align:right;" >
                <div  class="form-control">
                    <asp:TextBox ID="TextBox1" runat="server"  CssClass="input" placeholder="חפש מוצר לפי שם מוצר.." ></asp:TextBox>
                </div>
                        
            </td>
            <td style="text-align:right;">             
                <asp:Button ID="SearchBtn" runat="server"  Text="חפש" Font-Names="Arial" class="btn btn-primary btn-lg" OnClick="SearchBtn_Click" />           
            </td>           
       </tr>   
    </table> 
    <table >
       <tr>
           <td colspan="5" style="text-align:center;">
                 <asp:Label ID="SearchEror" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="Medium"></asp:Label>
           </td>
      </tr>
   </table>

    <br />
    <br />
    <br />  
    <br />   
    <asp:DataList ID="d1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" Width="930px" align="center" OnItemCommand="d1_ItemCommand" DataKeyField="ProductId">
        <ItemTemplate>
           <table align="center" >
               <tr>
                   <td align="center" class="auto-style6">
                       <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="clibiri" Font-Size="Smaller" Text='<%#Eval("Pname") %>' ForeColor="Black"></asp:Label>
                   </td>
               </tr>
               <tr>
                   <td align="center" class="auto-style6">
                       <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%#Eval("Pimage") %>' />
                       <div class="stock">
                       &nbsp;מלאי:&nbsp;
                       <asp:Label ID="Label5" runat="server" Text='<%#Eval("Pquantity") %>' BackColor='<%#(int)Eval("Pquantity") < 1 ? System.Drawing.Color.Red : System.Drawing.Color.GreenYellow %>'></asp:Label>
                   </div>
                   </td>
                   
               </tr>
               <tr>
                   <td class="auto-style6" align="center">
                       <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="clibiri" Font-Size="Smaller" Text='<%#Eval("Pprice")+" $" %>' ForeColor="Black"></asp:Label>
                  
              
                   
                       &nbsp;&nbsp;&nbsp;
                  
              
                   
                       <asp:DropDownList ID="DropDownList1" CssClass="dd1"  runat="server">
                           <asp:ListItem>1</asp:ListItem>
                           <asp:ListItem>2</asp:ListItem>
                           <asp:ListItem>3</asp:ListItem>
                           <asp:ListItem>4</asp:ListItem>
                           <asp:ListItem>5</asp:ListItem>
                           <asp:ListItem>6</asp:ListItem>
                           <asp:ListItem>7</asp:ListItem>
                           <asp:ListItem>8</asp:ListItem>
                           <asp:ListItem>9</asp:ListItem>
                       </asp:DropDownList>
                   </td>
               </tr>
               <tr>
                  <td align="center" class="auto-style6">
                       <asp:Button ID="addtocart" class="highlight-button btn btn-very-small button xs-no-margin" runat="server" Text="הוסף לסל" CommandArgument='<%#Eval("ProductId") %>' CommandName="AddToCart" Font-Bold="True" Font-Size="XX-Small"  />
                  </td>
               </tr>
           </table>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product1]"></asp:SqlDataSource>
    <%--  SqlDataSource--%>
    </asp:Content>
