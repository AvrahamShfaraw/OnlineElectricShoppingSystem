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
    public partial class AddToCart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security=True");
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["Email"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                
                //Session["addproduct"] = "false";
                DataTable dt = new DataTable();
                DataRow dr;

                dt.Columns.Add("sno");
                dt.Columns.Add("pid");
                dt.Columns.Add("pname");
                dt.Columns.Add("Pcategory");
                dt.Columns.Add("pimage");
                dt.Columns.Add("pprice");
                dt.Columns.Add("pdesc");
                dt.Columns.Add("pquantity");
                dt.Columns.Add("ptotalprice");

                if (Request.QueryString["id"] != null)
                {
                   

                    if (Session["Buyitems"] == null)
                    {
                        dr = dt.NewRow();
                        SqlDataAdapter da = new SqlDataAdapter("select * from [Product1] where ProductId=" + Request.QueryString["id"], con);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["sno"] = 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["ProductId"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                        dr["pcategory"] = ds.Tables[0].Rows[0]["Pcategory"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        dr["pdesc"] = ds.Tables[0].Rows[0]["Pdesc"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Pprice"].ToString());
                        int quantity = Convert.ToInt32(Request.QueryString["quantity"]);
                        int Totalprice = price * quantity;
                        dr["ptotalprice"] = Totalprice;
                        dt.Rows.Add(dr);

                        con.Open();
                        SqlCommand cmd = new SqlCommand("insert into CartDetails values('" + dr["sno"] + "','" + dr["pid"] + "','" + dr["pname"] + "','" + dr["pcategory"] + "','" + dr["pimage"] + "','" + dr["pprice"] + "','" + dr["pdesc"] + "','" + dr["pquantity"] + "','" + Session["Email"].ToString() + "' )", con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["Buyitems"] = dt;
                        ClearBtn.Enabled = true;


                        Session["sno"] = dr["sno"];

                        GridView1.FooterRow.Cells[7].Text = "Total Amount";
                        GridView1.FooterRow.Cells[8].Text = grandtotal().ToString();
                        Session["rowcount"] = dt.Rows.Count;
                        Response.Redirect("AddToCart.aspx");

                    }
                    else
                    {
                        dt = (DataTable)Session["Buyitems"];
                        int sr = dt.Rows.Count;
                        dr = dt.NewRow();


                        SqlDataAdapter da = new SqlDataAdapter("Select * From Product1 Where ProductId=" + Request.QueryString["id"], con);
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["ProductId"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                        dr["pcategory"] = ds.Tables[0].Rows[0]["Pcategory"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        dr["pdesc"] = ds.Tables[0].Rows[0]["Pdesc"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Pprice"].ToString());
                        int quantity = Convert.ToInt32(Request.QueryString["quantity"]);
                        int Totalprice = price * quantity;
                        dr["ptotalprice"] = Totalprice;
                        dt.Rows.Add(dr);


                        con.Open();
                        SqlCommand cmd = new SqlCommand("insert into CartDetails values('" + dr["sno"] + "','" + dr["pid"] + "','" + dr["pname"] + "','" + dr["pcategory"] + "','" + dr["pimage"] + "','" + dr["pprice"] + "','" + dr["pdesc"] + "','" + dr["pquantity"] + "','" + Session["Email"].ToString() + "' )", con);
                        cmd.ExecuteNonQuery();
                        con.Close();



                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["Buyitems"] = dt;
                        ClearBtn.Enabled = true;

                        Session["sno"] = sr + 1;

                        GridView1.FooterRow.Cells[7].Text = "Total Amount";
                        GridView1.FooterRow.Cells[8].Text = grandtotal().ToString();
                        Session["rowcount"] = dt.Rows.Count;
                        Response.Redirect("AddToCart.aspx");



                    }
                }
                else
                {
                    dt = (DataTable)Session["Buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    if ((GridView1.Rows.Count) > 0)
                    {
                        GridView1.FooterRow.Cells[7].Text = "Total Amount";
                        GridView1.FooterRow.Cells[8].Text = grandtotal().ToString();
                        Session["rowcount"] = dt.Rows.Count;
                    }

                }

            }
            string OrderDate = DateTime.Now.ToShortDateString();
            Session["OrderDate"] = OrderDate;
            orderid();

        }

        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Buyitems"];
            int nrow = dt.Rows.Count;
            int totalprice = 0;
            for (int i = 0; i < nrow; i++)
            {
                totalprice = totalprice + Convert.ToInt32(dt.Rows[i]["ptotalprice"].ToString());
            }
            return totalprice;
        }

        public void orderid()
        {
            String alpha = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            Random r = new Random();
            char[] myArray = new char[5];
            for (int i = 0; i < 5; i++)
            {
                myArray[i] = alpha[(int)(35 * r.NextDouble())];
            }
            String orderid;
            orderid = DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString()
             + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray);
            Session["Orderid"] = orderid;

        }

       

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Buyitems"];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int sr = 0;
                int sr1 = 0;
                string qdata;

                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                TableCell prid = GridView1.Rows[e.RowIndex].Cells[1];
                qdata = cell.Text;
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();

                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete top(1) from CartDetails where productid='" + prid.Text + "' and email='" + Session["Email"].ToString() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    break;

                }

            }


            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();

            }

            Session["Buyitems"] = dt;
            Session["sno"] = dt.Rows.Count;


            Response.Redirect("AddToCart.aspx");

        }

        protected void Payment_Click(object sender, EventArgs e)
        {
            if(Session["Buyitems"] != null)
            {
                bool Istrue = false;
                DataTable dt = new DataTable();
                dt = (DataTable)Session["Buyitems"];

                Session["rowcount"] = dt.Rows.Count;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int pid = Convert.ToInt32(dt.Rows[i]["pid"]);
                    SqlDataAdapter sda = new SqlDataAdapter("select Pquantity,Pname from Product1 where ProductId='" + pid + "' ", con);
                    DataTable dt2 = new DataTable();
                    sda.Fill(dt2);
                    int quantity = Convert.ToInt32(dt2.Rows[0][0]);

                    if (quantity == 0)
                    {
                        string Pname = dt2.Rows[0][1].ToString();
                        string msg = "המוצר:" + Pname + "לא נמצא במלאי";
                        Response.Write("<script>alert('" + msg + "');</script>");

                        Istrue = false;
                    }
                    else
                    {
                        Istrue = true;
                    }
                }

                if (GridView1.Rows.Count.ToString() == "0")
                {
                    Response.Write("<script>alert('הסל שלך ריק');</script>");

                }
                else if (Istrue == true)
                {

                    Response.Redirect("PlaceOrder.aspx");


                }
            }
            else
            {
                Response.Write("<script>alert('הסל שלך ריק');</script>");
            }          

        }

        public void Clearcart()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete from CartDetails where email='" + Session["Email"] + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("AddToCart.aspx");

        }
        
        protected void ContinueShop_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void ClearBtn_Click(object sender, EventArgs e)
        {

            Session["Buyitems"] = null;
            Session["sno"] = null;
            Session["rowcount"] = null;
            Clearcart();
        }

    }
}