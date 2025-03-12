using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace project
{
    public partial class Regstep2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings: UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Request.QueryString["skey"] == null || Session["skey"] == null || Request.QueryString["skey"] != Session["skey"].ToString())
            {
                Response.Redirect("homepage.aspx"); // Redirect to homepage if key is invalid
            }
            Label6.Text = Session["application_no"]?.ToString() ?? "";
            //Label6.Text = "1009";

            string applicationno = Label6.Text;
            FetchUserDetails(applicationno);
            //TextBox1.Text = Session["Surname"]?.ToString() ?? "";
            //TextBox2.Text = Session["name"]?.ToString() ?? "";
            //TextBox3.Text = Session["category"]?.ToString() ?? "";
            //TextBox4.Text = Session["DateOfBirth"]?.ToString() ?? "";
            //TextBox5.Text = Session["phonenumber"]?.ToString() ?? "";
            PopulatePassedOutYears();
        }

        private void PopulatePassedOutYears()
        {
            int currentYear = DateTime.Now.Year;
            DropDownList5.Items.Add("Select Year"); // Default Option

            for (int year = currentYear; year >= currentYear - 30; year--)
            {
                DropDownList5.Items.Add(year.ToString());
            }
        }
        private void FetchUserDetails(string applicationno)
        {
            string connectionString = @"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True";
            string query = @"SELECT surname, Name,category,date_of_birth,phone_number FROM [dbo].[Registration] WHERE applicationno = @applicationno";

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

                            TextBox1.Text = reader["surname"].ToString();
                            TextBox2.Text = reader["Name"].ToString();
                            TextBox3.Text = reader["category"].ToString();
                            TextBox4.Text = reader["date_of_birth"].ToString();
                            TextBox5.Text = reader["phone_number"].ToString();

                        }
                        else
                        {
                            Label40.Text = "Record not found.";
                            Label40.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    catch (Exception ex)
                    {

                        Label40.Text = "An error occurred: " + ex.Message;
                        Label40.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
           
                    TextBox6.Enabled = false;
                    TextBox7.Enabled = false;
                    TextBox8.Enabled = false;

                    TextBox11.Enabled = false;
                    TextBox12.Enabled = false;
                    TextBox13.Enabled = false;
                    TextBox14.Enabled = false;

                    TextBox17.Enabled = false;
                    TextBox18.Enabled = false;
                    TextBox19.Enabled = false;
                    TextBox20.Enabled = false;

                    TextBox23.Enabled = false;
                    TextBox24.Enabled = false;
                    TextBox24.Enabled = false;
                    TextBox25.Enabled = false;

                    TextBox28.Enabled = false;


                    DropDownList3.Enabled = false;
                    DropDownList4.Enabled = false;
                    DropDownList1.Enabled = false;
                    DropDownList2.Enabled = false;
                    DropDownList5.Enabled = false;
                    DropDownList6.Enabled = false;
                    DropDownList7.Enabled = false;
                    DropDownList8.Enabled = false;



                    // Hide submit button and show edit button
                    Button1.Visible = false;
                    btnEdit.Visible = true;
                    btnConfirm.Visible = true;
             
        

       



            }


    // Disable fields

   
                        

        protected void cvPassedOutYear_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int dobYear;
            int passYear;

            // Parse DOB and Passed Out Year
            if (int.TryParse(TextBox4.Text.Trim(), out dobYear) && int.TryParse(DropDownList5.SelectedValue, out passYear))
            {
                // Check if Passed Out Year is at least 11 years after DOB
                if (passYear - dobYear >= 11)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void cvPassedOutYear0_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int dobYear;
            int passYear;

            // Parse DOB and Passed Out Year
            if (int.TryParse(DropDownList5.SelectedValue, out dobYear) && int.TryParse(DropDownList6.SelectedValue, out passYear))
            {
                // Check if Passed Out Year is at least 2 years after DOB
                if (dobYear == 0)
                {
                    args.IsValid = false;
                }
                else if (passYear - dobYear >= 2)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void cvPassedOutYear1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int dobYear;
            int passYear;

            // Parse DOB and Passed Out Year
            if (int.TryParse(DropDownList6.SelectedValue, out dobYear) && int.TryParse(DropDownList7.SelectedValue, out passYear))
            {
                // Check if Passed Out Year is at least 3 years after DOB
                if (dobYear == 0)
                {
                    args.IsValid = false;
                }
                else if (passYear - dobYear >= 3)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void cvPassedOutYear2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int dobYear;
            int passYear;

            // Parse DOB and Passed Out Year
            if (int.TryParse(DropDownList7.SelectedValue, out dobYear) && int.TryParse(DropDownList8.SelectedValue, out passYear))
            {
                // Check if Passed Out Year is at least 2 years after DOB
                if (dobYear == 0)
                {
                    args.IsValid = false;
                }
                else if (passYear - dobYear >= 2)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = false;
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Enable fields
            
            TextBox6.Enabled = true;
            TextBox7.Enabled = true;
            TextBox8.Enabled = true;
           
            TextBox11.Enabled = true;
            TextBox12.Enabled = true;
            TextBox13.Enabled = true;
            TextBox14.Enabled = true;

            TextBox17.Enabled = true;
            TextBox18.Enabled = true;
            TextBox19.Enabled = true;
            TextBox20.Enabled = true;
           
            TextBox23.Enabled = true;
            TextBox24.Enabled = true;
            TextBox24.Enabled = true;
            TextBox25.Enabled = true;
           
            TextBox28.Enabled = true;


            DropDownList3.Enabled = true;
            DropDownList4.Enabled = true;
            DropDownList1.Enabled = true;
            DropDownList2.Enabled = true;

            DropDownList5.Enabled = true;
            DropDownList6.Enabled = true;
            DropDownList7.Enabled = true;
            DropDownList8.Enabled = true;

            // Hide edit button and show confirm button
            btnEdit.Visible = false;
            btnConfirm.Visible = false;
            Button1.Visible = true;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True";

            string query = @"
        UPDATE [dbo].[Registration]
        SET  
            [X_coursename] = @X_coursename,
            [X_schoolname] = @X_schoolname,
            [X_endingdate] = @X_endingdate,
            [X_board] = @X_board,
            [X_percentage] = @X_percentage,
            [Xi_coursename] = @Xi_coursename,
            [Xi_collegename] = @Xi_collegename,
            [Xi_universityname] = @Xi_universityname,
            [Xi_endingdate] = @Xi_endingdate,
            [Xi_board] = @Xi_board,
            [Xi_percentage] = @Xi_percentage,
            [degree_coursename] = @degree_coursename,
            [degree_collegename] = @degree_collegename,
            [degree_universityname] = @degree_universityname,
            [degree_endingdate] = @degree_endingdate,
            [degree_board] = @degree_board,
            [degree_percentage] = @degree_percentage,
            [postdegree_coursename] = @postdegree_coursename,
            [postdegree_collegename] = @postdegree_collegename,
            [postdegree_universityname] = @postdegree_universityname,
            [postdegree_endingdate] = @postdegree_endingdate,
            [postdegree_board] = @postdegree_board,
            [postdegree_percentage] = @postdegree_percentage,
            [regstep2] = @regstep2
        WHERE applicationno = @applicationid;";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@applicationid", Label6.Text.Trim());

                    // Convert empty text to NULL
                    cmd.Parameters.AddWithValue("@X_coursename", string.IsNullOrWhiteSpace(TextBox6.Text) ? (object)DBNull.Value : TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@X_schoolname", string.IsNullOrWhiteSpace(TextBox8.Text) ? (object)DBNull.Value : TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@X_endingdate", DropDownList5.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@X_board", DropDownList1.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@X_percentage", string.IsNullOrWhiteSpace(TextBox11.Text) ? (object)DBNull.Value : TextBox11.Text.Trim());

                    cmd.Parameters.AddWithValue("@Xi_coursename", string.IsNullOrWhiteSpace(TextBox12.Text) ? (object)DBNull.Value : TextBox12.Text.Trim());
                    cmd.Parameters.AddWithValue("@Xi_collegename", string.IsNullOrWhiteSpace(TextBox13.Text) ? (object)DBNull.Value : TextBox13.Text.Trim());
                    cmd.Parameters.AddWithValue("@Xi_universityname", string.IsNullOrWhiteSpace(TextBox14.Text) ? (object)DBNull.Value : TextBox14.Text.Trim());
                    cmd.Parameters.AddWithValue("@Xi_endingdate", DropDownList6.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Xi_board", DropDownList2.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Xi_percentage", string.IsNullOrWhiteSpace(TextBox17.Text) ? (object)DBNull.Value : TextBox17.Text.Trim());

                    cmd.Parameters.AddWithValue("@degree_coursename", string.IsNullOrWhiteSpace(TextBox18.Text) ? (object)DBNull.Value : TextBox18.Text.Trim());
                    cmd.Parameters.AddWithValue("@degree_collegename", string.IsNullOrWhiteSpace(TextBox19.Text) ? (object)DBNull.Value : TextBox19.Text.Trim());
                    cmd.Parameters.AddWithValue("@degree_universityname", string.IsNullOrWhiteSpace(TextBox20.Text) ? (object)DBNull.Value : TextBox20.Text.Trim());
                    cmd.Parameters.AddWithValue("@degree_endingdate", DropDownList7.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@degree_board", DropDownList3.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@degree_percentage", string.IsNullOrWhiteSpace(TextBox23.Text) ? (object)DBNull.Value : TextBox23.Text.Trim());

                    cmd.Parameters.AddWithValue("@postdegree_coursename", string.IsNullOrWhiteSpace(TextBox7.Text) ? (object)DBNull.Value : TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@postdegree_collegename", string.IsNullOrWhiteSpace(TextBox24.Text) ? (object)DBNull.Value : TextBox24.Text.Trim());
                    cmd.Parameters.AddWithValue("@postdegree_universityname", string.IsNullOrWhiteSpace(TextBox25.Text) ? (object)DBNull.Value : TextBox25.Text.Trim());
                    cmd.Parameters.AddWithValue("@postdegree_endingdate",
    (DropDownList8.SelectedItem?.Value == "0" || string.IsNullOrWhiteSpace(DropDownList8.SelectedItem?.Text))
    ? (object)DBNull.Value
    : DropDownList8.SelectedItem.Text);

                    cmd.Parameters.AddWithValue("@postdegree_board",
                        (DropDownList4.SelectedItem?.Value == "0" || string.IsNullOrWhiteSpace(DropDownList4.SelectedItem?.Text))
                        ? (object)DBNull.Value
                        : DropDownList4.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@postdegree_percentage", string.IsNullOrWhiteSpace(TextBox28.Text) ? (object)DBNull.Value : TextBox28.Text.Trim());

                    cmd.Parameters.AddWithValue("@regstep2", "1");

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();

                        // Store session variables if needed
                        Session["application_no"] = Label6.Text;
                        string skey = Session["skey"].ToString();
                        Response.Redirect("RegStep3.aspx?skey=" + skey);
                    }
                    catch (SqlException ex)
                    {
                        Label40.Text = ex.Message;
                    }
                }
            }
        }

    }

        
    }
    
