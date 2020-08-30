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
    public partial class AdminMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ActivateVendor(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("activateVendors", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                string adminusername = Session["name"].ToString();
                string vendorusername = txt_vendor_username.Text;

                if (adminusername.ToString().Equals(""))
                {
                    Response.Write("Please Enter an admin username" + "<br /> <br />");
                }
                if (vendorusername.ToString().Equals(""))
                {
                    Response.Write("Please Enter a vendor username" + "<br /> <br />");
                }

                if (!adminusername.ToString().Equals("") && !vendorusername.ToString().Equals(""))
                {



                    cmd.Parameters.Add(new SqlParameter("@admin_username", adminusername));
                    cmd.Parameters.Add(new SqlParameter("@vendor_username", vendorusername));

                    SqlParameter vendor_exists = cmd.Parameters.Add("@vendor_exists", SqlDbType.Bit);
                    vendor_exists.Direction = ParameterDirection.Output;

                    SqlParameter admin_exists = cmd.Parameters.Add("@admin_exists", SqlDbType.Bit);
                    admin_exists.Direction = ParameterDirection.Output;

                    SqlParameter vendor_activated = cmd.Parameters.Add("@vendor_activated", SqlDbType.Bit);
                    vendor_activated.Direction = ParameterDirection.Output;



                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    if (vendor_exists.Value.ToString().Equals("False"))
                    {

                        Response.Write("Please Enter a username of an existing vendor\n\n" + "<br /> <br />");

                    }
                    if (admin_exists.Value.ToString().Equals("False"))
                    {

                        Response.Write("Please Enter a username of an existing admin\n\n" + "<br /> <br />");

                    }
                    if (vendor_activated.Value.ToString().Equals("True"))
                    {

                        Response.Write("Vendor already activated \n\n" + "<br /> <br />");

                    }

                    if (vendor_activated.Value.ToString().Equals("False") && admin_exists.Value.ToString().Equals("True") && vendor_exists.Value.ToString().Equals("True"))
                    {
                        Response.Write("Vendor activated\n\n" + "<br /> <br />");
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