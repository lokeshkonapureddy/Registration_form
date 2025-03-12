using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace project
{
    public partial class Regstep3 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings: UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Request.QueryString["skey"] == null || Session["skey"] == null || Request.QueryString["skey"] != Session["skey"].ToString())
            {
                Response.Redirect("homepage.aspx"); // Redirect to homepage if key is invalid
            }
            Label1.Text = Session["application_no"]?.ToString() ?? "";
            //Label1.Text = "1009";
            string applicationno = Label1.Text;
            postgarduation(applicationno);

        }
        private void postgarduation(string applicationno)
        {
            string connectionString = @"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True";
            string query = @"SELECT postdegree_coursename, postdegree_collegename, postdegree_universityname,postdegree_endingdate,postdegree_board,postdegree_percentage FROM [dbo].[Registration] WHERE applicationno = @applicationno";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@applicationno", Label1.Text);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())  // If the record exists
                        {
                            object postdegree_coursename = reader["postdegree_coursename"];
                            object postdegree_collegename = reader["postdegree_collegename"];
                            object postdegree_universityname = reader["postdegree_universityname"];
                            object postdegree_board = reader["postdegree_board"];
                            object postdegree_percentage = reader["postdegree_percentage"];
                            object postdegree_endingdate = reader["postdegree_endingdate"];

                            // Generate a unique skey


                            if (postdegree_coursename ==DBNull.Value|| postdegree_collegename== DBNull.Value || postdegree_universityname== DBNull.Value || postdegree_board==DBNull.Value || postdegree_endingdate==DBNull.Value || postdegree_percentage ==DBNull.Value)
                            {
                                Label14.Enabled = false;
                                Label14.Visible = false;
                                FileUpload7.Enabled = false;
                                FileUpload7.Visible = false;
                                Button6.Enabled = false;
                                Button6.Visible = false;
                                Label15.Enabled = false;
                                Label15.Visible = false;

                            }
                           
                        }
                        else
                        {
                            Label14.Enabled = true;
                            Label14.Visible = true;
                            FileUpload7.Enabled = true;
                            FileUpload7.Visible = true;
                            Button6.Enabled = true;
                            Button6.Visible = true;
                            Label15.Enabled = true;
                            Label15.Visible = true;
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
        // PHOTO UPLOAD
        protected void Upload(object sender, EventArgs e)
        {
            try
            {
                if (!FileUpload1.HasFile)
                {
                    lblMessage.Text = "Please SELECT a photo to upload.";
                    return;
                }

                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string extension = Path.GetExtension(filename).ToLower();
                string contentType = FileUpload1.PostedFile.ContentType;
                int maxFileSize = 2 * 1024 * 1024; // 2MB limit

                // Validate file type and size
                if (extension != ".jpg" || contentType != "image/jpeg")
                {
                    lblMessage.Text = "Only JPG files are allowed.";
                    return;
                }

                if (FileUpload1.PostedFile.ContentLength > maxFileSize)
                {
                    lblMessage.Text = "File size must be less than 2MB.";
                    return;
                }

                // Define the folder path to store images
                string folderPath = Server.MapPath("~/image/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                // Generate a unique filename to avoid overwriting existing files
                string uniqueFileName = Guid.NewGuid().ToString() + extension;
                string filePath = Path.Combine(folderPath, uniqueFileName);
                string relativePath = "./image/" + uniqueFileName; // Store relative path in the database

                // Save file to the folder
                FileUpload1.SaveAs(filePath);

                // Convert file to byte array for database storage
                byte[] fileBytes;
                using (Stream fs = FileUpload1.PostedFile.InputStream)
                using (BinaryReader br = new BinaryReader(fs))
                {
                    fileBytes = br.ReadBytes((int)fs.Length);
                }

                // Save both the file path and binary data in the database
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = @"
            UPDATE [dbo].[Registration]
            SET  
                [photo_filename] = @FilePath,
                [photo_data] = @Data
            WHERE applicationno = @applicationid;";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@FilePath", relativePath); // Store file path
                        cmd.Parameters.AddWithValue("@Data", fileBytes); // Store binary image data
                        cmd.Parameters.AddWithValue("@applicationid", Label1.Text.Trim()); // Application ID

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();

                        lblMessage.Text = rowsAffected > 0 ? "Photo uploaded successfully." : "No record updated. Check the Application No.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }



        protected void Upload1(object sender, EventArgs e)
        {
            try
            {
                if (!FileUpload2.HasFile)
                {
                    Label3.Text = "Please SELECT a signature to upload.";
                    return;
                }

                string filename = Path.GetFileName(FileUpload2.PostedFile.FileName);
                string extension = Path.GetExtension(filename).ToLower();
                string contentType = FileUpload2.PostedFile.ContentType;
                int maxFileSize = 2 * 1024 * 1024; // 2MB limit

                // Validate that only JPG is allowed
                if (extension != ".jpg" || contentType != "image/jpeg")
                {
                    Label3.Text = "Only JPG files are allowed.";
                    return;
                }

                if (FileUpload2.PostedFile.ContentLength > maxFileSize)
                {
                    Label3.Text = "File size must be less than 2MB.";
                    return;
                }

                // Define the folder path to store images
                string folderPath = Server.MapPath("~/image/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                // Generate a unique filename to avoid overwriting existing files
                string uniqueFileName = Guid.NewGuid().ToString() + extension;
                string filePath = Path.Combine(folderPath, uniqueFileName);
                string relativePath = "./image/" + uniqueFileName; // Store relative path in the database

                // Save file to the folder
                FileUpload2.SaveAs(filePath);

                // Convert file to byte array for database storage
                byte[] fileBytes;
                using (Stream fs = FileUpload2.PostedFile.InputStream)
                using (BinaryReader br = new BinaryReader(fs))
                {
                    fileBytes = br.ReadBytes((int)fs.Length);
                }

                // Ensure application ID is available
                if (string.IsNullOrWhiteSpace(Label1.Text))
                {
                    Label3.Text = "Application No. is missing. Please check.";
                    return;
                }

                // Save both the file path and binary data in the database
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = @"
            UPDATE [dbo].[Registration]
            SET  
                [sign_filename] = @FilePath,
                [sign_data] = @Data
            WHERE applicationno = @applicationid;";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@FilePath", relativePath); // Store file path
                        cmd.Parameters.AddWithValue("@Data", fileBytes); // Store binary image data
                        cmd.Parameters.AddWithValue("@applicationid", Label1.Text.Trim()); // Application ID

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();

                        Label3.Text = rowsAffected > 0 ? "Signature uploaded successfully." : "No record updated. Check the Application No.";
                    }
                }
            }
            catch (Exception ex)
            {
                Label3.Text = "Error: " + ex.Message;
            }
        }


        protected void Upload2(object sender, EventArgs e)
        {
            UploadFile(FileUpload3, Label5, "aadhar_filename", "aadhar_data");
        }

        protected void Upload3(object sender, EventArgs e)
        {
            UploadFile(FileUpload4, Label9, "x_filename", "x_data");
        }

        protected void Upload4(object sender, EventArgs e)
        {
            UploadFile(FileUpload5, Label11, "xi_filename", "xi_data");
        }

        protected void Upload5(object sender, EventArgs e)
        {
            UploadFile(FileUpload6, Label13, "degree_filename", "degree_data");
        }

        protected void Upload6(object sender, EventArgs e)
        {
            UploadFile(FileUpload7, Label15, "postdegree_filename", "postdegree_data");
        }

        // Common Function for File Upload
        private void UploadFile(FileUpload fileUpload, Label statusLabel, string fileColumn, string dataColumn)
        {
            try
            {
                if (!fileUpload.HasFile)
                {
                    statusLabel.Text = "Please SELECT a file to upload.";
                    return;
                }

                string uploadFolder = Server.MapPath("~/image/"); // Save in 'image' folder
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }

                string filename = Path.GetFileName(fileUpload.PostedFile.FileName);
                string fileExt = Path.GetExtension(filename).ToLower();

                // Allow only specific file types
                if (fileExt != ".jpg" && fileExt != ".jpeg" && fileExt != ".png" && fileExt != ".pdf")
                {
                    statusLabel.Text = "Only JPG, JPEG, PNG, or PDF files are allowed.";
                    return;
                }

                // Save file to folder
                string filePath = Path.Combine(uploadFolder, filename);
                fileUpload.SaveAs(filePath);

                // Convert file to bytes for database storage
                byte[] fileBytes;
                using (Stream fs = fileUpload.PostedFile.InputStream)
                using (BinaryReader br = new BinaryReader(fs))
                {
                    fileBytes = br.ReadBytes((int)fs.Length);
                }

                // Save file path & data to the database
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = $@"
            UPDATE [dbo].[Registration]
            SET  
                {fileColumn} = @FilePath,  
                {dataColumn} = @FileData  
            WHERE applicationno = @applicationid;";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@FilePath", "~/image/" + filename);
                        cmd.Parameters.AddWithValue("@FileData", fileBytes);
                        cmd.Parameters.AddWithValue("@applicationid", Label1.Text);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();

                        statusLabel.Text = rowsAffected > 0 ? "File uploaded successfully." : "Upload failed. Check Application No.";
                    }
                }
            }
            catch (Exception ex)
            {
                statusLabel.Text = "Error: " + ex.Message;
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            if (lblMessage.Text == "Photo uploaded successfully.")
            {
                if (Label3.Text == "Signature uploaded successfully.")
                {
                    if (Label9.Text == "File uploaded successfully.")
                    {
                        if (Label11.Text == "File uploaded successfully.")
                        {
                            if (Label13.Text == "File uploaded successfully.")
                            {
                                
                                if (Label15.Text == "File uploaded successfully." || Label15.Enabled==false )
                                {
                                    string connectionString = @"Data Source=LOKESH;Initial Catalog=projectdb;Integrated Security=True";



                                    string query = @"
      UPDATE [dbo].[Registration]
    SET  
            [regstep3]=@regstep3 
    WHERE applicationno = @applicationid;";
                                    using (SqlConnection con = new SqlConnection(connectionString))
                                    {
                                        using (SqlCommand cmd = new SqlCommand(query, con))
                                        {
                                            cmd.Parameters.AddWithValue("@regstep3", "1");
                                            cmd.Parameters.AddWithValue("@applicationid", Label1.Text);
                                            try
                                            {
                                                con.Open();
                                                cmd.ExecuteNonQuery();
                                                Session["application_no"] = Label1.Text;
                                                string skey = Session["skey"].ToString();
                                                Response.Redirect("Print.aspx?skey=" + skey);
                                            }
                                            catch (SqlException ex)
                                            {
                                                Label17.Text = ex.Message;

                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    Label15.Text = "Post Graduation Not uploaded ";
                                    Label15.ForeColor = System.Drawing.Color.Red;

                                    
                                }
                            }
                            else
                            {
                                Label13.Text = "Degree  Not uploaded ";
                                Label13.ForeColor = System.Drawing.Color.Red;

                             
                            }
                        }
                        else
                        {
                            Label11.Text = "Intermediate Not uploaded ";
                            Label11.ForeColor = System.Drawing.Color.Red;

                           
                        }
                    }
                    else
                    {
                        Label9.Text = "Class X Not uploaded .";
                        Label9.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    Label3.Text = "Signature  Not uploaded";
                    Label3.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblMessage.Text = "photo Not uploaded";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}