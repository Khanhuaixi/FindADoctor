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
    public partial class Speciality : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {          
            if (Session["specialityId"] == null)
            {
                Response.Redirect("Home.aspx");
            }

            if (!IsPostBack)
            {
                loadSpecialityDetails();
            }
        }

        void loadSpecialityDetails()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string query = "SELECT * FROM tblSpeciality WHERE specialityId = @specialityId";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@specialityId", Session["specialityId"].ToString());

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                specialityNameLabel.Text = reader["specialityName"].ToString();
                specialityDescriptionLabel.Text = reader["specialityDescription"].ToString();
            }

            reader.Close();
            conn.Close();
        }

        protected void dataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "doctorDetails")
            {
                Label doctorId = e.Item.FindControl("doctorIdLabel") as Label;
                Session["doctorId"] = doctorId.Text;
                Response.Redirect("Doctor.aspx");
            }
        }

    }
}