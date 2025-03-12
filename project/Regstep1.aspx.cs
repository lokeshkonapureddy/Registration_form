using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace project
{
    public partial class Regstep1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ValidationSettings: UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                LoadStates(DropDownList1);
                LoadStates(DropDownList3);
                btnEdit.Visible = false;
                btnConfirm.Visible = false;
                application_no();
                if (Request.QueryString["skey"] == null || Session["skey"] == null || Request.QueryString["skey"] != Session["skey"].ToString())
                {
                    Response.Redirect("homepage.aspx"); // Redirect to homepage if key is invalid

                }

            }

        }



        public void LoadStates(DropDownList dropdownlist)
        {
            SqlConnection con = new SqlConnection(@"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT stateId,stateName from states", con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            dropdownlist.DataSource = sdr;
            dropdownlist.DataTextField = "StateName";
            dropdownlist.DataValueField = "StateId";
            dropdownlist.DataBind();
            con.Close();
            dropdownlist.Items.Insert(0, new ListItem("--SELECT state", "0"));


        }

        public void LoadDistricts(int stateid)
        {
            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True");
                SqlCommand cmd = new SqlCommand("SELECT Did, Dname FROM districts WHERE StateID = @stateid", con);
                cmd.Parameters.AddWithValue("@StateID", stateid);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DropDownList2.DataSource = reader;
                DropDownList2.DataTextField = "Dname";
                DropDownList2.DataValueField = "Did";
                DropDownList2.DataBind();
                con.Close();
                DropDownList2.Items.Insert(0, new ListItem("--SELECT district", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        public void LoadDistricts1(int stateid)
        {
            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True");
                SqlCommand cmd = new SqlCommand("SELECT Did, Dname FROM districts WHERE StateID = @stateid", con);
                cmd.Parameters.AddWithValue("@StateID", stateid);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DropDownList4.DataSource = reader;
                DropDownList4.DataTextField = "Dname";
                DropDownList4.DataValueField = "Did";
                DropDownList4.DataBind();
                con.Close();
                DropDownList4.Items.Insert(0, new ListItem("--SELECT district", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int stateId = 0;
            if (int.TryParse(DropDownList1.SelectedValue, out stateId) && stateId > 0)
            {
                LoadDistricts(stateId); // Load districts for permanent address state
            }
            else
            {
                DropDownList2.Items.Clear(); // Ensure districts dropdown is cleared if no state is SELECTed
            }
        }



        protected void DropDownList3_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int stateid = int.Parse(DropDownList3.SelectedValue);
            if (stateid > 0)
            {
                LoadDistricts1(stateid);
            }
            else
            {
                DropDownList4.Items.Clear();
            }
        }


        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {

                TextBox10.Text = TextBox6.Text;
                TextBox11.Text = TextBox7.Text;
                DropDownList8.SelectedValue = DropDownList7.SelectedItem.Text;

                //if (DropDownList7.SelectedIndex != "0" && DropDownList8.Items.FindByValue(DropDownList7.SelectedValue) != null)
                //{
                //    DropDownList7.SelectedValue = DropDownList8.SelectedValue;
                //}
                if (DropDownList1 != null && DropDownList1.SelectedItem != null)
                {
                    DropDownList3.SelectedValue = DropDownList1.SelectedValue;
                    LoadDistricts1(Convert.ToInt32(DropDownList3.SelectedValue));
                }

                if (DropDownList2 != null && DropDownList2.SelectedItem != null)
                {
                    DropDownList4.SelectedValue = DropDownList2.SelectedValue;
                }

                TextBox10.Enabled = false;
                TextBox11.Enabled = false;
                DropDownList3.Enabled = false;
                DropDownList4.Enabled = false;
                DropDownList8.Enabled = false;


            }

            else
            {
                TextBox10.Enabled = true;
                TextBox11.Enabled = true;
                DropDownList3.Enabled = true;
                DropDownList4.Enabled = true;
                DropDownList8.Enabled = true;



                DropDownList8.SelectedIndex = 0;
                TextBox10.Text = "";
                TextBox11.Text = "";
                DropDownList3.SelectedIndex = 0;
                DropDownList4.SelectedIndex = 0;

            }
            if (CheckBox1.Checked == false)
            {
                DropDownList3.SelectedIndex = 0;
                DropDownList4.SelectedIndex = 0;
                //LoadStates(DropDownList3);
                //int stateid = int.Parse(DropDownList3.SelectedValue);
                //LoadDistricts1(stateid);
            }


        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            captcha1.ValidateCaptcha(TextBox12.Text.Trim());
            if (captcha1.UserValidated)
            {
                string errorMessage = "";

                // Validate inputs
                if (string.IsNullOrWhiteSpace(TextBox1.Text))
                    errorMessage += "Surname is required.<br/>";
                if (string.IsNullOrWhiteSpace(TextBox2.Text))
                    errorMessage += "Name is required.<br/>";
                if (string.IsNullOrWhiteSpace(TextBox3.Text))
                    errorMessage += "Father Name is required.<br/>";
                if (string.IsNullOrWhiteSpace(TextBox4.Text))
                    errorMessage += "Mother Name is required.<br/>";
                if (DropDownList5.SelectedValue == "0")
                    errorMessage += "Gender is required.<br/>";
                if (DropDownList6.SelectedValue == "0")
                    errorMessage += "Catagory is required.<br/>";
                if (string.IsNullOrWhiteSpace(TextBox5.Text))
                    errorMessage += "Date of Birth is required.<br/>";
                if (string.IsNullOrWhiteSpace(TextBox8.Text))
                    errorMessage += "Phone Number is required.<br/>";
                if (string.IsNullOrWhiteSpace(TextBox9.Text))
                    errorMessage += "Email ID is required.<br/>";
                if (string.IsNullOrWhiteSpace(TextBox6.Text))
                    errorMessage += "Address is required.<br/>";
                if (DropDownList7.SelectedValue == "0")
                    errorMessage += "Country is required.<br/>";
                if (DropDownList3.SelectedValue == "0")
                    errorMessage += "State is required.<br/>";
                if (DropDownList4.SelectedValue == "0")
                    errorMessage += "district is required.<br/>";
                if (string.IsNullOrWhiteSpace(TextBox7.Text))
                    errorMessage += "Pincode is required.<br/>";

                if (string.IsNullOrWhiteSpace(TextBox10.Text))
                    errorMessage += "permanent Address is required.<br/>";
                if (DropDownList8.SelectedValue == "0")
                    errorMessage += " Permanent Country is required.<br/>";
                if (DropDownList3.SelectedValue == "0")
                    errorMessage += " Permenent State is required.<br/>";
                if (DropDownList4.SelectedValue == "0")
                    errorMessage += "Permenent District is required.<br/>";
                if (string.IsNullOrWhiteSpace(TextBox11.Text))
                    errorMessage += " Permenent Pincode is required.<br/>";
                if (!chkDeclaration.Checked)
                    errorMessage = "Checkbox must be checked .<br/>";

                // Display errors or proceed
                if (!string.IsNullOrEmpty(errorMessage))
                {
                    Label20.Text = errorMessage;
                    Label20.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    Label20.Text = "";

                    // Disable fields
                    TextBox1.Enabled = false;
                    TextBox2.Enabled = false;
                    TextBox3.Enabled = false;
                    TextBox4.Enabled = false;
                    TextBox5.Enabled = false;
                    TextBox8.Enabled = false;
                    TextBox9.Enabled = false;
                    TextBox10.Enabled = false;
                    TextBox11.Enabled = false;
                    TextBox6.Enabled = false;
                    TextBox7.Enabled = false;
                    DropDownList3.Enabled = false;
                    DropDownList4.Enabled = false;
                    DropDownList1.Enabled = false;
                    DropDownList2.Enabled = false;
                    DropDownList6.Enabled = false;
                    DropDownList7.Enabled = false;
                    DropDownList8.Enabled = false;
                    DropDownList5.Enabled = false;
                    TextBox12.Enabled = false;


                    // Hide submit button and show edit button
                    Button1.Visible = false;
                    btnEdit.Visible = true;
                    btnConfirm.Visible = true;
                }
            }
            else
            {
                Label20.Text = "Enter the correct captcha";
            }
        }


        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Enable fields
            TextBox1.Enabled = true;
            TextBox2.Enabled = true;
            TextBox3.Enabled = true;
            TextBox4.Enabled = true;
            TextBox5.Enabled = true;
            TextBox8.Enabled = true;
            TextBox9.Enabled = true;
            TextBox10.Enabled = true;
            TextBox11.Enabled = true;
            TextBox6.Enabled = true;
            TextBox7.Enabled = true;
            DropDownList3.Enabled = true;
            DropDownList4.Enabled = true;
            DropDownList1.Enabled = true;
            DropDownList2.Enabled = true;
            DropDownList6.Enabled = true;
            DropDownList7.Enabled = true;
            DropDownList8.Enabled = true;
            DropDownList5.Enabled = true;
            TextBox12.Enabled = true;

            // Hide edit button and show confirm button
            btnEdit.Visible = false;
            btnConfirm.Visible = false;
            Button1.Visible = true;
        }
        public void application_no()
        {
            string connectionString = @"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True";
            string query1 = "SELECT MAX(applicationno) AS MaxApplicationNo FROM [dbo].[Registration]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query1, connection))
                {
                    try
                    {
                        connection.Open();
                        object result = command.ExecuteScalar(); // ExecuteScalar returns a single value

                        if (result != DBNull.Value && result != null)
                        {
                            int applicationNumber = Convert.ToInt32(result); // Convert object to integer
                            applicationNumber++; // Increment the number

                            Label22.Text = applicationNumber.ToString();
                            Session["application_no"] = Label22.Text;
                        }
                        else
                        {
                            Label22.Text = "No records found.";
                        }
                        connection.Close(); // Always close the connection after use
                    }
                    catch (Exception ex)
                    {
                        Label20.Text = "An error occurred: " + ex.Message;
                        Label20.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }

        }
        protected void btnConfirm_Click(object sender, EventArgs e)
        {

            string connectionString = @"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True";



            string query = @"
      INSERT INTO [dbo].[Registration]
           ([surname]
           ,[Name]
           ,[father_Name]
           ,[mother_name]
           ,[gender]
           ,[category]
           ,[date_of_birth]
           ,[phone_number]
           ,[email_id]
           ,[address]
           ,[country]
           ,[state]
           ,[district]
           ,[pincode]
           ,[permanent_address]
           ,[permanent_country]
           ,[permanent_state]
           ,[permanent_district]
           ,[permanent_pincode],
[regstep1])
        VALUES (@surname, @Name, @father_Name, @mother_name,@gender, @category, @date_of_birth, @phone_number, @email_id, 
        @address, @country, @state, @district, @pincode, @permanent_address, @permanent_country, @permanent_state,@permanent_district,@permanent_pincode,@regstep1)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@surname", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@father_Name", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@mother_name", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@gender", DropDownList5.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@category", DropDownList6.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@date_of_birth", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@phone_number", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@email_id", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@country", DropDownList7.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@district", DropDownList2.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@pincode", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@permanent_address", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@permanent_country", DropDownList8.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@permanent_state", DropDownList3.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@permanent_district", DropDownList4.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@permanent_pincode", TextBox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@regstep1", "1");

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Session["Surname"] = TextBox1.Text;
                        Session["name"] = TextBox2.Text;
                        Session["category"] = DropDownList6.SelectedItem.Text;
                        Session["DateOfBirth"] = TextBox5.Text;
                        Session["phonenumber"] = TextBox8.Text;
                        string skey = Session["skey"].ToString();
                        Response.Redirect("RegStep2.aspx?skey=" + skey);
                        Session["application_no"] = Label22.Text;

                       

                    }
                    catch (SqlException ex)
                    {
                        Label20.Text = ex.Message;

                    }
                }

            }
           
        }
    }
}

    












