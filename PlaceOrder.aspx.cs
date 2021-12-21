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
    public partial class PlaceOrder : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True");
        bool Istrue = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Session["Email"] != null && Session["Orderid"] != null)
            {

                DataTable dt = new DataTable();
                dt = (DataTable)Session["Buyitems"];

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int pid = Convert.ToInt32(dt.Rows[i]["pid"]);
                    SqlDataAdapter sda = new SqlDataAdapter("select Pquantity,Pname from Product1 where ProductId='" + pid + "' ", con);
                    DataTable dt2 = new DataTable();
                    string select = "Pending";
                    sda.Fill(dt2);
                    int quantity = Convert.ToInt32(dt2.Rows[0][0]);

                    if (quantity > 0)
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("insert into OrderDetails(orderid,sno,productid,productname,price,quantity,orderdate,status,email) values('" + Session["Orderid"] + "','" + dt.Rows[i]["sno"] + "','" + dt.Rows[i]["pid"] + "','" + dt.Rows[i]["pname"] + "','" + dt.Rows[i]["pprice"] + "','" + dt.Rows[i]["pquantity"] + "','" + DateTime.Now.ToString("dd-MM-yyyy") + "','" + select + "','" + Session["Email"].ToString() + "')", con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                }
               
                UpdateQuantity();
                Payment();
                Clearcart();
                Session["Buyitems"] = null;


                Response.Redirect("Order_Confirmation.aspx");

            }
            else
            {
                Response.Redirect("AddToCart.aspx");
            }
        }






        public void Payment()
        {
            if (Istrue == true)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("insert into [CardDetails]" + "(Fname,Lname,CardNo,ExpiryDate,Cww,BillingAddress) values(@Fname,@Lname,@CardNo,@ExpiryDate,@Cww,@BillingAddress)", con);

                cmd.Parameters.AddWithValue("@Fname", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Lname", TextBox2.Text);
                cmd.Parameters.AddWithValue("@CardNo", TextBox3.Text);
                cmd.Parameters.AddWithValue("@ExpiryDate", TextBox4.Text);
                cmd.Parameters.AddWithValue("@Cww", TextBox5.Text);
                cmd.Parameters.AddWithValue("@BillingAddress", TextBox6.Text);

                cmd.ExecuteNonQuery();

                con.Close();
            }
            Session["address"] = TextBox6.Text;

            SqlDataAdapter da = new SqlDataAdapter("select Fname,Lname From Register where Email='"+Session["Email"].ToString()+"'",con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if(ds.Tables[0].Rows.Count > 0)
            {
                Session["Fullname"]= ds.Tables[0].Rows[0]["Fname"].ToString();
                Session["Fullname"] += " " + ds.Tables[0].Rows[0]["Lname"].ToString();
            }

        }
        public void UpdateQuantity()
        {
            DataTable dt = (DataTable)Session["Buyitems"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int pid = Convert.ToInt32(dt.Rows[i]["pid"]);
                int pQuantity = Convert.ToInt32(dt.Rows[i]["pquantity"]);
                SqlDataAdapter sda = new SqlDataAdapter("select Pquantity from Product1 where ProductId='" + pid + "'", con);
                DataTable dt2 = new DataTable();
                sda.Fill(dt2);

                int pquantity = Convert.ToInt32(dt2.Rows[0][0]);
                if (pquantity > 0)
                {
                    int updataequantity = pquantity - pQuantity;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update Product1 set Pquantity='" + updataequantity + "' where ProductId='" + pid + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Istrue = true;

                }
                else
                {
                    Istrue = false;
                }
            }
        }

       
        public void Clearcart()
        {
            if (Session["Email"] != null)
            {
                DataTable dt = (DataTable)Session["Buyitems"];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int pid = Convert.ToInt32(dt.Rows[i]["pid"]);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Delete from CartDetails where email='" + Session["Email"] + "' and productid='" + pid + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

               
                Session["rowcount"] = null;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}