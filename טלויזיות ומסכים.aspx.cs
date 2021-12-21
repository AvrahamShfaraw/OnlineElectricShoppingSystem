using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyFirstWebApplication.Category
{
    public partial class טלויזיות_מסכים : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string category = "TV";
                SqlConnection SqlDataSource1 = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True");
                SqlDataAdapter sda = new SqlDataAdapter("select * from Product1 where Pcategory ='" + category + "'", SqlDataSource1);
                DataTable dt = new DataTable();

                sda.Fill(dt);
                d1.DataSourceID = null;
                d1.DataSource = dt;
                d1.DataBind();


            }

        }

        protected void d1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = "true";
            if (e.CommandName == "AddToCart")
            {
                DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                Response.Redirect("AddToCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString());

            }
        }
    }
}