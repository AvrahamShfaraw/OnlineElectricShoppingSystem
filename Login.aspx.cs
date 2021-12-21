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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Email"] != null)
                {
                    Response.Write("Default.aspx");
                }
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True");
            con.Open();
            string check = "select * from Register where Email='" + Email.Text + "'and Password ='" + Password.Text + "'";
            SqlDataAdapter sda = new SqlDataAdapter(check, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            if (Email.Text == "Admin@gmail.com" && Password.Text == "123")
            {
                Session["Admin"] = Email.Text;
                Response.Redirect("AdminHome.aspx");
            }
            else if (data.Rows.Count == 1)
            {

                Session["Email"] = Email.Text;
                Session["Buyitems"] = null;
                SavedCart();

                Response.Redirect("Default.aspx");

            }
            else
            {
                Label1.Text = "נסה שוב . סיסמא או שם משתמש שגויים";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            con.Close();
        }
        private void SavedCart()
        {
            DataTable dt = new DataTable();
            DataRow dr;

            dt.Columns.Add("Sno");
            dt.Columns.Add("Pid");
            dt.Columns.Add("Pname");
            dt.Columns.Add("Pcategory");
            dt.Columns.Add("Pimage");
            dt.Columns.Add("Pprice");
            dt.Columns.Add("Pdesc");
            dt.Columns.Add("Pquantity");
            dt.Columns.Add("Ptotalprice");

            String mycon = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename = C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf; Integrated Security = True";
            SqlConnection con = new SqlConnection(mycon);
            String myquery = "select * from CartDetails where email='" + Session["Email"].ToString() + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = myquery;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                int count = ds.Tables[0].Rows.Count;
                while (i < count)
                {
                    dr = dt.NewRow();
                    dr["Sno"] = i + 1;
                    dr["Pid"] = ds.Tables[0].Rows[i]["productid"].ToString();
                    dr["Pname"] = ds.Tables[0].Rows[i]["Pname"].ToString();
                    dr["Pcategory"] = ds.Tables[0].Rows[i]["pcategory"].ToString();
                    dr["Pimage"] = ds.Tables[0].Rows[i]["pimage"].ToString();
                    dr["Pprice"] = ds.Tables[0].Rows[i]["pprice"].ToString();
                    dr["Pdesc"] = ds.Tables[0].Rows[i]["pdesc"].ToString();
                    dr["Pquantity"] = ds.Tables[0].Rows[i]["pquantity"].ToString();
                    int price = Convert.ToInt32(ds.Tables[0].Rows[i]["pprice"].ToString());
                    int quantity = Convert.ToInt32(ds.Tables[0].Rows[i]["pquantity"].ToString());
                    int totalprice = price * quantity;
                    dr["Ptotalprice"] = totalprice;
                    dt.Rows.Add(dr);

                    i++;
                }
            }
            else
            {
                Session["Buyitems"] = null;

            }

            Session["Buyitems"] = dt;

        }
    }
}