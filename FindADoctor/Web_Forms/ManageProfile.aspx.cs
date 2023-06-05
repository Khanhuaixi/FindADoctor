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
    public partial class ManageProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["memberId"] == null)
            {
                Response.Redirect("Home.aspx");
            }

            if (!IsPostBack)
            {
                loadProfile();
            }
        }

        void loadProfile()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string query = "SELECT * FROM tblMember WHERE memberId = @memberId";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@memberId", Session["memberId"].ToString()); 

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                firstNameTextBox.Text = reader["memberFirstName"].ToString();
                lastNameTextBox.Text = reader["memberLastName"].ToString();
                Session["fullname"] = reader["memberFirstName"].ToString() + " " + reader["memberLastName"].ToString();
                genderDropDownList.SelectedValue = reader["memberGender"].ToString();
            }

            reader.Close();
            conn.Close();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string query = "UPDATE tblMember SET memberFirstName=@memberFirstName, memberLastName=@memberLastName, memberGender=@memberGender WHERE memberId=@memberId";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@memberId", Session["memberId"].ToString());
            comm.Parameters.AddWithValue("@memberFirstName", firstNameTextBox.Text.Trim());
            comm.Parameters.AddWithValue("@memberLastName", lastNameTextBox.Text.Trim());
            comm.Parameters.AddWithValue("@memberGender", genderDropDownList.SelectedValue);

            int result = comm.ExecuteNonQuery();
            if (result > 0)
            {
                loadProfile();
                Response.Redirect("Home.aspx");
            }
            else
            {
                string title = "Error";
                string body = "Profile not Updated. Please Update Again.";
                showModal(title, body);
            }
            conn.Close();
        }

        protected void changePasswordButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void showModal(string title, string body)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "PopUpModal", "showModal('" + title + "', '" + body + "');", true);
        }


    }
}