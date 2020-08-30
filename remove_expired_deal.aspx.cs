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
    public partial class remove_expired_deal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RemoveExpiredDeal(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("removeExpiredDeal", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (txt_dealid.Text.ToString().Equals(""))
                {
                    Response.Write("please enter a deal id <br />");
                }
                else
                {
                    int dealId = Int32.Parse(txt_dealid.Text);
                    cmd.Parameters.Add(new SqlParameter("@deal_id", dealId));

                    SqlParameter dealExists = cmd.Parameters.Add("@deal_exists", SqlDbType.Bit);
                    dealExists.Direction = ParameterDirection.Output;

                    SqlParameter dealRemoved = cmd.Parameters.Add("@deal_removed", SqlDbType.Bit);
                    dealRemoved.Direction = ParameterDirection.Output;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    if (dealExists.Value.ToString().Equals("False"))
                    {
                        Response.Write("this deal id does not exist <br/>");
                    }
                    else if (dealRemoved.Value.ToString().Equals("False"))
                    {
                        Response.Write("this deal's expiry date hasn't come <br/>");
                    }
                    else
                    {
                        Response.Write("this deal has been removed <br/>");
                    }
                }
            }
            catch
            {
                Response.Write("Please Enter right inputs");
            }


        }
    }
}