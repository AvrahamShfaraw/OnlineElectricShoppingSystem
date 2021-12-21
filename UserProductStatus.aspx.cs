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
    public partial class UserProductStatus : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source = (LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\97250\\source\\repos\\MyFirstWebApplication\\App_Data\\Database1.mdf;Integrated Security = True");
        public int val;
        
       
        public void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Status();
                DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        public void Status()
        {
            if(Session["Email"] == null )
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

                string orderid = "";
                string status = "";
                string userid = Session["Email"].ToString();
                SqlDataAdapter sda = new SqlDataAdapter("Select * from OrderDetails inner join (Select max(orderdate) as LatestDate, email as userid from OrderDetails Group by email) Submax on OrderDetails.orderdate = Submax.LatestDate and OrderDetails.email = Submax.userid where email='" + userid + "'", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count  > 0)
                {
                     orderid = dt.Rows[0][0].ToString();
                     status = dt.Rows[0][7].ToString();
                     Label1.Text = orderid;
                     val = 25;
                 

                    SqlDataAdapter sda1 = new SqlDataAdapter("select * from OrderDetails where email='"+ userid +"'",con);
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);
                    if(dt1.Rows.Count > 1)
                    {
                        HyperLink1.Visible = true;
                    }
                    else
                    {
                        HyperLink1.Visible = false; 
                    }

                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
                if(status == "Complete")
                {
                    val = 0;
                    Page.Header.Controls.Add(new System.Web.UI.LiteralControl("<link rel=\"stylesheet\" type=\"text/css\" href=\"" + ResolveUrl("~/css/StatusStyle.css") + "\"/>"));

                }

            }
        }
    }
}