using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;
using System.Drawing;
using System.Drawing.Printing;

namespace project
{
    public partial class Print : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Label77.Text = Session["application_no"]?.ToString() ?? "";
            //Label77.Text = "1004";
            string applicationno = Label77.Text.Trim();
            FetchUserDetails(applicationno);
            DisplayImage();
            DisplayImage2();
            ShowAttachmentStatus();


        }

        

        private void FetchUserDetails(string applicationno)
        {
            string connectionString = @"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True";
            string query = @"SELECT surname, Name, father_Name, mother_name, gender, category, date_of_birth,phone_number,email_id,address,country,state,district,pincode,permanent_address,permanent_country,permanent_state,permanent_district,permanent_pincode,X_coursename,X_schoolname,X_endingdate,X_board,X_percentage,
               Xi_coursename,Xi_collegename,Xi_universityname,Xi_endingdate,Xi_board,Xi_percentage,degree_coursename,degree_collegename,degree_universityname,
            degree_endingdate,degree_board,degree_percentage,postdegree_coursename,postdegree_collegename,postdegree_universityname,postdegree_endingdate,postdegree_board,postdegree_percentage FROM [dbo].[Registration] WHERE applicationno = @applicationno";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    command.Parameters.AddWithValue("@applicationno", applicationno);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {

                            Label2.Text = reader["surname"].ToString();
                            Label4.Text = reader["Name"].ToString();
                            Label6.Text = reader["father_Name"].ToString();
                            Label8.Text = reader["mother_name"].ToString();
                            Label10.Text = reader["gender"].ToString();
                            Label12.Text = reader["category"].ToString();
                            Label14.Text = reader["date_of_birth"].ToString();
                            Label16.Text = reader["phone_number"].ToString();
                            Label20.Text = reader["email_id"].ToString();
                           
                            Label22.Text = reader["address"].ToString() + ", " +
                reader["state"].ToString() + ", " +
                reader["district"].ToString() + ", " +
                reader["country"].ToString() + ", " +
                reader["pincode"].ToString();
                            Label24.Text = reader["permanent_address"].ToString() + ", " +
                 reader["permanent_state"].ToString() + ", " +
                 reader["permanent_district"].ToString() + ", " +
                 reader["permanent_country"].ToString() + ", " +
                 reader["permanent_pincode"].ToString();

                            Label34.Text = reader["X_coursename"].ToString();
                            Label35.Text = reader["X_schoolname"].ToString();
                            
                          
                            Label38.Text = reader["X_endingdate"].ToString();
                            Label39.Text = reader["X_board"].ToString();
                            Label40.Text = reader["X_percentage"].ToString();

                            Label42.Text = reader["Xi_coursename"].ToString();
                            Label43.Text = reader["Xi_collegename"].ToString();
                            Label44.Text = reader["Xi_universityname"].ToString();
                            
                            Label46.Text = reader["Xi_endingdate"].ToString();
                            Label47.Text = reader["Xi_board"].ToString();
                            Label48.Text = reader["Xi_percentage"].ToString();

                            Label50.Text = reader["degree_coursename"].ToString();
                            Label51.Text = reader["degree_collegename"].ToString();
                            Label52.Text = reader["degree_universityname"].ToString();
                          
                            Label54.Text = reader["degree_endingdate"].ToString();
                            Label55.Text = reader["degree_board"].ToString();
                            Label56.Text = reader["degree_percentage"].ToString();

                            Label58.Text = reader["postdegree_coursename"].ToString();
                            Label59.Text = reader["postdegree_collegename"].ToString();
                            Label60.Text = reader["postdegree_universityname"].ToString();
                           
                            Label62.Text = reader["postdegree_endingdate"].ToString();
                            Label63.Text = reader["postdegree_board"].ToString();
                            Label64.Text = reader["postdegree_percentage"].ToString();
                            
                        }
                        else
                        {
                            Label78.Text = "Record not found.";
                            Label78.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    catch (Exception ex)
                    {

                        Label78.Text = "An error occurred: " + ex.Message;
                        Label78.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
        protected void DisplayImage()
        {
            string applicationId = Label77.Text.Trim();
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT photo_data FROM [dbo].[Registration] WHERE applicationno = @applicationid";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@applicationid", applicationId);
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    con.Close();

                    if (result != null && result != DBNull.Value)
                    {
                        byte[] imgBytes = (byte[])result;
                        string base64String = Convert.ToBase64String(imgBytes);
                        Image1.ImageUrl = "data:image/jpeg;base64," + base64String; // Display image
                    }
                    else
                    {
                        Label78.Text = "No image found for this Application ID.";
                    }
                }
            }
        }
        protected void DisplayImage2()
        {
            string applicationId = Label77.Text.Trim();
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT sign_data FROM [dbo].[Registration] WHERE applicationno = @applicationid";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@applicationid", applicationId);
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    con.Close();

                    if (result != null && result != DBNull.Value)
                    {
                        byte[] imgBytes = (byte[])result;
                        string base64String = Convert.ToBase64String(imgBytes);
                        Image2.ImageUrl = "data:image/jpeg;base64," + base64String; // Display image
                    }
                    else
                    {
                        Label78.Text = "No image found for this Application ID.";
                    }
                }
            }
        }
        protected void ShowAttachmentStatus()
        {
            try
            {
                string applicationId = Label77.Text.Trim(); // Assuming Label1 contains the Application ID
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = @"
                SELECT aadhar_data, x_data, xi_data, degree_data, postdegree_data 
                FROM [dbo].[Registration] 
                WHERE applicationno = @applicationid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@applicationid", applicationId);
                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read()) // Check if record exists
                            {
                                Label68.Text = reader["aadhar_data"] != DBNull.Value ? "Attached" : "Not Attached";
                                Label70.Text = reader["x_data"] != DBNull.Value ? "Attached" : "Not Attached";
                                Label72.Text = reader["xi_data"] != DBNull.Value ? "Attached" : "Not Attached";
                                Label74.Text = reader["degree_data"] != DBNull.Value ? "Attached" : "Not Attached";
                                Label76.Text = reader["postdegree_data"] != DBNull.Value ? "Attached" : "Not Attached";

                                // Set color for labels
                                Label68.ForeColor = reader["aadhar_data"] != DBNull.Value ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                                Label70.ForeColor = reader["x_data"] != DBNull.Value ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                                Label72.ForeColor = reader["xi_data"] != DBNull.Value ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                                Label74.ForeColor = reader["degree_data"] != DBNull.Value ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                                Label76.ForeColor = reader["postdegree_data"] != DBNull.Value ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                            }
                            else
                            {
                                Label78.Text = "No records found for this Application ID.";
                                Label78.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Label78.Text = "Error: " + ex.Message;
                Label78.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Remove("skey"); // Optional: Clear skey when returning home
            Response.Redirect("homepage.aspx");
        }
    }
        }
    

    
