using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindADoctor
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["memberId"] == null && Session["adminId"] == null)
            {
                guestLabel.Text = "Hi, Guest";
            } else if (Session["memberId"] != null && Session["adminId"] == null)
            {
                memberLabel.Text = "Welcome back, " + Session["fullname"].ToString();
            } else
            {
                adminLabel.Text = "Hi, Admin";
            }
        }

        protected void logOutButton_Click(object sender, EventArgs e)
        {
            //clear all Sessions
            Session["adminId"] = null;
            Session["memberId"] = null;
            Session["specialityId"] = null;
            Session["fullname"] = null;
            Session["doctorFullName"] = null;
            Response.Redirect("Home.aspx");
        }

        protected void memberManagementButton_Click(object sender, EventArgs e)
        {

        }
    }
}