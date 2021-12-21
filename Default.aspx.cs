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
    public partial class Default1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["Email"] != null)
                {
                    string email = Session["Email"].ToString();
                    UserName.Text = "";
                    for (int i = 0; email[i] != '@'; i++)
                    {
                        UserName.Text += email[i];
                    }                    

                    Login.Visible = false;
                    Logout.Visible = true;
                }
                else
                {
                    UserName.Text = "";
                    Login.Visible = true;
                    Logout.Visible = false;
                }

            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session["Buyitems"] = null;
            UserName.Text = "";
            Login.Visible = true;
            Logout.Visible = false;
        }

      
        
        protected void d1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //Session["addproduct"] = "true";
            if(e.CommandName=="AddToCart")
            {
                DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                Response.Redirect("AddToCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString());
                
            }
        }

       

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True");
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM [Product1] WHERE (Pname like'%" + TextBox1.Text + "%')", con);
            DataTable data = new DataTable();
            sda.Fill(data);
            if (data.Rows.Count == 0)
            {
                SearchEror.Text = ".." + "החיפוש לא נמצא";
                SearchEror.ForeColor = System.Drawing.Color.Red;
            }
            d1.DataSourceID = null;
            d1.DataSource = data;
            d1.DataBind();
            con.Close();
        }



      
    }
}