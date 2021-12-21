using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyFirstWebApplication
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
              
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (imageUpload1.HasFile)
            {
                SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True");
                string filename = imageUpload1.PostedFile.FileName;
                string filepath = "Images/" + imageUpload1.FileName;
                imageUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Product1 values('" + TextBox1.Text + "','" + DropDownList1.SelectedItem.Text + "','" + filepath + "','" + TextBox2.Text + "','" + TextBox4.Text + "','" + TextBox3.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Product added successful');</script>");
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox4.Text = "";
                TextBox3.Text = "";
                showgrid();
            }
            else
            {
                Response.Write("Add Image");
            }
            

           

        }

        public void showgrid()
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True");

            SqlDataAdapter sda = new SqlDataAdapter("select * from Product1 ", con);
            DataTable dt = new DataTable();

            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}