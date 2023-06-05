using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindADoctor.Web_Forms
{
    public partial class ManageAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.gridView.Columns[0].Visible = false; //hide Id
            this.gridView.Columns[3].Visible = false;  //hide doctor Id
            this.gridView.Columns[5].Visible = false;  //hide member Id
        }

        //cancel appointment
        protected void cancelAppointmentButton_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;

            GridViewRow gridViewRow = (GridViewRow)button.NamingContainer;

            appointmentStatusLabel.Text = gridViewRow.Cells[8].Text.ToString();
            if(appointmentStatusLabel.Text == "Active")
            {
                idLabel.Text = gridViewRow.Cells[0].Text.ToString();
                appointmentIdLabel.Text = gridViewRow.Cells[1].Text.ToString();
                appointmentDateLabel.Text = gridViewRow.Cells[2].Text.ToString();
                doctorIdLabel.Text = gridViewRow.Cells[3].Text.ToString();
                doctorFullnameLabel.Text = gridViewRow.Cells[4].Text.ToString();
                memberIdLabel.Text = gridViewRow.Cells[5].Text.ToString();
                appointmentCreatedDateLabel.Text = gridViewRow.Cells[6].Text.ToString();
                appointmentFeedbackLabel.Text = gridViewRow.Cells[7].Text.ToString();

                appointmentStatusLabel.Text = "Canceled";

                string title = "Cancel Appointment";
                string body = "Are You Sure You Want to Cancel this Appointment?";
                showModal(title, body);
            }
            else
            {
                string title = "Sorry";
                string body = "Only Active Appointments can be Canceled.";
                showErrorModal(title, body);
            }

        }
        protected void confirmButton_Click(object sender, EventArgs e)
        {
            dsAppointment.Update();
            ClientScript.RegisterStartupScript(this.GetType(), "PopUpModal", "hideModal();", true);
        }

        //provide feedback
        protected void feedbackButton_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;

            GridViewRow gridViewRow = (GridViewRow)button.NamingContainer;

            appointmentStatusLabel.Text = gridViewRow.Cells[8].Text.ToString();
            if (appointmentStatusLabel.Text == "Done")
            {
                idLabel.Text = gridViewRow.Cells[0].Text.ToString();
                appointmentIdLabel.Text = gridViewRow.Cells[1].Text.ToString();
                appointmentDateLabel.Text = gridViewRow.Cells[2].Text.ToString();
                doctorIdLabel.Text = gridViewRow.Cells[3].Text.ToString();
                doctorFullnameLabel.Text = gridViewRow.Cells[4].Text.ToString();
                memberIdLabel.Text = gridViewRow.Cells[5].Text.ToString();
                appointmentCreatedDateLabel.Text = gridViewRow.Cells[6].Text.ToString();
                appointmentFeedbackLabel.Text = gridViewRow.Cells[7].Text.ToString();
                appointmentStatusLabel.Text = gridViewRow.Cells[8].Text;

                string title = "Appointment Feedback";
                showFeedbackModal(title);
            }
            else
            {
                string title = "Sorry";
                string body = "Feedbacks can only be Provided for Done Appointments.";
                showErrorModal(title, body);
            }


        }
        protected void submitButton_Click(object sender, EventArgs e)
        {
            appointmentFeedbackLabel.Text = feedbackTextBox.Text;
            dsAppointment.Update();
            ClientScript.RegisterStartupScript(this.GetType(), "FeedbackPopUpModal", "hideFeedbackModal();", true);
            feedbackTextBox.Text = "";
        }

        //show modal
        protected void showModal(string title, string body)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "PopUpModal", "showModal('" + title + "', '" + body + "');", true);
        }

        protected void showErrorModal(string title, string body)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "PopUpModal", "showErrorModal('" + title + "', '" + body + "');", true);
        }
        protected void showFeedbackModal(string title)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "MyFeedbackPopUpModal", "showFeedbackModal('" + title + "');", true);
        }
    }
}