<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="MyFirstWebApplication.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
       <title></title>
    <link href="Default.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
       <asp:DataList ID="d1" runat="server" Font-Name="Verdana" Font-Size="Small" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" Width="600px" align="center" OnItemCommand="d1_ItemCommand" DataKeyField="ProductId">

        <ItemTemplate>
            <div id="pricePlans">
                <ul id="plans">
                    <li class="plan">
                        <ul class="planContainer">
                            <li class="title">
                                <h2>
                                   <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="clibiri" Font-Size="Smaller" Text='<%#Eval("Pname") %>' ForeColor="Black"></asp:Label></h2>
                            </li>
                            <li class="title">
                                   <asp:Image ID="Image1" runat="server" Height="150px" Width="150px" ImageUrl='<%#Eval("Pimage") %>' />
                            </li>
                            <li>
                                <ul class="options">
                                    <li><span>
                                      <asp:Label ID="Label5" runat="server" Text='<%#Eval("Pquantity") %>' BackColor='<%#(int)Eval("Pquantity") < 1 ? System.Drawing.Color.Red : System.Drawing.Color.GreenYellow %>'></asp:Label>
                                        </span></li>
                                     <li><span>
                                         <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="clibiri" Font-Size="Smaller" Text='<%#Eval("Pprice") %>' ForeColor="Black"></asp:Label>
                                        </span></li>
                                     <li><span>
                                        <asp:DropDownList ID="DropDownList1" runat="server">
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
                                        </span></li>
                                </ul>                         
                            </li>
                            <li class="button">
                                <asp:Button CssClass="a" ID="Button1" runat="server" Text="add to cart" CommandArgument='<%#Eval("ProductId") %>' CommandName="AddToCart" /> </li>
                        </ul>
                    </li>
                </ul>
            </div>



        </ItemTemplate>
    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product1]"></asp:SqlDataSource>
    <%--  SqlDataSource--%>

     
    </form>
</body>
</html>
