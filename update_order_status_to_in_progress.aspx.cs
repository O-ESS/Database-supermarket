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
    public partial class update_order_status_to_in_progress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SetToInProcess(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("updateOrderStatusInProcess", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (txt_ordernumber.Text.Equals(""))
                {
                    Response.Write("Please put an order number");
                }
                else
                {
                    int ordernumber = Int32.Parse(txt_ordernumber.Text);
                    cmd.Parameters.Add(new SqlParameter("@order_no", ordernumber));

                    SqlParameter orderNoExists = cmd.Parameters.Add("@order_no_exists", SqlDbType.Bit);
                    orderNoExists.Direction = ParameterDirection.Output;

                    SqlParameter alreadyInProcess = cmd.Parameters.Add("@already_in_process", SqlDbType.Bit);
                    alreadyInProcess.Direction = ParameterDirection.Output;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    if (orderNoExists.Value.ToString().Equals("False"))
                    {
                        Response.Write("Please enter an existing order number <br />");
                    }
                    if (alreadyInProcess.Value.ToString().Equals("True"))
                    {
                        Response.Write("Order number " + ordernumber + " is already in process <br/>");
                    }
                    if (!orderNoExists.Value.ToString().Equals("False") && !alreadyInProcess.Value.ToString().Equals("True"))
                    {
                        Response.Write("order number " + ordernumber + " Updated");
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