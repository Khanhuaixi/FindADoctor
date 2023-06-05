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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            //check old password 
            string query = "SELECT * FROM tblMember WHERE memberId = @memberId";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@memberId", Session["memberId"].ToString());

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                if (oldPasswordTextBox.Text != reader["memberPassword"].ToString())
                {
                    string title = "Wrong Password";
                    string body = "Password Incorrect. Please Provide Your Current Password before Changing Password";
                    showModal(title, body);
                }
            }

            reader.Close();

            //check new password
            if (newPasswordTextBox.Text == confirmNewPasswordTextBox.Text)
            {
                query = "UPDATE tblMember SET memberPassword=@memberPassword WHERE memberId=@memberId";
                comm = new SqlCommand(query, conn);
                comm.Parameters.AddWithValue("@memberId", Session["memberId"].ToString());
                comm.Parameters.AddWithValue("@memberPassword", newPasswordTextBox.Text.Trim());

                int result = comm.ExecuteNonQuery();
                if (result > 0)
                {
                    string title = "Password Updated";
                    string body = "Password Updated Successfully. Please use the Updated Password Next Time.";
                    showModal(title, body);
                }
                else
                {
                    string title = "Error";
                    string body = "Password not Updated. Please Try Again.";
                    showModal(title, body);
                }
            }
            else
            {
                string title = "Password does not Match";
                string body = "Please Confirm the New Password You Provided";
                showModal(title, body);
            }
            conn.Close();


        }

        protected void showModal(string title, string body)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "PopUpModal", "showModal('" + title + "', '" + body + "');", true);
        }


    }
}