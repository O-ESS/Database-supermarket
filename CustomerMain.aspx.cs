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
    public partial class mainpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                    
        }

        protected void productsSorted(object sender, EventArgs e)
        {

            
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("ShowProductsbyPrice", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();

                //IF the output is a table, then we can read the records one at a time
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
                int id = rdr.GetInt32(rdr.GetOrdinal("serial_no"));
                Label lbl_idk = new Label();
                lbl_idk.Text = "ID: " + id + "  ";
                form1.Controls.Add(lbl_idk);
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
                //this is how you retrive data from session variable.
                string field1 = (string)(Session["field1"]);
                Response.Write(field1);
           
          
        }

        protected void wishlist(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("createWishlist", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                string name = txt_wishlist_name.Text;
                cmd.Parameters.Add(new SqlParameter("@customer_name", Session["name"]));
                cmd.Parameters.Add(new SqlParameter("@name", name));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;
                if (name.Equals(""))
                {
                    Response.Write("Please enter a valid name");
                }
                else
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (success.Value.ToString().Equals("1"))
                    {
                        Response.Write("WishList already in data base");
                    }
                    else
                    {
                        Response.Write("WishList Created");
                    }
                }
            }
            catch
            {
                Response.Write("please enter right inputs");
            }
        }

        protected void addToWishlist(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("AddtoWishlist", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                string name = txt_wishlist_name1.Text;
                string serial = txt_prodcut_ID.Text;
                cmd.Parameters.Add(new SqlParameter("@customer_name", Session["name"]));
                cmd.Parameters.Add(new SqlParameter("@serial", serial));
                cmd.Parameters.Add(new SqlParameter("@wishlistname", name));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;
                if (serial.Equals("") || name.Equals(""))
                {
                    Response.Write("please enter a valid input");
                }
                else
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (success.Value.ToString().Equals("1"))
                    {
                        Response.Write("item already in WishList");
                    }
                    else
                    {
                        Response.Write("Item Added");
                    }
                  
                }
            }
             catch
            {
                Response.Write("please enter right inputs");
            }
        }

        protected void removeFromWishlist(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("removefromWishlist", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                string name = txt_wishlist_name2.Text;
                string serial = txt_prodcut_ID0.Text;
                cmd.Parameters.Add(new SqlParameter("@customer_name", Session["name"]));
                cmd.Parameters.Add(new SqlParameter("@serial", serial));
                cmd.Parameters.Add(new SqlParameter("@wishlistname", name));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;
                if (serial.Equals("") || name.Equals(""))
                {
                    Response.Write("please enter a valid input");
                }
                else
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (success.Value.ToString().Equals("1"))
                    {
                        Response.Write("item is not in the wishlist");
                    }
                    else
                    {
                        Response.Write("Item removed");
                    }

                  

                }
            }
            catch
            {
                Response.Write("please enter right inputs");
            }
        }

        protected void add_Creditcard(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("AddCreditCard", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                string creditnum = txt_Credit_Card_Number.Text;
                string exdate = txt_expiry_date.Text;
                string cvc = txt_CVC.Text;
                cmd.Parameters.Add(new SqlParameter("@username", Session["name"]));
                cmd.Parameters.Add(new SqlParameter("@cc", creditnum));
                cmd.Parameters.Add(new SqlParameter("@ex", exdate));
                cmd.Parameters.Add(new SqlParameter("@cvv", cvc));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;
                if (creditnum.Equals("") || cvc.Equals("") || exdate.Equals(""))
                {
                    Response.Write("please enter a valid input");
                }
                else
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (success.Value.ToString().Equals("1"))
                    {
                        Response.Write("you have the card already");
                    }
                    else
                    {
                        Response.Write("card added");
                    }
                 
                }
            }
            catch
            {
                Response.Write("please enter right inputs");
            }
        }

        protected void addToCart(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("addToCart", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                string id = txt_Id.Text;
                cmd.Parameters.Add(new SqlParameter("@customer_name", Session["name"]));
                cmd.Parameters.Add(new SqlParameter("@serial", id));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;
                if (id.Equals(""))
                {
                    Response.Write("please enter a valid input");
                }
                else
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (success.Value.ToString().Equals("1"))
                    {
                        Response.Write("you have the item in the cart already");
                    }
                    else
                    {
                        Response.Write("item added to cart");
                    }

                }
            }
            catch
            {
                Response.Write("please enter right inputs");
            }
        }

        protected void removeFromCart(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("removefromCart", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                string id = txt_id1.Text;
                cmd.Parameters.Add(new SqlParameter("@customer_name", Session["name"]));
                cmd.Parameters.Add(new SqlParameter("@serial", id));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;
                if (id.Equals(""))
                {
                    Response.Write("please enter a valid input");
                }
                else
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (success.Value.ToString().Equals("1"))
                    {
                        Response.Write("item is not in the cart");
                    }
                    else
                    {
                        Response.Write("item removed from cart");
                    }

                }
           

            }
            catch
            {
                Response.Write("please enter right inputs");
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
        protected void Order(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("makeOrder", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string username = (string)Session["name"];
            cmd.Parameters.Add(new SqlParameter("@customer_name", username));
            SqlParameter totalam = cmd.Parameters.Add("@total", SqlDbType.Int);
            totalam.Direction = ParameterDirection.Output;
            SqlParameter id = cmd.Parameters.Add("@id", SqlDbType.Int);
            id.Direction = ParameterDirection.Output;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
           
            Session["Orderid"] = id;
            Response.Write("Order made:        ");
            Response.Write("OrderId:-" + id.Value.ToString() + "total amount:-" + totalam.Value.ToString());


        }

        protected void finish(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("SpecifyAmount", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                 string id = txt_id3.Text;
                string cash = txt_cash.Text;
                string credit = txt_credit.Text;
                cmd.Parameters.Add(new SqlParameter("@customername", Session["name"]));
                cmd.Parameters.Add(new SqlParameter("@ORDERID", id));
                cmd.Parameters.Add(new SqlParameter("@CASH", cash));
                cmd.Parameters.Add(new SqlParameter("@CREDIT", credit));
                if (cash.ToString().Equals("")|| credit.ToString().Equals(""))
                {
                    Response.Write("please insert a valid input");
                }
                else
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("done        ");
                    if (Convert.ToDecimal(credit) > 0)
                    {
                        Response.Write("please enter you credit cart number");
                    }
                }
            }
            catch
            {
                Response.Write("please insert right inputs");
            }
        }

        protected void finish1(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("ChooseCreditCard", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                string ccn = txt_cc.Text;
                string id = txt_id5.Text;
                cmd.Parameters.Add(new SqlParameter("@creditcard", ccn));
                cmd.Parameters.Add(new SqlParameter("@ORDERID", id));
                if (ccn.ToString().Equals("")|| id.ToString().Equals(""))
                {
                    Response.Write("please enter a valid input");
                }
                else
                {
                    Response.Write("done");
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch
            {
                Response.Write("please insert right values");
            }
        }
        protected void cancel(object sender, EventArgs e)
        {
            try
            {
                string connStr1 = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn1 = new SqlConnection(connStr1);

                SqlCommand cmd1 = new SqlCommand("cancelOrder", conn1);
                cmd1.CommandType = CommandType.StoredProcedure;
                string orderid =txt_order.Text;
                cmd1.Parameters.Add(new SqlParameter("@orderid", orderid));
                SqlParameter success = cmd1.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;
                if (orderid.ToString().Equals(""))
                {
                    Response.Write("please insert right input");
                }
                else
                {
                    conn1.Open();
                    cmd1.ExecuteNonQuery();
                    conn1.Close();
                    if (success.Value.ToString().Equals("1"))
                    {
                        Response.Write("there is no such id");
                    }
                    else
                    {
                        Response.Write("order cancelled");
                       
                    }
                }
            }
            catch
            {
                Response.Write("please insert right input");
            }
        }
        protected void PageView(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Viewmyorders_no", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@customername", Session["name"]));
            conn.Open();


            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {

                int order = rdr.GetInt32(rdr.GetOrdinal("order_no"));
                string status = rdr.GetString(rdr.GetOrdinal("order_status"));
                Label lbl_Orderno = new Label();
                lbl_Orderno.Text = "Order no." + order;
                Label lbl_category = new Label();
                lbl_category.Text = "status: " + status + "  <br /> <br />";
                form1.Controls.Add(lbl_Orderno);
                form1.Controls.Add(lbl_category);



            }

        }
    }

}