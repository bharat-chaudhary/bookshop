using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshope
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
          
            string uPassword = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("U_passwordTextBox")).Text;
            string uName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("U_nameTextBox")).Text;
            string uContact = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("U_contactTextBox")).Text;
            string uAddress = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("U_addressTextBox")).Text;
            string uType = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("U_typeTextBox")).Text;

          
            if (string.IsNullOrEmpty(uPassword) || string.IsNullOrEmpty(uName))
            {
                e.Cancel = true;
                ErrorMessageLabel.Text = "Password and Name are required fields.";
                ErrorMessageLabel.Visible = true;
            }
            else
            {
                
                ErrorMessageLabel.Visible = false;
            }
        }

       
    }
}
