<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="project.homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title> HOME PAGE </title>
    <style type="text/css">

       /* General Styles */
body {
    margin: 0;
    color: black;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    text-align: center;
    background-position: center;
    background-size: cover;
}
 .header3{
         
          text-align: center;
              padding: 3px;
              background-color:rgb(46, 138, 200);
              color: black;
              text-align:right;
              height:10px; 
              margin-top:15px;      
       }

/* Ads Section */
.ads {
    text-align: center;
    margin: 30px auto 10px;
    width: 80%;
    max-width: 800px;
    height: 400px;
    box-shadow: 0 0 10px lightblue;
    backdrop-filter: blur(10px);
}

/* Header */
.header1 {
    text-align: center;
    padding: 10px;
    background-color: white;
    height: 85px;
}

/* Footer */
.footer1 {
    text-align: center;
    padding: 10px;
    background-color: rgb(44, 139, 198);
    color: black;
    margin-top: 20px;
}

/* Logo */
.logo {
    height: 145px;
    width: auto;
    margin-left: 30px;
}

/* Buttons */
.div_button {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 20px;
}

#Button1, #Button2 {
    width: 150px;
    height: 50px;
    border: 2px solid black;
    font-size: 16px;
    cursor: pointer;
}

#Button1 {
    background-color: lightcoral;
}

#Button2 {
    background-color: forestgreen;
}

/* Text Section */
.div_text {
    margin: 30px auto;
    width: 80%;
    max-width: 800px;
    height: 180px;
    font-size: large;
    font-weight: 500;
    padding-top: 50px;
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    .ads, .div_text {
        width: 95%;
        height: auto;
    }

    #Button1, #Button2 {
        width: 120px;
    }
}

@media screen and (max-width: 480px) {
    .ads {
        height: 300px;
    }

    .div_button {
        flex-direction: column;
        gap: 10px;
    }

    #Button1, #Button2 {
        width: 100%;
    }
}
            }
             

    </style>
</head>
<body>
    <form id="form1" runat="server"  class="column1">
       <header>
        
        <div class="header1"><img src="./Uploads/logo.png" alt="Company Logo" class="logo" align="left" /><h1>WELCOME TO MY COMPANY </h1></div>
        <div class="header3"> 
             </div>
    </header>
        <div class="ads">
            <h1>HOME PAGE 
            </h1>
            <div class="div_text">
                <p> For Registration click on Registration button </p>
                <p> For Login click on Login button </p>
                </div>
            <div class="div_button">
                <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" align="left" BackColor="Red"  />
                <asp:Button ID="Button2" runat="server" Text="Registration" OnClick="Button2_Click" align="right" />
     </div>
            </div>
            <footer>
       <div class="footer1">  <p> Registration Form All rights reserved.</p></div>
        </footer>
    </form>
     
</body>
    
</html>
