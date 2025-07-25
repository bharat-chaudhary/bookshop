using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshope
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT B_Id, B_Name, B_Author, B_Price, B_Quantity, B_Img FROM Books", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string title = B_Titel.Text;
            string author = B_Author.Text;
            decimal price;
            int quantity;

            if (!decimal.TryParse(Price.Text, out price))
            {
                lblMessage.Text = "Please enter a valid price.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (!int.TryParse(Category.Text, out quantity))
            {
                lblMessage.Text = "Please enter a valid quantity.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string imgUrl = UploadImage();
            if (imgUrl == null)
            {
                lblMessage.Text = "Please upload a valid image.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Books (B_Name, B_Author, B_Price, B_Quantity, B_Img) VALUES (@Name, @Author, @Price, @Quantity, @Img)", conn);
                    cmd.Parameters.AddWithValue("@Name", title);
                    cmd.Parameters.AddWithValue("@Author", author);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@Img", imgUrl);

                    cmd.ExecuteNonQuery();
                }

                BindGridView();
                ClearFields();

                lblMessage.Text = "Book added successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error adding book: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private string UploadImage()
        {
            if (ImageUpload.HasFile)
            {
                try
                {
                    
                    string extension = Path.GetExtension(ImageUpload.FileName).ToLower();
                    if (extension != ".jpg" && extension != ".jpeg" && extension != ".png" && extension != ".gif" && extension != ".jfif")
                    {
                        lblMessage.Text = "Invalid image format. Please upload a JPG, PNG, or GIF.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return null;
                    }

                  
                    string folderPath = Server.MapPath("~/Images/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string fileName = Path.GetFileName(ImageUpload.PostedFile.FileName);
                    string filePath = Path.Combine(folderPath, fileName);

                  
                    if (File.Exists(filePath))
                    {
                        lblMessage.Text = "An image with the same name already exists. Please rename your file.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return null;
                    }

                    ImageUpload.SaveAs(filePath);
                    return "~/Images/" + fileName;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Image upload failed: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return null;
                }
            }
            else
            {
                lblMessage.Text = "No file selected.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return null;
            }
        }

        private void ClearFields()
        {
            B_Titel.Text = "";
            B_Author.Text = "";
            Price.Text = "";
            Category.Text = "";
            ImageUpload.Attributes.Clear(); 
        }
    }
}
