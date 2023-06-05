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
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void loginButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string query = "SELECT * FROM tblAdmin WHERE adminId = @adminId AND password = @password";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@adminId", adminIdTextBox.Text.Trim());
            comm.Parameters.AddWithValue("@password", passwordTextBox.Text.Trim());

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                Session["adminId"] = reader["adminId"].ToString();
                Response.Redirect("~/Web_Forms/Home");

            }
            else
            {
                string title = "Login Unsuccessful";
                string body = "The Admin Id or Password is Incorrect";
                showModal(title, body);
            }
            reader.Close();
            conn.Close();
        }

        protected void showModal(string title, string body)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "PopUpModal", "showModal('" + title + "', '" + body + "');", true);
        }
    }
}