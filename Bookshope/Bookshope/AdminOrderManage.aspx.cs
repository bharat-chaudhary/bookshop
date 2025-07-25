using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Bookshope
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtqunt.Text = GridView1.SelectedRow.Cells[5].Text;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            update();
        }
        void update()
        {
            try
            {
                // Create SQL connection
                SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                // Convert the entered quantity to integer
                int addedQuantity = Convert.ToInt32(txtqunt.Text);

                // Update query to add the entered quantity to the existing value
                string query = "UPDATE Books SET B_quantity = B_quantity - @AddedQuantity";

                // Create SQL command
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@AddedQuantity", addedQuantity);

                // Open connection
                connection.Open();

                // Execute the command
                command.ExecuteNonQuery();

                // Refresh the GridView to reflect changes
                GridView1.DataBind();

                // Close the connection
                connection.Close();

                // Show a success message
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('Data updated successfully')</script>");
            }
            catch (Exception ex)
            {
                // Handle and display exceptions
                Response.Write(ex.ToString());
            }
        }



    }
}