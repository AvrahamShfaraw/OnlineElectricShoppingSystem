using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace MyFirstWebApplication
{
    public partial class AddCategory : System.Web.UI.Page
    {
        string str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showgrid();
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection con1 = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("select * from Categories where CategoryName='" + TextBox1.Text.ToString() + "'", con1);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                Response.Write("<script>alert('This Category is Already Present');</script>");
            }
            else
            {

                SqlConnection con2 = new SqlConnection(str);
                con2.Open();
                SqlCommand cmd1 = new SqlCommand("insert into Categories values(@CategoryName)", con2);
                cmd1.Parameters.AddWithValue("@CategoryName", TextBox1.Text);
                cmd1.ExecuteNonQuery();
                con2.Close();
                Response.Write("<script>alert('One Record added');</script>");
                TextBox1.Text = "";
                showgrid();
            }
        }

        public void showgrid()
        {
            SqlConnection con = new SqlConnection(str);

            SqlDataAdapter sda = new SqlDataAdapter("select * from Categories ", con);
            DataTable dt = new DataTable();

            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.EditIndex = e.NewPageIndex;
            showgrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            showgrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int cid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete from Categories where CategoryId=@1", con);
            cmd.Parameters.AddWithValue("@1", cid);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Category Deleted Successful');</script>");
            showgrid();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            showgrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int Cid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string categoryName = (row.FindControl("TextBox2") as TextBox).Text;
            SqlConnection con3 = new SqlConnection(str);
            con3.Open();
            SqlCommand cmd2 = new SqlCommand("Update Categories set CategoryNmae=@1 where CatedoryId=@2", con3);
            cmd2.Parameters.AddWithValue("@1", categoryName);
            cmd2.Parameters.AddWithValue("@2", Cid);
            cmd2.ExecuteNonQuery();
            con3.Close();
            Response.Write("<script>alert('Category Update Successful');</script>");
            GridView1.EditIndex = -1;
        }

        
    }


}