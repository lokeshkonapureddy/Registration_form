<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regstep3.aspx.cs" Inherits="project.Regstep3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>
        Registration Form 
    </title>
   
      <style type="text/css">
          * {
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}

/* Footer */
.footer1 {
    text-align: center;
    padding: 10px;
    height: 50px;
    color: black;
    background-color: rgb(44, 139, 198);
    margin-top: 20px;
}

/* Headers */
.header1 {
    text-align: center;
    padding: 3px;
    background-color: rgb(255, 255, 255);
    height: 75px;
}

.header2 {
    text-align: center;
    height: 90px;
    color: black;
    padding: 10px;
    margin-bottom: 30px;
    font-size: x-large;
    font-weight: 800;
    text-decoration: underline;
}

.header3 {
    text-align: right;
  
    padding: 3px;
    background-color: rgb(46, 138, 200);
    color: black;
    height: 10px;
}

/* Buttons */
.button {
    height: 50px;
    width: 150px;
    border: none;
    color: white;
    font-size: medium;
    cursor: pointer;
}

  .submitbutton{
           height:50px;
           width:150px;
           background-color:rgb(44, 139, 198);
       }

    .editbutton{
          height:50px;
           width:150px;
           background-color:red;
    }
    .confirmbutton{
        height:50px;
           width:150px;
           background-color:blue;
    }

.btnupload{
         height:50px;
           width:150px;
           background-color:rgb(46, 138, 200);
           padding:2px 2px 2px 2px;
    }

/* Input Boxes */
.uploadtxtbox {
    height: 40px;
    width: 90%;
    max-width: 450px;
}

/* Tables */
.table3 {
    box-shadow: 0 0 10px rgb(46, 138, 200);
    backdrop-filter: blur(10px);
    width: 90%;
    max-width: 1000px;
    margin: 20px auto;
    column-width: 200px;
}

/* Document Title */
.doc {
    text-align: center;
    padding: 3px;
    color: blue;
    font-size: xx-large;
    
}

/* Logo */
.logo {
    height: 105px;
    width: auto;
    max-width: 120px;
    margin-left: 30px;
    border: unset;
}

/* Header Section */
.headerss {
    background-color: rgb(46, 138, 200);
    text-align: center;
    height: 50px;
   
    color: black;
    font-size: x-large;
    font-weight: 800;
   text-align:center;   
     margin-top:10px;
    

}
.names {
            font-size:larger;
            font-weight: 400;
            margin-left:40px;
        }

/* Responsive Design */
@media screen and (max-width: 768px) {
    .header2 {
        font-size: large;
        height: 100px;
    }

    .table3 {
        width: 95%;
    }

    .uploadtxtbox {
        width: 95%;
    }

    .logo {
        height: 80px;
        max-width: 100px;
        margin-left: 10px;
    }

    .button {
        width: 100%;
        max-width: 150px;
    }
    .headerss{
        width:100%;
      
    }
    .doc{
        width:100%;
    }
}

      </style>
</head>
<body>
     <a class="links" align="left" style="color:red;text-decoration:underline;" href="homepage.aspx" > HOME</a>
     <header>
         <div class="header1"><img src="./Uploads/logo.png" alt="Company Logo" class="logo" align="left" /><h1>WELCOME TO MY COMPANY </h1></div>
        <div class="header3"></div>
        
    </header>
    <form id="form1" runat="server">
        <div>
    <div class="headerss" algin="center">
    <asp:Label ID="Label7" runat="server"  >APPLICATION NUMBER</asp:Label>  
     <asp:Label ID="Label1" runat="server"   ForeColor="Red"></asp:Label>
        </div>
        
        <table algin="center" class="table3" >
            <tr>
                <td colspan="4" align="center" style="margin-bottom:30px;"><asp:Label ID="Label16" runat="server" CssClass="doc" align="center" ForeColor="Blue">Documents Upload </asp:Label> </td>
                </tr>
            <tr>
                <td class="auto-style5">
        <asp:Label ID="Label8" runat="server" Text="photo " CssClass="names"></asp:Label>
        
                </td><td>
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="uploadtxtbox" />
                    </td><td>
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" CssClass="btnupload" />
                        </td><td>
        <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />
                        </td></tr>
            <tr>
                <td class="auto-style5">
         <asp:Label ID="Label2" runat="server" Text="Signature" CssClass="names"></asp:Label>
                </td><td>
        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="uploadtxtbox" />
                    </td><td>
        <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Upload1" CssClass="btnupload" />
                        </td><td>
        <asp:Label ID="Label3" ForeColor="Green" runat="server" />

                     </td></tr>
                     <tr>
                <td class="auto-style5">
         <asp:Label ID="Label4" runat="server" Text="Aadhar" CssClass="names"></asp:Label>
        </td><td>
        <asp:FileUpload ID="FileUpload3" runat="server" CssClass="uploadtxtbox" />
            </td><td>
        <asp:Button ID="Button2" runat="server" Text="Upload" OnClick="Upload2" CssClass="btnupload" />
                </td><td>
        <asp:Label ID="Label5" ForeColor="Green" runat="server" />
                         </td></tr>
                     <tr>
                <td class="auto-style5">
         <asp:Label ID="Label6" runat="server" Text="Class X" CssClass="names"></asp:Label>
        </td><td>
        <asp:FileUpload ID="FileUpload4" runat="server" CssClass="uploadtxtbox" />
            </td><td>
        <asp:Button ID="Button3" runat="server" Text="Upload" OnClick="Upload3" CssClass="btnupload" />
                </td><td>
        <asp:Label ID="Label9" ForeColor="Green" runat="server" />
                         </td></tr>
                     <tr>
                <td class="auto-style5">
         <asp:Label ID="Label10" runat="server" Text="Intermediate" CssClass="names"></asp:Label>
        </td><td>
        <asp:FileUpload ID="FileUpload5" runat="server" CssClass="uploadtxtbox" />
            </td><td>
        <asp:Button ID="Button4" runat="server" Text="Upload" OnClick="Upload4" CssClass="btnupload" />
                </td><td>
        <asp:Label ID="Label11" ForeColor="Green" runat="server" />
                  </td></tr>   <tr>
                <td class="auto-style5">
        <asp:Label ID="Label12" runat="server" Text="Degree" CssClass="names"></asp:Label>
        </td><td>
        <asp:FileUpload ID="FileUpload6" runat="server" CssClass="uploadtxtbox" />
            </td><td>
        <asp:Button ID="Button5" runat="server" Text="Upload" OnClick="Upload5" CssClass="btnupload" />
                </td><td>
        <asp:Label ID="Label13" ForeColor="Green" runat="server" />
                </td></tr>
                     <tr>
                <td class="auto-style5">
        <asp:Label ID="Label14" runat="server" Text="Post Graduation" CssClass="names"></asp:Label>
        </td><td>
        <asp:FileUpload ID="FileUpload7" runat="server" CssClass="uploadtxtbox" />
            </td><td>
        <asp:Button ID="Button6" runat="server" Text="Upload" OnClick="Upload6" CssClass="btnupload" />
                </td><td>
        <asp:Label ID="Label15" ForeColor="Green" runat="server" />

                         </td></tr>
             <tr>
                <td class="auto-style5" align="center"colspan="4">
        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Button" CssClass="submitbutton" align="center" ValidationGroup="i1" />

                    <asp:Label ID="Label17" runat="server"></asp:Label>

                </td> </tr>

           
            </table>
    </div> 
         <div class="footer1">  <p> <asp:Label ID="footer1" runat="server" /> Registration Form All rights reserved.</p></div>
    </form>
    
</body>
</html>
