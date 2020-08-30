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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("customerRegister", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                string username = txt_username.Text;
                string firstname = txt_firstname.Text;
                string lastname = txt_lastname.Text;
                string email = txt_email.Text;
                string password = txt_password.Text;

                cmd.Parameters.Add(new SqlParameter("@username", username));
                cmd.Parameters.Add(new SqlParameter("@password", password));
                cmd.Parameters.Add(new SqlParameter("@firstname", firstname));
                cmd.Parameters.Add(new SqlParameter("@lastname", lastname));
                cmd.Parameters.Add(new SqlParameter("@email", email));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;
                if (username.Equals("") || password.Equals("") || firstname.Equals("") || lastname.Equals("") || email.Equals(""))
                {
                    Response.Write("please insert an input");
                    Response.Write("     ");
                }
                else
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                if (success.Value.ToString().Equals("1"))
                {
                    Response.Write("user already in database");
                }
                else
                {
                    Response.Write("ok");

                }
            }
            catch
            {
                Response.Write("please enter right inputs");
            }


        }
    }
}