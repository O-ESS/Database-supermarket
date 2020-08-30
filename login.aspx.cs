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
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

 

        protected void login(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("userLogin", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                //To read the input from the user
                string username = txt_username.Text;
                string password = txt_password.Text;

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@username", username));
                cmd.Parameters.Add(new SqlParameter("@password", password));

                //Save the output from the procedure
                SqlParameter type = cmd.Parameters.Add("@type", SqlDbType.Int);
                type.Direction = ParameterDirection.Output;

                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Bit);
                success.Direction = ParameterDirection.Output;

                //Executing the SQLCommand
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                if (username.Equals("") || password.Equals(""))
                {
                    Response.Write("please insert an input");
                }
               else if (success.Value.ToString().Equals("True"))
                {
                    //To send response data to the client side (HTML)
                    Response.Write("Passed");

                    /*ASP.NET session state enables you to store and retrieve values for a user
                    as the user navigates ASP.NET pages in a Web application.
                    This is how we store a value in the session*/
                    Session["name"] = username;

                    //To navigate to another webpage
                    if (type.Value.ToString().Equals("0"))
                    {
                        Response.Redirect("CustomerMain.aspx", true);
                    }
                    else if (type.Value.ToString().Equals("1"))
                    {
                        Response.Redirect("vendorMain.aspx", true);
                    }
                    else if (type.Value.ToString().Equals("2"))
                    {
                        Response.Redirect("AdminMain.aspx", true);
                    }

                }
                else
                {
                    Response.Write("Failed");
                }
            }
            catch
            {
                Response.Write("please enter right inputs");
            }
        }

        protected void customerregister(object sender, EventArgs e)
        {
            

                Response.Redirect("customer_register.aspx", true);

            
        }

        protected void vendorregister(object sender, EventArgs e)
        {
            Response.Redirect("vendor_register.aspx", true);
        }
    }
}