using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace MyFirstWebApplication
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        string str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True";
        int pid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["Admin"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                showgrid();
            }
        }
        public void showgrid()
        {
            SqlConnection con = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("Select * from [Product1]", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            showgrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            DropDownList1.SelectedValue = "Select Category";
            showgrid();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            int index = e.NewEditIndex;
            GridViewRow row = (GridViewRow)GridView1.Rows[index];
            Label ProductId = (Label)row.FindControl("Label1");
            pid = Convert.ToInt32(ProductId.Text.ToString());
            SqlConnection con= new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Product1 where ProductId='" + pid + "'",con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
      

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index =pid;
            GridViewRow row = (GridViewRow)GridView1.Rows[index];

            FileUpload fu = (FileUpload)row.FindControl("FileUpload1");
            if(fu.HasFile )
            {
                Label ProductId = (Label)row.FindControl("Label1");
                TextBox Pname = (TextBox)row.FindControl("TextBox1");
                string Pcategory = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("DropDownList2")).Text;
                fu.SaveAs(Server.MapPath("~/Images/") + Path.GetFileName(fu.FileName));
                String Pimage = "Images/" + Path.GetFileName(fu.FileName) ;
                TextBox Pprice = (TextBox)row.FindControl("TextBox2");
                TextBox Pdesc = (TextBox)row.FindControl("TextBox3");
                TextBox Pquantity = (TextBox)row.FindControl("TextBox4");
              
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Product1 set Pname=@1,Pcategory=@2,Pimage=@3,Pprice=@4,Pdesc=@5,Pquantity=@6 where ProductId=@7", con);
                cmd.Parameters.AddWithValue("@1",Pname.Text);
                cmd.Parameters.AddWithValue("@2", Pcategory);
                cmd.Parameters.AddWithValue("@3", Pimage);
                cmd.Parameters.AddWithValue("@4", Pprice.Text);
                cmd.Parameters.AddWithValue("@5",Pdesc.Text);
                cmd.Parameters.AddWithValue("@6", Pquantity.Text);
                cmd.Parameters.AddWithValue("@7", ProductId.Text);
                cmd.ExecuteNonQuery();
                con.Close();
               
                GridView1.EditIndex = -1;
                Response.Write("<script>alert('Prodcut Update Successfuly');</script>");
                showgrid();
                DropDownList1.SelectedValue = "Select Category";

            }
            else
            {
                Response.Write("<script>alert('Please Select Product Image');</script>");
            }
           


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Cname = DropDownList1.SelectedValue.ToString();
            if(Cname == "Select Category" )
            {
                showgrid();
            }
            else
            {
                SqlConnection con = new SqlConnection(str);
                SqlDataAdapter sda = new SqlDataAdapter("Select * from Product1 where Pcategory='" + Cname + "'",con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }



        }

       
    }
}