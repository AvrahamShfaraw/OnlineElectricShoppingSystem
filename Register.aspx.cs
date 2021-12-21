using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyFirstWebApplication
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Register(Fname,Lname,Email,Address,Phone,Password) values (@Fname,@Lname,@Email,@Address,@Phone,@Password)", con);
            cmd.Parameters.AddWithValue("@Fname", Fname.Text);
            cmd.Parameters.AddWithValue("@Lname", Lname.Text);
            cmd.Parameters.AddWithValue("@Email", Email.Text);
            cmd.Parameters.AddWithValue("@Address", Address.Text);
            cmd.Parameters.AddWithValue("@Phone", Phone.Text);
            cmd.Parameters.AddWithValue("@Password", Password.Text);
            cmd.ExecuteNonQuery();
            con.Close();

            Session["Email"] = Email.Text;
            Response.Redirect("Default.aspx");
        }
    }
}