<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="MyFirstWebApplication.OrderStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
            <asp:LinkButton ID="AllOrder" runat="server" OnClick="AllOrder_Click">הצג את כל ההזמנות</asp:LinkButton>          
    
              <div class="date" align="center" dir="rtl">
                  <b>בחר תאריך:</b>
                        <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" Width="122" ></asp:TextBox>
                        <asp:ImageButton ID="SelectDateImg" runat="server" ImageUrl="~/Images/calendar.png" Width="30" OnClick="SelectDateImg_Click" />    
                        <asp:DropDownList ID="DropDownListYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                        <asp:Label ID="LabelYear" runat="server" Text="שנה" Font-Bold="True"></asp:Label>    
                        <asp:DropDownList ID="DropDownListMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
                        <asp:Label ID="LabelMonth" runat="server" Text="חודש" Font-Bold="True"></asp:Label>
                  <br />
              </div>
            
             <div class="calender" align="center">
                 <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="White"  Font-Names="Verdana" ForeColor="Black"  NextPrevFormat="FullMonth" >
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
                 <br />
                  <asp:Button ID="CalendarBtn" runat="server" Text="בחר" Font-Bold="True" OnClick="CalendarBtn_Click" />
             </div>
            
            
           
            <br />
            <div class="grid" align="center">
                  <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center" CellPadding="4">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="סטאטוס הזמנה">
                    <ItemTemplate>
                        <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="Ostatus" Text="Pending"  />
                        <asp:RadioButton ID="RadioButton2" runat="server"  GroupName="Ostatus"  Text="Complete" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BorderStyle="None" HorizontalAlign="Center" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle HorizontalAlign="Center" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
                <br />
                <asp:Button ID="UpdateBtn" runat="server" Text="עדכן סטאטוס" Font-Bold="True" OnClick="UpdateBtn_Click" />
            </div>
          
            <br />
           
            
   
   
</asp:Content>
