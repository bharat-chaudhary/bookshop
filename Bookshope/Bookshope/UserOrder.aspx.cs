using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshope
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect to Login page if the user is not logged in
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Ensure the selected row exists
            if (GridView1.SelectedRow != null)
            {
                // Populate form fields based on the selected row in GridView
                txtuserid.Text = Session["UserId"].ToString();
                txtbookid.Text = GridView1.SelectedDataKey.Value.ToString();
                txtname.Text = GridView1.SelectedRow.Cells[1].Text;
                txtprice.Text = GridView1.SelectedRow.Cells[2].Text;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                // Retrieve form data
                int userId = Convert.ToInt32(Session["UserId"]);
                int bookId = Convert.ToInt32(txtbookid.Text);
                DateTime orderDate = DateTime.Now; // Automatically gets the current date and time
                int quantity = Convert.ToInt32(txtquntity.Text);
                decimal orderPrice = Convert.ToDecimal(txtprice.Text);
                string name = txtname.Text;

                // Place the order and show a success message
                if (PlaceOrder(userId, bookId, orderDate, quantity, orderPrice, name))
                {
                    lblMessage.Text = "Order placed successfully!";
                    lblMessage.CssClass = "text-success";
                }
                else
                {
                    lblMessage.Text = "Error placing order.";
                    lblMessage.CssClass = "text-danger";
                }
            }
            catch (FormatException)
            {
                // Handle invalid input (e.g., invalid number format)
                lblMessage.Text = "Please enter valid quantities and price.";
                lblMessage.CssClass = "text-warning";
            }
            catch (Exception ex)
            {
                // Handle unexpected errors
                lblMessage.Text = $"An error occurred: {ex.Message}";
                lblMessage.CssClass = "text-danger";
            }
        }

        private bool PlaceOrder(int userId, int bookId, DateTime orderDate, int quantity, decimal orderPrice, string name)
        {
            // Get the connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // SQL query for inserting a new order into the database
                string query = "INSERT INTO OrderDetails (U_id, B_id, B_name, B_price, O_date, O_quantity, O_price) " +
                               "VALUES (@userId, @bookId, @name, @orderPrice, @orderDate, @quantity, @totalPrice)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Add parameters to prevent SQL injection
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@bookId", bookId);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@orderPrice", orderPrice);
                    cmd.Parameters.AddWithValue("@orderDate", orderDate);
                    cmd.Parameters.AddWithValue("@quantity", quantity);
                    cmd.Parameters.AddWithValue("@totalPrice", orderPrice * quantity); // Calculate total price

                    // Execute the query and check if a row was inserted
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }
    }
}
