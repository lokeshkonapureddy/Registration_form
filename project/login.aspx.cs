using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace project
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string applicationno = TextBox1.Text;
           
        }
        private void FetchUserDetails(string applicationno)
        {
            string connectionString = @"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True";
            string query = @"SELECT regstep1, regstep2, regstep3 FROM [dbo].[Registration] WHERE applicationno = @applicationno";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@applicationno", TextBox1.Text);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())  // If the record exists
                        {
                            object regStep1 = reader["regstep1"];
                            object regStep2 = reader["regstep2"];
                            object regStep3 = reader["regstep3"];

                            // Generate a unique skey
                            string skey = Guid.NewGuid().ToString();
                            Session["skey"] = skey;  // Store in session
                            Session["application_no"] = TextBox1.Text; // Store application number

                            if (regStep1 == DBNull.Value)
                            {
                                Response.Redirect("Regstep1.aspx?skey=" + skey);
                            }
                            else if (regStep2 == DBNull.Value)
                            {
                                Response.Redirect("Regstep2.aspx?skey=" + skey);
                            }
                            else if (regStep3 == DBNull.Value)
                            {
                                Response.Redirect("Regstep3.aspx?skey=" + skey);
                            }
                            else
                            {
                                Response.Redirect("Print.aspx?skey=" + skey);
                            }
                        }
                        else
                        {
                            Label6.Text = "Invalid Application Number!";
                            Label6.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    catch (Exception ex)
                    {
                        Label6.Text = "An error occurred: " + ex.Message;
                        Label6.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            captcha1.ValidateCaptcha(TextBox3.Text.Trim());
            if (captcha1.UserValidated)
            {

            
                string applicationNumber = TextBox1.Text;
            string dateOfBirth = TextBox2.Text;

            string connectionString = @"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(*) FROM [dbo].[Registration] WHERE applicationno = @AppNumber AND date_of_birth = @DOB";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@AppNumber", applicationNumber);
                        cmd.Parameters.AddWithValue("@DOB", dateOfBirth);

                        con.Open();
                        int count = Convert.ToInt32(cmd.ExecuteScalar());

                        if (count > 0)
                        {
                            FetchUserDetails(applicationNumber); // Fetch user details and redirect accordingly

                        }
                        else
                        {
                            Label6.Text = "Invalid Application Number or Date of Birth.";
                            Label6.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            else
            {
                Label6.Text = "Enter the correct captcha";
            }
        }
    }
}