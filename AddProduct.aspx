<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="MyFirstWebApplication.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" dir="rtl">
                <tr>
                    <td colspan="2">
                        <div align="center"> <h1 style="text-align:center" >הוספת מוצר</h1>
                        <hr /></div>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <h3>שם מוצר:</h3> </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" Display="Dynamic" Font-Bold="True" Font-Size="Smaller" Font-Strikeout="False" ForeColor="Red" ErrorMessage="הקלד שם מוצר">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3 >קטגוריה:</h3>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryName" Width="189px"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="בחר קטגוריה" ControlToValidate="DropDownList1" Display="Dynamic" Font-Bold="True" Font-Size="Smaller" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>העלאת תמונה:</h3></td>
                    <td>
                        <asp:FileUpload ID="imageUpload1" runat="server" BackColor="White" BorderColor="White" ForeColor="Black" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="imageUpload1" Display="Dynamic" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" ErrorMessage="העלאת תמונה חובה"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                       <h3>מחיר מוצר:</h3></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" Display="Dynamic" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" ErrorMessage="הקלד מחיר מוצר">*</asp:RequiredFieldValidator>
                   </td>
                </tr>
                <tr>
                    <td>
                        <h3>תיאור מוצר:</h3>
                    </td>
                     <td>
                         <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                         <h3>כמות :</h3>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3" Display="Dynamic" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" ErrorMessage="הקלד כמות">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="כמות מוצר בין 0-9" Font-Bold="True" Font-Size="Small" ForeColor="Red" ValidationExpression="[0-9]">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Add+" BackColor="White" BorderColor="White" ForeColor="Black" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="productid" HeaderText="קוד מוצר" />
                                <asp:BoundField DataField="pname" HeaderText="שם מוצר" />
                                <asp:BoundField DataField="pcategory" HeaderText="קטגוריה" />
                                <asp:BoundField DataField="pimage" HeaderText="ניתוב תמונה" />
                                <asp:BoundField DataField="pprice" HeaderText="מחיר מוצר" />
                                <asp:BoundField DataField="pdesc" HeaderText="תיאור מוצר" />
                                <asp:BoundField DataField="pquantity" HeaderText="כמות " />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                
        
            </table>
      <div>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryName] FROM [Categories]"></asp:SqlDataSource>

                                    

        </div>
    <div>

    </div>

</asp:Content>
