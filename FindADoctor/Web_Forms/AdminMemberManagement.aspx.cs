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
    public partial class AdminMemberManagement : System.Web.UI.Page
    {
        public enum MessageType { Success, Delete, Error };
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            idLabel.Text = gridView.SelectedRow.Cells[1].Text.ToString();
            memberIdLabel.Text = gridView.SelectedRow.Cells[2].Text.ToString();
            memberFirstNameTextBox.Text = gridView.SelectedRow.Cells[3].Text.ToString();
            memberLastNameTextBox.Text = gridView.SelectedRow.Cells[4].Text.ToString();
            memberEmailTextBox.Text = gridView.SelectedRow.Cells[5].Text.ToString();
            memberGenderRadioButtonList.SelectedValue = gridView.SelectedRow.Cells[6].Text.ToString();
            memberCreatedDateLabel.Text = gridView.SelectedRow.Cells[7].Text.ToString();
            memberPasswordLabel.Text = gridView.SelectedRow.Cells[8].Text.ToString();
        }
        protected void addButton_Click(object sender, EventArgs e)
        {
            memberIdLabel.Text = generateMemberId();
            memberCreatedDateLabel.Text = DateTime.Now.ToString();
            memberPasswordLabel.Text = "1234";

            if (dsMember.Insert() == 1)
            {
                showMessage("Member Account Added Successfully", MessageType.Success);
            }
            else
            {
                showMessage("Error Occured when Adding New Member Account", MessageType.Error);
            }


            clearAll();
        }
        protected void updateButton_Click(object sender, EventArgs e)
        {
            if (gridView.SelectedRow != null)
            {
                if (dsMember.Update() == 1)
                {
                    showMessage("Member Account Updated Successfully", MessageType.Success);
                }

            }
            else
            {
                showMessage("Please Select a Member to Update", MessageType.Error);
            }

            clearAll();
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            if (gridView.SelectedRow != null)
            {
                if (dsMember.Delete() == 1)
                {
                    showMessage("Member Account Deleted Successfully", MessageType.Delete);
                }
            }
            else
            {
                showMessage("Please Select a Member to Delete", MessageType.Error);
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
            memberIdLabel.Text = string.Empty;
            memberFirstNameTextBox.Text = string.Empty;
            memberLastNameTextBox.Text = string.Empty;
            memberEmailTextBox.Text = string.Empty;
            memberGenderRadioButtonList.ClearSelection();
            memberCreatedDateLabel.Text = string.Empty;
            memberPasswordLabel.Text = string.Empty;
            gridView.SelectedIndex = -1;
        }

        protected string generateMemberId()
        {
            string memberId;

            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string selectQuery = "SELECT TOP 1 * FROM tblMember ORDER BY ID DESC";
            SqlCommand comm = new SqlCommand(selectQuery, conn);

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                memberId = "M" + (int.Parse(reader["memberId"].ToString().Substring(1)) + 1);
            }
            else
            {
                memberId = "M1";
            }

            conn.Close();

            return memberId;
        }


    }
}