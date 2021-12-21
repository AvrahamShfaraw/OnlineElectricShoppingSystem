
<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="MyFirstWebApplication.AddToCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="Scripts/bootstrap.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link href="Default.css" rel="stylesheet" type="text/css" />
    <div align="center">
            <table style="width:1100px;">
                <tr>
                    <td  align="center" >
                        <br /><br /><br />
                      <div >
                           <asp:Button ID="ClearBtn" style="text-align:left;" runat="server" Text="נקה את הסל" OnClick="ClearBtn_Click" class="btn btn-dark" Font-Size="Smaller"  />                
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 
                        <asp:Button ID="ContinueShop" runat="server" style="text-align:right;" Text="בחזרה להמשך קניות" class="btn btn-dark" OnClick="ContinueShop_Click" Font-Size="Smaller" />
                      </div><br /><br />
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style2" colspan="3" style="width:1100px;">
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Bold="True" Font-Size="Medium" ForeColor="#333333" OnRowDeleting="GridView1_RowDeleting" CellPadding="4" GridLines="None" HorizontalAlign="Center">
                         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="pid" HeaderText="קוד מוצר">
                            <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                            <ItemStyle BackColor="White" BorderColor="White" BorderStyle="Outset" Font-Bold="True" Font-Size="Medium" ForeColor="Black" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sno" HeaderText="מספר הזמנה">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="White" BorderColor="White" BorderStyle="Outset" Font-Bold="True" Font-Size="Medium" ForeColor="Black" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pname" HeaderText="שם מוצר">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="White" BorderColor="White" BorderStyle="Outset" Font-Size="Medium" ForeColor="Black" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pcategory" HeaderText="קטגוריה מוצר">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="White" BorderColor="White" BorderStyle="Outset" Font-Bold="True" Font-Size="Medium" ForeColor="Black" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pprice" HeaderText="מחיר מוצר">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="White" BorderColor="White" BorderStyle="Outset" Font-Bold="True" Font-Size="Medium" ForeColor="Black" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pquantity" HeaderText="כמות" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ptotalprice" HeaderText="סך הכל" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:ImageField DataImageUrlField="pimage" HeaderText="תמונה">
                                <ControlStyle Height="100px" Width="100px" />
                                <ItemStyle HorizontalAlign="Center" Wrap="True" />
                            </asp:ImageField>
                            <asp:CommandField ShowDeleteButton="True" DeleteText="מחק" HeaderText="מחק" />
                        </Columns>
                         <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                    </td>
                </tr>
                <tr>
                  <td class="auto-style1" colspan="2">
                      &nbsp;</td>
              </tr>
              <tr>
                    <td align="center" class="auto-style1">
                        <asp:Button ID="Payment" runat="server" Text="עבור לתשלום" OnClick="Payment_Click" Font-Bold="True" Font-Names="Calibri" class="btn btn-dark" Font-Size="Small" />
                    </td>
              </tr>         
                 </table>
        </div>

</asp:Content>
