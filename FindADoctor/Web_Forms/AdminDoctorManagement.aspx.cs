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
    public partial class AdminDoctorManagement : System.Web.UI.Page
    {
        public enum MessageType { Success, Delete, Error };
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            idLabel.Text = gridView.SelectedRow.Cells[1].Text.ToString();
            doctorIdLabel.Text = gridView.SelectedRow.Cells[2].Text.ToString();
            doctorFullNameTextBox.Text = gridView.SelectedRow.Cells[3].Text.ToString();
            doctorGenderRadioButtonList.SelectedValue = gridView.SelectedRow.Cells[5].Text.ToString();
            specialityRadioButtonList.SelectedValue = gridView.SelectedRow.Cells[6].Text.ToString();
            doctorLanguagesTextBox.Text = gridView.SelectedRow.Cells[7].Text.ToString();
            doctorQualificationsTextBox.Text = gridView.SelectedRow.Cells[8].Text.ToString();
            doctorLocationTextBox.Text = gridView.SelectedRow.Cells[9].Text.ToString();
            doctorContactTextBox.Text = gridView.SelectedRow.Cells[10].Text.ToString();
            doctorImageFileNameLabel.Text = gridView.SelectedRow.Cells[11].Text.ToString();
        }
        protected void addButton_Click(object sender, EventArgs e)
        {
            doctorIdLabel.Text = generateDoctorId();

            if (doctorImageFileUpload.HasFile)
            {
                doctorImageFileUpload.SaveAs(Server.MapPath("/Image/" + "Doctor/" + doctorImageFileUpload.FileName.ToString())); //save to own directory
                String picturePath = "~/Image/" + "Doctor/" + doctorImageFileUpload.FileName.ToString();
                doctorImageFileNameLabel.Text = picturePath;
            }

            if (dsDoctor.Insert() == 1)
            {
                showMessage("Doctor Added Successfully", MessageType.Success);
            }
            else
            {
                showMessage("Error Occured when Adding New Doctor", MessageType.Error);
            }


            clearAll();
        }
        protected void updateButton_Click(object sender, EventArgs e)
        {
            if (doctorImageFileUpload.HasFile)
            {
                doctorImageFileUpload.SaveAs(Server.MapPath("/Image/" + "Doctor/" + doctorImageFileUpload.FileName.ToString())); //save to own directory
                String picturePath = "~/Image/" + "Doctor/" + doctorImageFileUpload.FileName.ToString();
                doctorImageFileNameLabel.Text = picturePath;
            }

            if (gridView.SelectedRow != null)
            {
                if (dsDoctor.Update() == 1)
                {
                    showMessage("Doctor Updated Successfully", MessageType.Success);
                }

            }
            else
            {
                showMessage("Please Select a Doctor to Update", MessageType.Error);
            }

            clearAll();
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            if (gridView.SelectedRow != null)
            {
                if (dsDoctor.Delete() == 1)
                {
                    showMessage("Doctor Deleted Successfully", MessageType.Delete);
                }
            }
            else
            {
                showMessage("Please Select a Doctor to Delete", MessageType.Error);
            }
            clearAll();
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
            doctorIdLabel.Text = string.Empty;
            doctorFullNameTextBox.Text = string.Empty;
            doctorGenderRadioButtonList.ClearSelection();
            specialityRadioButtonList.ClearSelection();
            doctorLanguagesTextBox.Text = string.Empty;
            doctorQualificationsTextBox.Text = string.Empty;
            doctorLocationTextBox.Text = string.Empty;
            doctorContactTextBox.Text = string.Empty;
            doctorImageFileUpload.Dispose();
            doctorImageFileNameLabel.Text = "Please Upload An Image";
            gridView.SelectedIndex = -1;
        }

        protected string generateDoctorId()
        {
            string memberId;

            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string selectQuery = "SELECT TOP 1 * FROM tblDoctor ORDER BY ID DESC";
            SqlCommand comm = new SqlCommand(selectQuery, conn);

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                memberId = "D" + (int.Parse(reader["doctorId"].ToString().Substring(1)) + 1);
            }
            else
            {
                memberId = "D1";
            }

            conn.Close();

            return memberId;
        }
    }
}