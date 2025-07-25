using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Bookshope
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
       // SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Session["Userid"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = " Select * from Users where U_id ='" + id + "'";
                cmd.Connection = con;
                cmd.CommandType = System.Data.CommandType.Text;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        txtid.Text = reader["U_id"].ToString();
                        txtname.Text = reader["U_name"].ToString();
                        txtpass.Text = reader["U_password"].ToString();
                        txtaddre.Text = reader["U_address"].ToString();                       
                        txtmonu.Text = reader["U_contact"].ToString();
                        
                    }

                }
                con.Close();
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            update();
        }
        void update()
        {
            try
            {
                // SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                string a = Session["Userid"].ToString();
                string name = txtname.Text.Trim();           
                
                string password = txtpass.Text.Trim();
                string mob = txtmonu.Text.Trim();
                string addes = txtaddre.Text.Trim();
                SqlCommand command = new SqlCommand("update Users set U_name='" + name + "', U_password='" + password + "', U_address='" + addes + "',U_contact='" + Convert.ToInt64(mob) + "'where U_id=" + Convert.ToInt16(a));
                command.Connection = con;
                command.CommandType = System.Data.CommandType.Text;
                con.Open();
                GridView1.DataSource = command.ExecuteReader();
                GridView1.DataBind();
                // Response.Write(command.CommandText);
                con.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('Update successfully')</script>");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

    }
}