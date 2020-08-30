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
    public partial class AdminMain1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GoToActivatingVendors(object sender, EventArgs e)
        {
            Response.Redirect("activate_vendors.aspx", true);
        }

        protected void GoToReviewingOrders(object sender, EventArgs e)
        {
            Response.Redirect("Reviewing_Orders.aspx", true);
        }

        protected void GoToUpdatingOrderStatus(object sender, EventArgs e)
        {
            Response.Redirect("update_order_status_to_in_progress.aspx", true);
        }

        protected void GoToTodaysDeals(object sender, EventArgs e)
        {
            Response.Redirect("todays_deals.aspx", true);
        }
        protected void addPhoneNumber(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("addMobile", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                string id = txt_phone_number.Text;
                cmd.Parameters.Add(new SqlParameter("@username", Session["name"]));
                cmd.Parameters.Add(new SqlParameter("@mobile_number", id));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;
                if (id.ToString().Equals(""))
                {
                    Response.Write("please insert a valid input");
                }
                else
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (success.Value.ToString().Equals("1"))
                    {
                        Response.Write("the user has that phone number already");
                    }
                    else
                    {
                        Response.Write("phone number added");
                    }
                }

            }
            catch
            {
                Response.Write("please insert write values");
            }
        }
    }
}