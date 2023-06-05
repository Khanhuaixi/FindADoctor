using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FindADoctor.Web_Forms
{
    public partial class MakeAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            doctorFullNameLabel.Text = Session["doctorFullName"].ToString();

            string minimumDate = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            string maximumDate = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");

            appointmentDateTextBox.Attributes["min"] = minimumDate;
            appointmentDateTextBox.Attributes["max"] = maximumDate;

        }
        protected void submitButton_Click(object sender, EventArgs e)
        {
            if(appointmentDateTextBox.Text != "")
            {
                string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();

                string query = "SELECT * FROM tblAppointment WHERE doctorId = @doctorId AND appointmentDate = @appointmentDate AND appointmentStatus = 'Active'";
                SqlCommand comm = new SqlCommand(query, conn);
                comm.Parameters.AddWithValue("@doctorId", Session["doctorId"].ToString());
                comm.Parameters.AddWithValue("@appointmentDate", appointmentDateTextBox.Text.ToString());

                SqlDataReader reader = comm.ExecuteReader(); //execute command and the returned result can be read by reader

                if (reader.Read())
                {
                    //show failed modal
                    string title = "Sorry";
                    string body = "This Doctor is Fully Booked on " + appointmentDateTextBox.Text + ". Please Try Another Date. Thank You.";
                    showModal(title, body);
                }
                else
                {

                    appointmentIdLabel.Text = generateAppointmentId();
                    doctorIdLabel.Text = Session["doctorId"].ToString();
                    memberIdLabel.Text = Session["memberId"].ToString();
                    appointmentCreatedDateLabel.Text = DateTime.Now.ToString();
                    appointmentFeedbackLabel.Text = " ";
                    appointmentStatusLabel.Text = "Active";
                    dsAppointment.Insert();

                    //show success modal
                    string title = "Appointment Made Successfully";
                    string body = "Your Appointment will be at 9am of " + appointmentDateTextBox.Text;
                    showModal(title, body);
                }

                conn.Close();
            }
        }

        protected string generateAppointmentId()
        {
            string appointmentId;

            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string selectQuery = "SELECT TOP 1 * FROM tblAppointment ORDER BY ID DESC";
            SqlCommand comm = new SqlCommand(selectQuery, conn);

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                appointmentId = "A" + (int.Parse(reader["Id"].ToString()) + 1);
            }
            else
            {
                appointmentId = "A1";
            }

            conn.Close();

            return appointmentId;
        }
        protected void closeButton_Click(object sender, EventArgs e)
        {

            ClientScript.RegisterStartupScript(this.GetType(), "PopUpModal", "hideModal();", true);

            Response.Redirect("Home.aspx");

        }

        protected void showModal(string title, string body)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "PopUpModal", "showModal('" + title + "', '" + body + "');", true);
        }

    }
}