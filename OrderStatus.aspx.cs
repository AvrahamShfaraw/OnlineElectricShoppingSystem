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
    public partial class OrderStatus : System.Web.UI.Page
    {
        string str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["Admin"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                TextBox1.Visible = false;
                LabelMonth.Visible = false;
                LabelYear.Visible = false;
                DropDownListMonth.Visible = false;
                DropDownListYear.Visible = false;
                
                Calendar1.Visible = false;
                UpdateBtn.Visible = false;


                DataSet month = new DataSet();
                month.ReadXml(Server.MapPath("~/Month.xml"));
                DropDownListMonth.DataTextField = "Name";
                DropDownListMonth.DataValueField = "Number";
                DropDownListMonth.DataSource = month;
                DropDownListMonth.DataBind();

                DataSet year = new DataSet();
                year.ReadXml(Server.MapPath("~/Year.xml"));
                DropDownListYear.DataTextField = "Number";
                DropDownListYear.DataValueField = "Number";
                DropDownListYear.DataSource = year;
                DropDownListYear.DataBind();

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int month = int.Parse(DropDownListMonth.SelectedValue);
            int year = int.Parse(DropDownListYear.SelectedValue);
           

            Calendar1.VisibleDate = new DateTime(year, month, 1);
            Calendar1.SelectedDate = new DateTime(year, month, 1);
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int month = int.Parse(DropDownListMonth.SelectedValue);
            int year = int.Parse(DropDownListYear.SelectedValue);           
            Calendar1.VisibleDate = new DateTime(year, month, 1);
            Calendar1.SelectedDate = new DateTime(year, month, 1);
        }

        protected void SelectDateImg_Click(object sender, ImageClickEventArgs e)
        {

            if(Calendar1.Visible)
            {
                LabelMonth.Visible = false;
                LabelYear.Visible = false;
                DropDownListMonth.Visible = false;
                DropDownListYear.Visible = false;
                Calendar1.Visible = false;
            }
            else
            {
                TextBox1.Visible = true;
                LabelMonth.Visible = true;
                LabelYear.Visible = true;
                DropDownListMonth.Visible = true;
                DropDownListYear.Visible = true;             
                Calendar1.Visible = true;
            }
            UpdateBtn.Visible = false;
        }

       

        protected void CalendarBtn_Click(object sender, EventArgs e)
        {
            string OrderId = "קוד הזמנה";
            string ProductId = "קוד מוצר";
            string ProductName = "שם מוצר";
            string Price = "מחיר";
            string Quantity = "כמות";
            string OrderDate = "תאריך הזמנה";
            if (TextBox1.Text == "")
            {
                Response.Write("<script>alert('Please Select Date');</script>");
            }
            else
            {
               
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter("select orderid as '"+OrderId+ "', productid as '" + ProductId + "', productname as '" + ProductName + "', price as '" + Price + "', quantity as '" + Quantity + "', orderdate as '" + OrderDate + "' from OrderDetails where orderdate='" + TextBox1.Text.ToString() + "' or status='Pending' ", con);
                DataSet ds = new DataSet();
                sda.Fill(ds, "OrderDetails");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    Response.Write("<script>alert('No Record to Display');</script>");
                }
                else
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    GridView1.Columns[0].Visible = true;
                    UpdateBtn.Visible = true;
                }
                
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            foreach(GridViewRow row in GridView1.Rows)
            {
                string orderid = row.Cells[1].Text;
                RadioButton rb1 = (row.Cells[0].FindControl("RadioButton1")as RadioButton);
                RadioButton rb2 = (row.Cells[0].FindControl("RadioButton2")as RadioButton);
                string status;
                if (rb1.Checked)
         
                    status = rb1.Text;
                
                 else 
                
                    status = rb2.Text;            

                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update OrderDetails set status=@a where OrderId=@b",con);
                cmd.Parameters.AddWithValue("@a",status);
                cmd.Parameters.AddWithValue("@b",orderid);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Write("<script>alert('Status update successfully');</script>");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();

            LabelMonth.Visible = false;
            LabelYear.Visible = false;
            DropDownListMonth.Visible = false;
            DropDownListYear.Visible = false;          
            Calendar1.Visible = false;

        }
        
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
        }

        protected void AllOrder_Click(object sender, EventArgs e)
        {
            string OrderId = "קוד הזמנה";
            string ProductName = "שם מוצר";
            string Price = "מחיר";
            string Quantity = "כמות";
            string OrderDate = "תאריך הזמנה";
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select orderid as '"+OrderId+"',productname as'"+ProductName+"',price as '"+ Price+"',quantity as '"+Quantity+"',orderdate as '"+ OrderDate+"',status as Status from OrderDetails", con);
            DataSet ds = new DataSet();
            sda.Fill(ds,"OrderDetails");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Columns[0].Visible = false;
            UpdateBtn.Visible = false;
        }

        
    }
}