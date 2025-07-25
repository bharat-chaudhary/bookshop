using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Bookshope
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AuthenticateUser();
        }

        private void AuthenticateUser()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Users WHERE U_name = @username AND U_password = @password AND U_type = @userType";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", txtname.Text.Trim());
                command.Parameters.AddWithValue("@password", txtpass.Text.Trim());
                command.Parameters.AddWithValue("@userType", DropDownList1.SelectedValue);

                try
                {
                    connection.Open();
                    SqlDataReader dr = command.ExecuteReader();

                    if (dr.Read())
                    {
                        Session["UserId"] = dr["U_id"];
                       
                        insertlogins(); 
                        string redirectUrl = DropDownList1.SelectedValue == "User" ? "UserHomePage.aspx" : "AdminHome.aspx";
                        Response.Redirect(redirectUrl);
                    }
                    else
                    {
                        ShowAlert("Wrong Username or Password");
                    }
                }
                catch (Exception ex)
                {
                    ShowAlert("An error occurred: " + ex.Message);
                }
            }
        }

        private void insertlogins()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Audit (UserName, UserType, LoginTime) VALUES (@username, @usertype, @logintime)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", txtname.Text.Trim());
                command.Parameters.AddWithValue("@userType", DropDownList1.SelectedValue);
                command.Parameters.AddWithValue("@logintime", DateTime.Now);
              
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery(); 
                }
                catch (Exception ex)
                {
                    // Optionally log this error
                }
            }
           // Response.Redirect("");
        }

        private void ShowAlert(string message)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
        }
    }
}
