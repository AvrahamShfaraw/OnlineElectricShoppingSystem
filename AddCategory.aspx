<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="MyFirstWebApplication.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 28px;
        }
        .auto-style2 {
            height: 54px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin:50px;">
    <table align="center" >
        <tr>
            <td colspan="2" align="center">
                <h1 style="font-weight: bold; font-size: medium; font-family: Calibri;">הוספת קטגוריה</h1><br />
            </td>
        </tr>
        <tr>
            
            <td  colspan="2" align="center" style="height:15px">
                <asp:TextBox ID="TextBox1" runat="server" Font-Size="Small" Height="15px" Placeholder="שם קטגוריה" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Font-Size="Smaller" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" class="auto-style2"><br />
                <asp:Button ID="Button1" runat="server" Text="+" style="text-align:center" BackColor="White" BorderColor="White" Font-Bold="True" Font-Size="Small" ForeColor="Black" Height="28px" Width="70px" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style1"><br />

            </td>
        </tr >
        <tr>
            <td  colspan="2" align="center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" DataKeyNames="CategoryId" OnRowUpdating="GridView1_RowUpdating" Width="500px" HorizontalAlign="Center">
                    <Columns>
                        <asp:TemplateField HeaderText="קטוגריה">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("CategoryName") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="False" HeaderText="אפשריות" ShowDeleteButton="True" ShowEditButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:GridView>

            </td>
        </tr>

    </table>
        </div>
    
</asp:Content>
