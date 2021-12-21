<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Order_Confirmation.aspx.cs" Inherits="MyFirstWebApplication.Order_Confirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <table dir="rtl" >
                <tr>
                    <td class="auto-style2" align="center">
                        <asp:Button ID="Button1" runat="server" Text=" הורדה" OnClick="Button1_Click" BackColor="White" BorderColor="White" Font-Bold="True" Font-Names="clibiri" ForeColor="Black" Width="211px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td class="auto-style1" align="center">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink  ID="HyperLink1" runat="server"  Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="~/Default.aspx" BorderColor="Black" BackColor="White" Width="100px">דף הבית</asp:HyperLink>
                    </td>
                </tr>
            </table>          
            <asp:Panel ID="Panel1" runat="server" Direction="RightToLeft" align="center" Width="1016px">
                <table border="1" align="center">
                    <tr>
                        <td style="text-align:center" >
                            <h1 style="text-align:center;font:bold arial,verdana;">אישור הזמנה</h1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            מס הזמנה:
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />        
                            תאריך הזמנה:
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br />
                            שעה:
                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label><br />
                            שם לקוח:
                            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label><br />
                             מייל לקוח:
                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr> 
                         <td class="auto-style4" >
                          כתובת לקוח : <asp:Label ID="Label3" runat="server" Text="Label" style="text-align:center;"></asp:Label>
                        </td>
                      </tr>
                    <tr>
                        <td>                          
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="1000px" HorizontalAlign="Center">
                                <Columns>
                                    <asp:BoundField DataField="sno" HeaderText="sno">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pid" HeaderText="קוד מוצר">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pname" HeaderText="שם מוצר">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="quantity" HeaderText="כמות">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="price" HeaderText="מחיר">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="totalprice" HeaderText="מחיר כולל">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:GridView>                       
                        </td>
                    </tr>
                    <tr>
                        <td>
                            סך הכל:
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><h3 style="text-align:center;">תודה שקנית אצלנו !!</h3> </td>
                    </tr>
                </table>
            </asp:Panel>
</asp:Content>
