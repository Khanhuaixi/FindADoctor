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
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string query = "SELECT * FROM tblMember WHERE memberEmail = @memberEmail AND memberPassword = @memberPassword";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@memberEmail", memberEmailTextBox.Text.Trim()); //Trim will remove starting and ending spaces
            comm.Parameters.AddWithValue("@memberPassword", memberPasswordTextBox.Text.Trim());

            SqlDataReader reader = comm.ExecuteReader(); //execute command and the returned result can be read by reader

            if (reader.Read())
            {
                Session["memberId"] = reader["memberId"].ToString();
                Session["fullname"] = reader["memberFirstName"].ToString() + " " + reader["memberLastName"].ToString();

                Response.Redirect("~/Web_Forms/Home");
            }
            else
            {
                string title = "Login Unsuccessful";
                string body = "Your Email or Password is Incorrect";
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