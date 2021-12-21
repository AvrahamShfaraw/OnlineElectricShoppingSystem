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
    public partial class Default : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (Session["rowcount"] != null)
                {
                    Label2.Text = Session["rowcount"].ToString();
                }
                else
                {
                    Label2.Text = "0";
                }

            
               
            
        }

        protected void timer_Tick(object sender, EventArgs e)
        {
            Random r = new Random();
            int i = r.Next(2, 12);
            Image2.ImageUrl = "~/Images/"+ i.ToString()+".png";
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddToCart.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if(Session["Email"] != null)
            {
                SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True");
                SqlDataAdapter sda = new SqlDataAdapter("select * from OrderDetails where email='" +Session["Email"].ToString() + "' ", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    Response.Redirect("UserProductStatus.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Image3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}