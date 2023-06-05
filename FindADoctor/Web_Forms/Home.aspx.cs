using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindADoctor.Web_Forms
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void dataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "specialityDetails")
            {
                Label specialityId = e.Item.FindControl("specialityIdLabel") as Label;
                Session["specialityId"] = specialityId.Text;
                Response.Redirect("Speciality.aspx");
            }
        }
    }
}