<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="קונסולות וגיימינג.aspx.cs" Inherits="MyFirstWebApplication.Category.קונסולות_גיימינג" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="Scripts/bootstrap.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link href="Default.css" rel="stylesheet" type="text/css" />
    <br />  <br />
  
    <br />  <br />
  

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
                       <asp:Button ID="Button1" class="highlight-button btn btn-very-small button xs-no-margin" runat="server" Text="הוסף לסל" CommandArgument='<%#Eval("ProductId") %>' CommandName="AddToCart" Font-Bold="True" Font-Size="XX-Small" />
                  </td>
               </tr>
           </table>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product1]"></asp:SqlDataSource>
    <%--  SqlDataSource--%>
</asp:Content>
