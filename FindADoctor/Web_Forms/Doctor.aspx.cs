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
    public partial class Doctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["doctorId"] == null)
            {
                Response.Redirect("Home.aspx");
            }

            if (!IsPostBack) 
            {
                loadDoctor();
            }
        }

        void loadDoctor()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string query = "SELECT * FROM tblDoctor WHERE doctorId = @doctorId";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@doctorId", Session["doctorId"].ToString()); 

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                doctorFullNameLabelJumbotron.Text = reader["doctorFullName"].ToString();
                doctorImage.ImageUrl = reader["doctorImage"].ToString();
                doctorFullNameLabel.Text = reader["doctorFullName"].ToString();
                doctorGenderLabel.Text = reader["doctorGender"].ToString();
                doctorLanguageLabel.Text = reader["doctorLanguages"].ToString();
                doctorQualificationsLabel.Text = reader["doctorQualifications"].ToString();
                doctorLocationLabel.Text = reader["doctorLocation"].ToString();
                doctorContactLabel.Text = reader["doctorContact"].ToString();

                Session["doctorFullName"] = reader["doctorFullName"].ToString();
            }

            reader.Close();
            conn.Close();
        }

        protected void makeAppointmentButton_Click(object sender, EventArgs e)
        {
            if (Session["memberId"] == null)
            {
                string title = "Not Logged In";
                string body = "Please Login To Make Appointment";
                ClientScript.RegisterStartupScript(this.GetType(), "PopUpModal", "showModal('" + title + "', '" + body + "');", true);
                return;
            }

            Response.Redirect("MakeAppointment.aspx");
        }
    }
}