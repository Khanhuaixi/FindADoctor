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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string query = "SELECT * FROM tblMember WHERE memberEmail = @memberEmail";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@memberEmail", emailTextBox.Text.Trim()); 

            SqlDataReader reader = comm.ExecuteReader(); 

            if (reader.Read())
            {
                string title = "You Already have an Account";
                string body = "The Email You Used Already have an Account. Each Email can only be Used for an Account.";
                showModal(title, body);
            }
            else
            {
                if (passwordTextBox.Text == confirmPasswordTextBox.Text)
                {
                    memberIdLabel.Text = generateMemberId();
                    memberCreatedDateLabel.Text = DateTime.Now.ToString();
                    dsMember.Insert();
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    string title = "Password does not Match";
                    string body = "Please Confirm the Password You Provided";
                    showModal(title, body);
                }
            }
            conn.Close();
        }

        protected string generateMemberId()
        {
            string memberId = "";

            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string selectQuery = "SELECT TOP 1 * FROM tblMember ORDER BY ID DESC";
            SqlCommand comm = new SqlCommand(selectQuery, conn);

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                memberId = "M" + (int.Parse(reader["Id"].ToString()) + 1);
            }
            else
            {
                memberId = "M1";
            }

            conn.Close();

            return memberId;
        }
        protected void showModal(string title, string body)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "PopUpModal", "showModal('" + title + "', '" + body + "');", true);
        }


    }
}