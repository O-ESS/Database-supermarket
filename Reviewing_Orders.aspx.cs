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
    public partial class Reviewing_Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("reviewOrders", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {

                string orderNumber = "";
                string orderDate = "";
                string totalAmount = "";
                string cashAmount = "";
                string creditAmount = "";
                string paymentType = "";
                string orderStatus = "";
                string remainingDays = "";
                string timeLimit = "";
                string giftCardCode = "";
                string customerName = "";
                string deliveryId = "";
                string creditCardNumber = "";

                try
                {
                    orderNumber = rdr.GetInt32(rdr.GetOrdinal("order_no")).ToString();
                }
                catch
                {
                    orderNumber = "";
                }

                try
                {
                    orderDate = rdr.GetDateTime(rdr.GetOrdinal("order_date")).ToString();
                }
                catch
                {
                    orderDate = "";
                }

                try
                {
                    totalAmount = rdr.GetDecimal(rdr.GetOrdinal("total_amount")).ToString();
                }
                catch
                {
                    totalAmount = "";
                }
                try
                {
                    cashAmount = rdr.GetDecimal(rdr.GetOrdinal("cash_amount")).ToString();
                }
                catch
                {
                    cashAmount = "";
                }

                try
                {
                    creditAmount = rdr.GetDecimal(rdr.GetOrdinal("creadit_amount")).ToString();
                }
                catch
                {
                    creditAmount = "";
                }
                try
                {


                    paymentType = rdr.GetString(rdr.GetOrdinal("payment_type"));
                }

                catch
                {
                    paymentType = "";
                }
                try
                {
                    orderStatus = rdr.GetString(rdr.GetOrdinal("order_status"));
                }
                catch
                {
                    orderStatus= "";
                }
                try
                {
                    remainingDays = rdr.GetInt32(rdr.GetOrdinal("remaining_days")).ToString();
                }
                catch
                {
                    remainingDays = "";
                }
                try
                {
                    timeLimit = rdr.GetDateTime(rdr.GetOrdinal("time_limit")).ToString();
                }
                catch
                {
                    timeLimit = "";
                }
                try
                {
                    giftCardCode = rdr.GetString(rdr.GetOrdinal("gift_card_code"));
                }
                catch
                {
                    giftCardCode = "";
                }
                try
                {
                    customerName = rdr.GetString(rdr.GetOrdinal("customer_name"));
                }
                catch
                {
                    customerName = "";
                }
                try
                {
                    deliveryId = rdr.GetInt32(rdr.GetOrdinal("delivery_id")).ToString();
                }
                catch
                {
                    deliveryId = "";
                }
                try
                {
                    creditCardNumber = rdr.GetString(rdr.GetOrdinal("credit_card_number"));
                }
                catch
                {
                    creditCardNumber = "";
                }




                Label lbl_orderNumber = new Label();
                lbl_orderNumber.Text = orderNumber + "           ";
                form1.Controls.Add(lbl_orderNumber);

                Label lbl_orderDate = new Label();
                lbl_orderDate.Text = orderDate + "          ";
                form1.Controls.Add(lbl_orderDate);

                Label lbl_totalAmount = new Label();
                lbl_totalAmount.Text = totalAmount + "            ";
                form1.Controls.Add(lbl_totalAmount);

                Label lbl_cashAmount = new Label();
                lbl_cashAmount.Text = cashAmount + "      ";
                form1.Controls.Add(lbl_cashAmount);

                Label lbl_creditAmount = new Label();
                lbl_creditAmount.Text = creditAmount + "            ";
                form1.Controls.Add(lbl_creditAmount);

                Label lbl_paymentType = new Label();
                lbl_paymentType.Text = paymentType + "                ";
                form1.Controls.Add(lbl_paymentType);

                Label lbl_orderStatus = new Label();
                lbl_orderStatus.Text = orderStatus + "           ";
                form1.Controls.Add(lbl_orderStatus);

                Label lbl_remainingDays = new Label();
                lbl_remainingDays.Text = remainingDays + "         ";
                form1.Controls.Add(lbl_remainingDays);

                Label lbl_timeLimit = new Label();
                lbl_timeLimit.Text = timeLimit + "                  ";
                form1.Controls.Add(lbl_timeLimit);

                Label lbl_giftCardCode = new Label();
                lbl_giftCardCode.Text = giftCardCode + " ";
                form1.Controls.Add(lbl_giftCardCode);

                Label lbl_customerName = new Label();
                lbl_customerName.Text = customerName + "                   ";
                form1.Controls.Add(lbl_customerName);

                Label lbl_deliveryId = new Label();
                lbl_deliveryId.Text = deliveryId + "           ";
                form1.Controls.Add(lbl_deliveryId);

                Label lbl_creditCardNumber = new Label();
                lbl_creditCardNumber.Text = creditCardNumber + " <br /> <br />";
                form1.Controls.Add(lbl_creditCardNumber);
            }
            Response.Write("Order Number   |   Order Date  |  total Amount  |  cash Amount  |  credit Amount  |  payment Type  |  order Statue  |  remaining Days  | time Limit | gift card code  |  customer name |  delivery id  |  credit card number <br /> <br />");
            string field1 = (string)(Session["field1"]);
            Response.Write(field1);


        }
    }
}