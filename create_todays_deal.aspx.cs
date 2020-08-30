using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class create_todays_deal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CreateTodaysDeal(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("createTodaysDeal", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (txt_dealamount.Text.ToString().Equals(""))
                {
                    Response.Write("Please enter a deal amount <br />");
                }
                if (txt_expirydate.Text.ToString().Equals(""))
                {
                    Response.Write("Please enter an expiry date <br />");
                }
                if (!txt_dealamount.Text.ToString().Equals("") && !txt_expirydate.Text.ToString().Equals(""))
                {
                    int dealamount = Int32.Parse(txt_dealamount.Text);
                    string adminusername = Session["name"].ToString();
                    DateTime expirydate = Convert.ToDateTime(txt_expirydate.Text);

                    cmd.Parameters.Add(new SqlParameter("@deal_amount", dealamount));
                    cmd.Parameters.Add(new SqlParameter("@admin_username", adminusername));
                    cmd.Parameters.Add(new SqlParameter("@expiry_date", expirydate));

                    SqlParameter adminexists = cmd.Parameters.Add("@admin_exists", SqlDbType.Bit);
                    adminexists.Direction = ParameterDirection.Output;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    if (adminexists.Value.ToString().Equals("True"))
                    {
                        Response.Write("deal added <br/>");
                    }
                    else
                    {
                        Response.Write("Please enter a valid admin username <br/>");
                    }
                }
            }
            catch
            {
                Response.Write("Please enter right inputs");
            }
        }
    }
}