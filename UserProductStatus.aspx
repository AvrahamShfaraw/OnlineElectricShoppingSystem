<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProductStatus.aspx.cs" Inherits="MyFirstWebApplication.UserProductStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .progress{

        }
        ul{
            text-align:center;
        }
        ul li{
            display:inline-block;
            width:200px;
            position:relative;
        }
        ul li .fa{
            background:#ccc;
            width:16px;
            height:16px;
            color:white;
            border-radius:50%;
            padding:5px;
        }
        ul li .fa::after{
            content:'';
            background:#ccc;
            height:5px;
            width:205px;
            display:block;
            position:absolute;
            left:0;
            top:10px;
            z-index:-1;
        }
        ul li:nth-child(1) .fa{
            background:#148e14;

        }
        ul li:nth-child(1) .fa::after{
             background:#148e14;
        }
        ul li:first-child .fa::after{
            width:105px;
            left:100px;
        }
        ul li:last-child .fa::after{
            width:105px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
       

        <div align="center">

            <marquee direction="left" runat="server" scrollamount='<%# val %>'><strong>  
               <asp:Image ID="img" runat="server" ImageUrl="~/Images/delivery-car (1).png" /></strong></marquee>  
          
             <hr />
            <h1>Recent Delivery Status</h1>
            <b>Order ID:</b><asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="Black"></asp:Label>
        </div>
        <div class="progress" align="center">
            <ul align="center">
                <li>
                    <i class="fa fa-check" aria-hidden="true" align="center"></i>
                    <p><b>נשלח</b></p>
                </li>
                <li>
                    <i class="fa fa-check" aria-hidden="true" align="center"></i>
                    <p><b>נמסר</b></p>
                </li>
            </ul>
        </div>
        <br /><br />
        <div align="center">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UserProductList.aspx" Font-Underline="False">check all ordered products </asp:HyperLink>
        </div>
        <br />
        <div align="center">
            <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="False" NavigateUrl="~/Default.aspx">back to HOME page</asp:HyperLink>
        </div>
    </form>
</body>
</html>
