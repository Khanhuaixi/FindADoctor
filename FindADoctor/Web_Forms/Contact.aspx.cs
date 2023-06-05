using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindADoctor
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string title = "Appointment Feedback";
            //string body = "Please Provide a Feedback for this Appointment. Thank You Very Much.";
            //ClientScript.RegisterStartupScript(this.GetType(), "MyFeedbackPopUpModal", "showFeedbackModal('" + title + "');", true);
        }

        //protected void submitButton_Click(object sender, EventArgs e)
        //{
        //    appointmentFeedbackLabel.Text = feedbackTextBox.Text;

        //    ClientScript.RegisterStartupScript(this.GetType(), "FeedbackPopUpModal", "submitFeedbackModal();", true);
        //    appointmentFeedbackLabel.Text = "testing";

        //    dsAppointment.Update();

        //    ClientScript.RegisterStartupScript(this.GetType(), "FeedbackPopUpModal", "hideFeedbackModal();", true);

        //}

        //protected void cancelButton_Click(object sender, EventArgs e)
        //{
        //    ClientScript.RegisterStartupScript(this.GetType(), "FeedbackPopUpModal", "hideFeedbackModal();", true);
        //}


    }
}