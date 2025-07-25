using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshope
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Session["UserId"].ToString());
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Get the UserId from the session
            int userId = Convert.ToInt32(Session["UserId"]); // Make sure the UserId is stored in the session during login

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL query to update the LogoutTime for the logged-in user
                string query = "UPDATE Audit SET LogoutTime = @logouttime WHERE A_id = @userId";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@logouttime", DateTime.Now); // Set the current time as LogoutTime
                command.Parameters.AddWithValue("@userId", userId); // Use UserId from the session

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery(); // Execute the update query
                }
                catch (Exception ex)
                {
                    // Optionally log the error or show a user-friendly message
                    // lblMessage.Text = "An error occurred during logout: " + ex.Message;
                }
            }

            // Clear the session and redirect to login page
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx"); // Redirect to login page
        }

    }
}
    
