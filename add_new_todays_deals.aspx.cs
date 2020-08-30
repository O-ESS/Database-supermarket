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
    public partial class add_new_todays_deals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void InsertTodaysDeals(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("addTodaysDealOnProduct", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (txt_dealId.Text.Equals(""))
                {
                    Response.Write("Please Enter a deal id + <br />");
                }
                if (txt_serialNo.Text.Equals(""))
                {
                    Response.Write("Please Enter a serial number + <br />");
                }
                if (!txt_dealId.Text.Equals("") && !txt_serialNo.Text.Equals(""))
                {
                    int dealId = Int32.Parse(txt_dealId.Text);
                    cmd.Parameters.Add(new SqlParameter("@deal_id", dealId));

                    int serialNo = Int32.Parse(txt_serialNo.Text);
                    cmd.Parameters.Add(new SqlParameter("@serial_no", serialNo));

                    SqlParameter dealExists = cmd.Parameters.Add("@deal_exists", SqlDbType.Bit);
                    dealExists.Direction = ParameterDirection.Output;

                    SqlParameter productExists = cmd.Parameters.Add("@product_exists", SqlDbType.Bit);
                    productExists.Direction = ParameterDirection.Output;

                    SqlParameter productalreadyactivated = cmd.Parameters.Add("@product_already_activated", SqlDbType.Bit);
                    productalreadyactivated.Direction = ParameterDirection.Output;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    if (dealExists.Value.ToString().Equals("False"))
                    {
                        Response.Write("this deal does not exists <br/>");
                    }
                    if (productExists.Value.ToString().Equals("False"))
                    {
                        Response.Write("this product does not exists <br/>");
                    }
                    if (productalreadyactivated.Value.ToString().Equals("True"))
                    {
                        Response.Write("this product already has an active deal <br/>");
                    }
                    if (productExists.Value.ToString().Equals("True") && dealExists.Value.ToString().Equals("True") && productalreadyactivated.Value.ToString().Equals("False"))
                    {
                        Response.Write("deal added to product <br/>");
                    }
                }
            }
            catch
            {
                Response.Write("please enter right inputs");
            }
        }
    }
}