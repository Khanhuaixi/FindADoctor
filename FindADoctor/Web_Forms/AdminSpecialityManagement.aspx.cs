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
    public partial class AdminSpecialityManagement : System.Web.UI.Page
    {
        public enum MessageType { Success, Delete, Error };
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            idLabel.Text = gridView.SelectedRow.Cells[1].Text.ToString();
            specialityIdLabel.Text = gridView.SelectedRow.Cells[2].Text.ToString();
            specialityNameTextBox.Text = gridView.SelectedRow.Cells[3].Text.ToString();
            specialityDescriptionTextBox.Text = gridView.SelectedRow.Cells[4].Text.ToString();
            specialityImageFileNameLabel.Text = gridView.SelectedRow.Cells[5].Text.ToString();
        }
        protected void addButton_Click(object sender, EventArgs e)
        {
            specialityIdLabel.Text = generateSpecialityId();

            if (specialityImageFileUpload.HasFile)
            {
                specialityImageFileUpload.SaveAs(Server.MapPath("/Image/" + "Speciality/" + specialityImageFileUpload.FileName.ToString())); //save to own directory
                String picturePath = "~/Image/" + "Speciality/" + specialityImageFileUpload.FileName.ToString();
                specialityImageFileNameLabel.Text = picturePath;
            }

            if (dsSpeciality.Insert() == 1)
            {
                showMessage("Speciality Added Successfully", MessageType.Success);
            }
            else
            {
                showMessage("Error Occured when Adding New Speciality", MessageType.Error);
            }


            clearAll();
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            if (specialityImageFileUpload.HasFile)
            {
                specialityImageFileUpload.SaveAs(Server.MapPath("/Image/" + "Speciality/" + specialityImageFileUpload.FileName.ToString())); //save to own directory
                String picturePath = "~/Image/" + "Speciality/" + specialityImageFileUpload.FileName.ToString();
                specialityImageFileNameLabel.Text = picturePath;
            }

            if (gridView.SelectedRow != null)
            {
                if (dsSpeciality.Update() == 1)
                {
                    showMessage("Speciality Updated Successfully", MessageType.Success);
                }

            }
            else
            {
                showMessage("Please Select a Speciality to Update", MessageType.Error);
            }
            clearAll();
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            if (gridView.SelectedRow != null)
            {
                if (dsSpeciality.Delete() == 1)
                {
                    showMessage("Speciality Deleted Successfully", MessageType.Delete);
                }
            }
            else
            {
                showMessage("Please Select a Speciality to Delete", MessageType.Error);
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
            specialityIdLabel.Text = string.Empty;
            specialityNameTextBox.Text = string.Empty;
            specialityDescriptionTextBox.Text = string.Empty;
            specialityImageFileUpload.Dispose();
            specialityImageFileNameLabel.Text = "Please Upload An Image";
            gridView.SelectedIndex = -1;
        }

        protected string generateSpecialityId()
        {
            string specialityId;

            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string selectQuery = "SELECT TOP 1 * FROM tblSpeciality ORDER BY ID DESC";
            SqlCommand comm = new SqlCommand(selectQuery, conn);

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                specialityId = "S" + (int.Parse(reader["specialityId"].ToString().Substring(1)) + 1);
            }
            else
            {
                specialityId = "S1";
            }

            conn.Close();

            return specialityId;
        }
    }
}