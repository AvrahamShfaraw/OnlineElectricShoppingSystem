using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MyFirstWebApplication
{
    public partial class UserProductList : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True");
        string emailId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["Email"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        protected void UserOdrListBtn_Click(object sender, EventArgs e)
        {
            string OrderId = "קוד הזמנה";
            string ProductImage = "תמונה";
            string ProductName = "שם מוצר";
            string Price = "מחיר";
            string Quantity = "כמות";
            string Status = "סטאטוס הזמנה";
            string OrderDate = "תאריך הזמנה";
            

            if (Session["Email"] != null)
            {
                emailId = Session["Email"].ToString();
                SqlDataAdapter sda = new SqlDataAdapter("select odr.orderid as '"+OrderId+ "', odr.productname as '" + ProductName + "', pdt.Pimage as '" + ProductImage + "', odr.price as '" + Price + "', odr.quantity as '" + Quantity + "', odr.orderdate as '" + OrderDate + "', odr.status as '" + Status + "' from OrderDetails odr inner join Product1 pdt on pdt.ProductId = odr.productid where email='" + emailId + "'", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string status = dt.Rows[i][6].ToString();
                    if (status == "Pending")
                    {
                        dt.Rows[i][6] = "נשלח";
                    }
                    else
                    {
                        dt.Rows[i][6] = "נמסר";
                    }
                    status = "";
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();
                OdrTxtId.Text = string.Empty;


            }
        }
        protected void SelectOdrId_Click(object sender, EventArgs e)
        {
            string OrderId = "קוד הזמנה";
            string ProductImage = "תמונה";
            string ProductName = "שם מוצר";
            string Price = "מחיר";
            string Quantity = "כמות";
            string Status = "סטאטוס הזמנה";
            string OrderDate = "תאריך הזמנה";

            emailId = Session["Email"].ToString();
            SqlDataAdapter sda = new SqlDataAdapter("select odr.orderid as '" + OrderId + "', odr.productname as '" + ProductName + "', pdt.Pimage as '" + ProductImage + "', odr.price as '" + Price + "', odr.quantity as '" + Quantity + "', odr.orderdate as '" + OrderDate + "', odr.status as '" + Status + "' from OrderDetails odr inner join Product1 pdt on pdt.ProductId = odr.productid where email='" + emailId + "' and odr.orderid like '" + OdrTxtId.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
           
            
            if (dt.Rows.Count > 0)
            {
                string status = dt.Rows[0][6].ToString();
                if (status == "Pending")
                {
                    dt.Rows[0][6] = "נשלח";
                }
                else
                {
                    dt.Rows[0][6] = "נמסר";


                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('invailed Order id');</script>");
            }

        }

       

        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            

            e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;

            e.Row.Cells[3].Visible = false;
        }

    }
}