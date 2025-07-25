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
    public partial class OrderForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx"); // Redirect if not logged in
            }

            if (!IsPostBack)  // Ensure this runs only once when the page first loads
            {
                // Set the current date to the txtOrderDate TextBox in yyyy-MM-dd format
                txtOrderDate.Text = DateTime.Now.ToString("0:yyyy-MM-dd");
                txtUserId.Text = Session["UserId"].ToString();
            } // Set today's date
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int userId = (int)Session["UserId"];
            int bookId = int.Parse(txtBookId.Text);
            DateTime orderDate = DateTime.Parse(txtOrderDate.Text);
            int quantity = int.Parse(txtQuantity.Text);
            int ordePrice = 50;
            if (PlaceOrder(userId, bookId, orderDate, quantity,ordePrice))
            {
                lblMessage.Text = "Order placed successfully!";
            }
            else
            {
                lblMessage.Text = "Error placing order.";
            }
        }

        private bool PlaceOrder(int userId, int bookId, DateTime orderDate, int quantity,int ordePrice)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO OrderDetails (U_id, B_id, O_date, O_quantity, O_price) VALUES (@userId, @bookId, @orderDate, @quantity,@ordePrice)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@bookId", bookId);
                    cmd.Parameters.AddWithValue("@orderDate", orderDate);
                    cmd.Parameters.AddWithValue("@quantity", quantity);
                    cmd.Parameters.AddWithValue("@ordePrice", ordePrice);
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }
    }
}