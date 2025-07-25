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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                
                string query = "SELECT *  FROM Books where B_id=";

               
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    try
                    {
                        
                        conn.Open();

                        
                    }
                    catch (Exception ex)
                    {
                       
                        Console.WriteLine("An error occurred: " + ex.Message);
                    }
                }
            }

        }
    }
}