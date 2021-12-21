<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProductList.aspx.cs" Inherits="MyFirstWebApplication.UserProductList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center" dir="rtl">
            <div>
                <br />
                <asp:LinkButton ID="UserOdrListBtn" runat="server" OnClick="UserOdrListBtn_Click" Font-Underline="False"> רשימת הזמנות שלי</asp:LinkButton>
                <br />
                &nbsp;
            </div>

            <b> הקלד קוד הזמנה:</b>
            <asp:TextBox ID="OdrTxtId" runat="server"></asp:TextBox>
            &nbsp;

            <asp:Button ID="SelectOdrId" runat="server" Text="בחר" BackColor="White" BorderColor="White" BorderWidth="2px" CssClass="button" ForeColor="Black" OnClick="SelectOdrId_Click" />
            <br />
            <br />

            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound1" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="תמונה">                      
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("תמונה") %>' Height="100px" Width="100px" />
                        </ItemTemplate>                       
                    </asp:TemplateField>
                </Columns>                
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <br />
            <div>
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="Green" NavigateUrl="~/UserProductStatus.aspx">חזור לדף הקודם</asp:HyperLink>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="Green" NavigateUrl="~/Default.aspx">לדף הבית</asp:HyperLink>
                &nbsp;&nbsp;&nbsp;</div>


        </div>
    </form>
</body>
</html>
