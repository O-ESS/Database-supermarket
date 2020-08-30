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
    public partial class vendorMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PostProduct(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("postProduct", conn);
                string productName = txt_productname.Text;
                string category = txt_category.Text;
                string product_description = txt_product_description.Text;
                string price = txt_price.Text;
                string color = txt_color.Text;
                

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@vendorUsername", Session["name"]));
                cmd.Parameters.Add(new SqlParameter("@product_name", productName));
                cmd.Parameters.Add(new SqlParameter("@category", category));
                cmd.Parameters.Add(new SqlParameter("@product_description", product_description));
                cmd.Parameters.Add(new SqlParameter("@price", price));
                cmd.Parameters.Add(new SqlParameter("@color", color));
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;

                if (productName == "" || category == "" || product_description == "" || price == "" || color == "")
                {
                    Response.Write("Some value is null");

                }
                else
                {
                                     
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (success.Value.ToString().Equals("1"))
                    {
                        Response.Write("vendor not activated");
                    }
                    else
                    {
                        Response.Write("product posted");
                    }
                }
            }
            catch
            {
                Response.Write("please insert right values");
            }
        }

        protected void ViewProducts(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("vendorviewProducts", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            
            cmd.Parameters.Add(new SqlParameter("@vendorname", Session["name"]));
            SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
          
                conn.Open();
               
                    SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    while (rdr.Read())
                    {
                          
                        string product_name = rdr.GetString(rdr.GetOrdinal("product_name"));
                        string category = rdr.GetString(rdr.GetOrdinal("category"));
                        string product_description = rdr.GetString(rdr.GetOrdinal("product_description"));
                        decimal price = rdr.GetDecimal(rdr.GetOrdinal("price"));
                         decimal final_price = 0;

                try
                {
                    final_price = rdr.GetDecimal(rdr.GetOrdinal("final_price"));
                }
                catch
                {
                    final_price = 0;
                }
                        string color = rdr.GetString(rdr.GetOrdinal("color"));
                Boolean available = false;
                try
                {
                    available = rdr.GetBoolean(rdr.GetOrdinal("available"));
                }
                catch
                {
                     available = false;
                }
                int rate = 0;
                try
                {
                    rate = rdr.GetInt32(rdr.GetOrdinal("rate"));
                }
                catch
                {
                    rate = 0;
                }
                
                        string vendor_username = rdr.GetString(rdr.GetOrdinal("vendor_username"));
                string customer_username = "";
                try
                {
                    customer_username = rdr.GetString(rdr.GetOrdinal("customer_username"));
                }
                catch
                {
                    customer_username = "";
                }
                int customer_order_id = 0;
                try
                {
                    customer_order_id = rdr.GetInt32(rdr.GetOrdinal("customer_order_id"));
                }
                catch
                {
                    customer_order_id = 0;
                }
               

                        //Create a new label and add it to the HTML form
                        Label lbl_product_name = new Label();
                        lbl_product_name.Text = "Name: " + product_name + " ";
                        form1.Controls.Add(lbl_product_name);

                        Label lbl_category = new Label();
                        lbl_category.Text = "Category: " + category + "  ";
                        form1.Controls.Add(lbl_category);

                        Label lbl_product_description = new Label();
                        lbl_product_description.Text = "Product Description" + product_description + "  ";
                        form1.Controls.Add(lbl_product_description);

                        Label lbl_color = new Label();
                        lbl_color.Text = "Color: " + color + "  ";
                        form1.Controls.Add(lbl_color);

                        Label lbl_price = new Label();
                        lbl_price.Text = "Price: " + price + "  ";
                        form1.Controls.Add(lbl_price);

                        Label lbl_available = new Label();
                        lbl_available.Text = "Available: " + available + "  ";
                        form1.Controls.Add(lbl_available);

                        Label lbl_final_price = new Label();
                        lbl_final_price.Text = "Final Price: " + final_price + "  ";
                        form1.Controls.Add(lbl_final_price);

                        Label lbl_rate = new Label();
                        lbl_rate.Text = "Rate: " + rate + "  ";
                        form1.Controls.Add(lbl_rate);

                        Label lbl_vendor_username = new Label();
                        lbl_vendor_username.Text = "Vendor Name: " + vendor_username + "  ";
                        form1.Controls.Add(lbl_vendor_username);

                        Label lbl_customer_username = new Label();
                        lbl_customer_username.Text = "Customer Username: " + customer_username + "  ";
                        form1.Controls.Add(lbl_customer_username);

                        Label lbl_customer_order_id = new Label();
                        lbl_customer_order_id.Text = "Customer user ID: " + customer_order_id + "  <br /> <br />";
                        form1.Controls.Add(lbl_customer_order_id);
                    }
                
             
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

        protected void editProduct(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("EditProduct", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                string productName = txt_productname0.Text;
                string category = txt_category0.Text;
                string product_description = txt_product_description0.Text;
                string price = txt_price0.Text;
                string color = txt_color0.Text;
                string serial_no = txt_id.Text;
                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@vendorname", Session["name"]));
                cmd.Parameters.Add(new SqlParameter("@serialnumber", serial_no));
                cmd.Parameters.Add(new SqlParameter("@product_name", productName));
                cmd.Parameters.Add(new SqlParameter("@category", category));
                cmd.Parameters.Add(new SqlParameter("@product_description", product_description));
                cmd.Parameters.Add(new SqlParameter("@price", price));
                cmd.Parameters.Add(new SqlParameter("@color", color));

                if (productName == "" || category == "" || product_description == "" || price == "" || color == "" || serial_no == "")
                {
                    Response.Write("One of the values is null");
                }
                else
                {

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("done");
                }
            }
            catch
            {
                Response.Write("please insert a valid input");
            }
        }
        protected void CreateOffer(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("addOffer", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                string offer_amount = txt_offer.Text;
                string exp = txt_date.Text;
                cmd.Parameters.Add(new SqlParameter("@offeramount", offer_amount));
                cmd.Parameters.Add(new SqlParameter("@expiry_date", exp));
                if (exp == "" || offer_amount == "")
                {
                    Response.Write("Some value is null");
                }
                else
                {

                    //pass parameters to the stored procedure


                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("offer created");
                }
            }
            catch
            {
                Response.Write("please enter a valid input");
            }
        }
        protected void ApplyOffer(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("applyOffer", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                string offer_id = txt_offer0.Text;
                string serial = txt_date0.Text;

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@offerid", offer_id));
                cmd.Parameters.Add(new SqlParameter("@serial", serial));
                cmd.Parameters.Add(new SqlParameter("@vendorname", Session["name"]));

                if (serial == "" || offer_id == "")
                {
                    Response.Write("Some value is null");
                }
                else
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("offer applied");
                }
            }
            catch
            {
                Response.Write("please insert a valid input");
            }
        }

        protected void RemoveExpiredOffers(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("checkandremoveExpiredoffer", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                string offerid = txt_offer1.Text;

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@offerid", offerid));

                if (offerid == "")
                {
                    Response.Write("Value is null");
                }
                else
                {

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("process done");
                }
            }

            catch
            {
                Response.Write("please enter a valid input");
            }
        }
    }
}