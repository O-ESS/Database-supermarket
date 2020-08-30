using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class todays_deals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GoToCreatingDeal(object sender, EventArgs e)
        {
            Response.Redirect("create_todays_deal.aspx", true);
        }

        protected void GoToAddTodaysDeal(object sender, EventArgs e)
        {
            Response.Redirect("add_new_todays_deals.aspx", true);
        }

        protected void GoToRemoveExpiredDeal(object sender, EventArgs e)
        {
            Response.Redirect("remove_expired_deal.aspx", true);
        }
    }
}