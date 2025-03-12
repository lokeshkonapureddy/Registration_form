<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="project.login" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title> login page </title>

    <style type="text/css">
        body{
            margin : 0;
            
            color: black;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            text-align:center;
           
           
        }
        #ads{
            text-align:center;
            margin:auto;
          
            width:600px;
            height:450px;
           
          margin-top:30px;
           
            box-shadow: 0 0 10px lightblue;
            backdrop-filter: blur(20px);
         
        }
        #abc{
            display : inline;

        }
        p{
            margin :0;
             display : inline;

        }
        h1 {
         
            margin-top: 40px;
            margin-bottom: 20px;
             margin-left:50px;
    font-size:xx-large;
        }

        .text1{
            width :300px;
            height:50px;
           
           border: 1px solid black;
            
            color:black;
            text-indent:10px;
            margin-bottom:20px;

        }
       
        .links{
            text-decoration:none;
            color:black;
            font-weight:900;
            text-decoration-line:underline;
        }
        .login{
            width:300px;
            height:35px;
            margin-top:20px;
            margin-bottom:5px;
            box-shadow: 0 0 10px lightblue;
            backdrop-filter: blur(20px);
            font-size:16px;
            color:black;
            font-weight:bold;
           
        }
        .names{
             font-size:larger;
            font-weight: 400;
            margin-left:40px;
        }
         .header1{
           text-align: center;
              padding: 3px;
             background-color:rgb(255, 255, 255);
             height:135px;
             
       }
      
       .header3{
         
          text-align: center;
              padding: 3px;
              background-color:rgb(46, 138, 200);
              color: black;
              text-align:right;
              height:10px;       
       }
       .logo{
       height: 220px;
    width: 220px;
    margin-left:30px;
    border:unset;
 
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
        <div id="ads">
      
            <table>
                <tr>
                    <td colspan="2" align="center" class="loginheader">
                         <h1>LOGIN</h1>
                        </td>
                    </tr>
                <tr>
                    <td>
            <asp:Label ID="label1" runat="server" Text="Application Number" CssClass="names" ></asp:Label></td>
                    <td><asp:TextBox ID="TextBox1" runat="server"  CssClass="text1"></asp:TextBox></td>
                    </tr><tr>
                    <td>
                    <asp:Label ID="label2" runat="server" Text="DATE OF BIRTH" CssClass="names"></asp:Label></td>
                    <td> <asp:TextBox ID="TextBox2" runat="server" CssClass="text1" TextMode="Date"></asp:TextBox></td></tr>
                <tr>
                    <td colspan="2" align="center">
                        <cap:CaptchaControl ID="captcha1" runat="server" CaptchaLength="5" CaptchaHeight="50" CaptchaWidth="200" CaptchaLineNoise="None" CaptchaMinTimeout="3" CaptchaMaxTimeout="240" ForeColor="blue" BackColor="white" CaptchaChars="ABCDEFGHIJKLMNOPQRSTUVWX123456789" Height="46px" Width="200px" />
                    </td>
                    </tr>
                <tr>
                   <td colspan="2" align="center" style="margin-top:20px;">    
                        <asp:TextBox ID="TextBox3" runat="server" Height="33px" Width="210px"></asp:TextBox>
                        
                        </td>
                    </tr></table>
   <div id="abc">
            <asp:Label ID="Label6" runat="server" value="none" ForeColor="Red"></asp:Label></br>
           
        <%--<a class="links" style="margin-left:60px" href="Register.aspx" > forgot password</a> </br>--%>
        <asp:Button ID="Button1" runat="server" Text="login "  CssClass="login" OnClick="Button1_Click" /></br>
        <%--<p>
            Don't have account
        </p>--%>
        <a class="links" style="margin-left:400px" href="homepage.aspx" > For Registration</a>
            </div>
        </div>
    </form>
</body>
</html>
