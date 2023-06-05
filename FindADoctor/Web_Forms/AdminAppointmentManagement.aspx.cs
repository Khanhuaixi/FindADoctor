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
    public partial class AdminAppointmentManagement : System.Web.UI.Page
    {
        public enum MessageType { Success, Delete, Error };
        protected void Page_Load(object sender, EventArgs e)
        {
            string minimumDate = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            string maximumDate = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");

            appointmentDateTextBox.Attributes["min"] = minimumDate;
            appointmentDateTextBox.Attributes["max"] = maximumDate;
        }
        protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            idLabel.Text = gridView.SelectedRow.Cells[1].Text.ToString();
            appointmentIdLabel.Text = gridView.SelectedRow.Cells[2].Text.ToString();
            appointmentCreatedDateLabel.Text = gridView.SelectedRow.Cells[3].Text.ToString();
            doctorDropDownList.SelectedValue = gridView.SelectedRow.Cells[4].Text.ToString();
            doctorFullnameLabel.Text = gridView.SelectedRow.Cells[5].Text.ToString();
            memberDropDownList.SelectedValue = gridView.SelectedRow.Cells[6].Text.ToString();
            appointmentCreatedDateLabel.Text = gridView.SelectedRow.Cells[7].Text.ToString();
            appointmentFeedbackLabel.Text = gridView.SelectedRow.Cells[8].Text.ToString();
            appointmentStatusRadioButtonList.Text = gridView.SelectedRow.Cells[9].Text.ToString();
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            appointmentIdLabel.Text = generateAppointmentId();
            doctorFullnameLabel.Text = getDoctorFullname(doctorDropDownList.SelectedValue);
            appointmentCreatedDateLabel.Text = DateTime.Now.ToString();
            appointmentFeedbackLabel.Text = " ";

            if (appointmentDateTextBox.Text != "")
            {
                string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();

                string query = "SELECT * FROM tblAppointment WHERE doctorId = @doctorId AND appointmentDate = @appointmentDate AND appointmentStatus = 'Active'";
                SqlCommand comm = new SqlCommand(query, conn);
                comm.Parameters.AddWithValue("@doctorId", doctorDropDownList.SelectedValue);
                comm.Parameters.AddWithValue("@appointmentDate", appointmentDateTextBox.Text.ToString());

                SqlDataReader reader = comm.ExecuteReader(); //execute command and the returned result can be read by reader

                if (reader.Read() && appointmentStatusRadioButtonList.SelectedValue == "Active")
                {
                    //show error message
                    showMessage("This Doctor is Fully Booked on " + appointmentDateTextBox.Text + ". Please Try Another Date.", MessageType.Error);
                }
                else
                {
                    if (dsAppointment.Insert() == 1)
                    {
                        showMessage("Appointment Added Successfully", MessageType.Success);
                    }
                    else
                    {
                        showMessage("Error Occured when Adding New Appointment", MessageType.Error);
                    }
                    clearAll();
                }
                conn.Close();
            }
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            doctorFullnameLabel.Text = getDoctorFullname(doctorDropDownList.SelectedValue);

            if (appointmentDateTextBox.Text != "")
            {
                string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();

                string query = "SELECT * FROM tblAppointment WHERE doctorId = @doctorId AND appointmentDate = @appointmentDate AND appointmentStatus = 'Active'";
                SqlCommand comm = new SqlCommand(query, conn);
                comm.Parameters.AddWithValue("@doctorId", doctorDropDownList.SelectedValue);
                comm.Parameters.AddWithValue("@appointmentDate", appointmentDateTextBox.Text.ToString());

                SqlDataReader reader = comm.ExecuteReader();

                if (reader.Read() && appointmentStatusRadioButtonList.SelectedValue == "Active")
                {
                    //show error message
                    showMessage("This Doctor is Fully Booked on " + appointmentDateTextBox.Text + ". Please Try Another Date.", MessageType.Error);
                }
                else
                {
                    if (gridView.SelectedRow != null)
                    {
                        if (dsAppointment.Update() == 1)
                        {
                            showMessage("Appointment Updated Successfully", MessageType.Success);
                        }

                    }
                    else
                    {
                        showMessage("Please Select an Appointment to Update", MessageType.Error);
                    }
                    clearAll();
                }
                conn.Close();
            }
        }

        protected void showMessage(string message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                System.Guid.NewGuid().ToString(), "showMessage('" + message + "','" + type + "');", true);
        }

        protected void clearButton_Click(object sender, EventArgs e)
        {
            clearAll();
        }

        protected void clearAll()
        {
            idLabel.Text = string.Empty;
            appointmentIdLabel.Text = string.Empty;
            appointmentDateTextBox.Text = string.Empty;
            doctorDropDownList.ClearSelection();
            memberDropDownList.ClearSelection();
            appointmentCreatedDateLabel.Text = string.Empty;
            appointmentFeedbackLabel.Text = string.Empty;
            appointmentStatusRadioButtonList.ClearSelection();
            gridView.SelectedIndex = -1;
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
                appointmentId = "A" + (int.Parse(reader["appointmentId"].ToString().Substring(1)) + 1);
            }
            else
            {
                appointmentId = "A1";
            }
            reader.Close();
            conn.Close();

            return appointmentId;
        }

        protected string getDoctorFullname(string doctorId)
        {
            string doctorFullname;

            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string query = "SELECT * FROM tblDoctor WHERE doctorId = @doctorId";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@doctorId", doctorId);

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                doctorFullname = reader["doctorFullName"].ToString();
            }
            else
            {
                doctorFullname = "Error getting doctor fullname";
            }

            reader.Close();
            conn.Close();

            return doctorFullname;
        }

    }
}