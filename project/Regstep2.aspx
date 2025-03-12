<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regstep2.aspx.cs" Inherits="project.Regstep2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>
        Registration Form 
    </title>
   
    
      <script type="text/javascript">
    function validatePassedOutYear() {
        var dob = document.getElementById("TextBox4").value.trim();
        var passedOutYear = document.getElementById("DropDownList5").value;
        var errorLabel = document.getElementById("lblResult");

        var dobYear = parseInt(dob);
        var passYear = parseInt(passedOutYear);

        if (passYear - dobYear >= 11) {
            errorLabel.innerHTML = " Valid Passed Out Year!";
            errorLabel.style.color = "green";
            return true;
        } else {
            errorLabel.innerHTML = " Invalid! Passed out.";
            errorLabel.style.color = "red";
            return false;
        }
    }

    function validatePassedOutYear0() {
        var dob = document.getElementById("DropDownList5").value.trim();
        var passedOutYear = document.getElementById("DropDownList6").value;
        var errorLabel = document.getElementById("lblResult0");

        var dobYear = parseInt(dob);
        var passYear = parseInt(passedOutYear);

        if (!dobYear) {
            errorLabel.innerHTML = " Select the passed out year in class X";
            errorLabel.style.color = "red";
            return false;
        }
        if (passYear - dobYear >= 2) {
            errorLabel.innerHTML = " Valid Passed Out Year!";
            errorLabel.style.color = "green";
            return true;
        } else {
            errorLabel.innerHTML = " Invalid! Passed out.";
            errorLabel.style.color = "red";
            return false;
        }
    }

    function validatePassedOutYear1() {
        var dob = document.getElementById("DropDownList6").value.trim();
        var passedOutYear = document.getElementById("DropDownList7").value;
        var errorLabel = document.getElementById("lblResult1");

        var dobYear = parseInt(dob);
        var passYear = parseInt(passedOutYear);

        if (!dobYear) {
            errorLabel.innerHTML = " Select the passed out year in intermediate";
            errorLabel.style.color = "red";
            return false;
        }
        if (passYear - dobYear >= 3) {
            errorLabel.innerHTML = " Valid Passed Out Year!";
            errorLabel.style.color = "green";
            return true;
        } else {
            errorLabel.innerHTML = " Invalid! Passed out.";
            errorLabel.style.color = "red";
            return false;
        }
    }

    function validatePassedOutYear2() {
        var dob = document.getElementById("DropDownList7").value.trim();
        var passedOutYear = document.getElementById("DropDownList8").value;
        var errorLabel = document.getElementById("lblResult2");

        var dobYear = parseInt(dob);
        var passYear = parseInt(passedOutYear);

        if (!dobYear) {
            errorLabel.innerHTML = " Select the passed out year in graduation";
            errorLabel.style.color = "red";
            return false;
        }
        if (passYear - dobYear >= 2) {
            errorLabel.innerHTML = " Valid Passed Out Year!";
            errorLabel.style.color = "green";
            return true;
        } else {
            errorLabel.innerHTML = " Invalid! Passed out.";
            errorLabel.style.color = "red";
            return false;
        }
    }

    function validateForm() {
        var valid1 = validatePassedOutYear();
        var valid2 = validatePassedOutYear0();
        var valid3 = validatePassedOutYear1();
       

        if (valid1 && valid2 && valid3) {
            return true;
        } else {
            return false;
        }
    }

    
  
    function AllowOnlyNumbers(event) {
        var charCode = event.which || event.keyCode;
        // Allow only numbers (0-9)
        if (charCode >= 48 && charCode <= 57) {
            return true;
        }
        return false;
    }

    function RemoveInvalidCharacters(input) {
        input.value = input.value.replace(/[^0-9]/g, '');
    }
</script>

    <style type="text/css">
* {
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}

/* Main Container */
.reg2body {
    width: 100%;
    max-width: 1250px;
    margin: 0 auto;
}

/* Header Sections */
.header5 {
    text-align: center;
    width: 100%;
    max-width: 1200px;
    color: blue;
    margin: 0 auto;
}

.headerss {
    background-color: rgb(46, 138, 200);
    text-align: center;
    height: 30px;
    width: 100%;
    max-width: 800px;
    color: black;
    font-size: x-large;
    font-weight: 800;
    margin: 0 auto;
}

.header1 {
    text-align: center;
    padding: 3px;
    background-color: rgb(255, 255, 255);
    height: 75px;
    width:100%;
}

.header3 {
    text-align: center;
    padding: 3px;
    background-color: rgb(46, 138, 200);
    color: black;
    text-align: right;
    height: 10px;
    max-width:2000px;
}

/* Logo */
.logo {
    height: 105px;
    width: auto;
    max-width: 120px;
    margin-left: 30px;
    border: unset;
}

/* Tables */
.mintable {
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    backdrop-filter: blur(10px);
    width: 90%;
    max-width: 800px;
    height: 300px;
    margin: 0 auto;
}
        .footer1 {
            text-align: center;
            padding: 1px;
            height: 50px;
            color: black;
            background-color: rgb(44, 139, 198);
            margin-top: 20px;
        }

.table2 {
    box-shadow: 0 0 5px rgb(46, 138, 200);
    backdrop-filter: blur(10px);
    width: 90%;
    max-width: 1000px;
    height: auto;
    text-align: center;
    margin: 50px auto;
}

/* Input Fields */
.minitextbox {
    height: 40px;
    width: 100%;
    max-width: 200px;
    text-align: center;
    font-size: large;
    font-weight: 100;
}

.txtbox {
    height: 30px;
    width: 100%;
    max-width: 500px;
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
/* Responsive Design */
@media screen and (max-width: 768px) {
    .headerss {
        font-size: large;
        height: 40px;
    }
     .submitbutton, .editbutton, .confirmbutton, .btnupload {
        width: 100%;
    }

    .mintable,
    .table2 {
        width: 95%;
    }

    .minitextbox,
    .txtbox {
        width: 95%;
    }

    .logo {
        height: 80px;
        max-width: 100px;
        margin-left: 10px;
    }
}
 </style>

</head>
<body class="reg2body">
     <a class="links" align="left" style="color:red;text-decoration:underline;" href="homepage.aspx" > HOME</a>
     <header>
        <div class="header1"><img src="./Uploads/logo.png" alt="Company Logo" class="logo" align="left" /><h1>WELCOME TO MY COMPANY </h1></div>
        <div class="header3"></div>
        
    </header>
    <form id="form1" runat="server">
        
    <div>
    <div >
                   
                   
                    
        </div>
             <table algin="center" class="table2">
                 <tr>
                     <td class="headerss" colspan="4"> <asp:Label ID="Label41" runat="server">APPLICATION NUMBER</asp:Label></td>
                     </tr>
                 <tr>
                     <td class="headerss" colspan="4">  <asp:Label ID="Label6" runat="server" ForeColor="Red"></asp:Label></td>
                     </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Surame" CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7" colspan="3">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="txtbox" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" >
                    <asp:Label ID="Label2" runat="server" Text="Name" CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7" colspan="3">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txtbox" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label3" runat="server" Text="Category" CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7" colspan="3">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="txtbox" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label4" runat="server" Text="Date of birth" CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7" colspan="3">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="txtbox" TextMode="Date" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label5" runat="server" Text="phone number" CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7" colspan="3">
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="txtbox" Enabled="False"></asp:TextBox>
                </td>
            </tr>
               <tr>
               <td class="headerss" colspan="4" algin="center">
                    <asp:Label ID="Label8" runat="server" Text="Qualification" ></asp:Label>
                   
                          </tr>
            <!-- class X -->
        
                     <tr>
                         <td class="headerss"  colspan="4" algin="center">
                    <asp:Label ID="Label9" runat="server" Text="Class X" ></asp:Label>
                         <td class="auto-style14"></td>
                </tr>
        
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label10" runat="server" Text="Course Name " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="minitextbox" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator><br/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox6" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                </td>
                 <td class="auto-style1">
                    <asp:Label ID="Label12" runat="server" Text="School Name" CssClass="names"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="minitextbox" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox8" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox8" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
           
            <tr>
                <td class="auto-style11" >
                    <asp:Label ID="Label14" runat="server" Text="Passed out Year " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style6" >
                    <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="True" CssClass="minitextbox" DataSourceID="SqlDataSource2" DataTextField="year" DataValueField="year" onchange="validatePassedOutYear();">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                    </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList5" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator><br />

                      <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:boardConnectionString2 %>" SelectCommand="SELECT * FROM [year_passed]"></asp:SqlDataSource>
                </td>

            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label15" runat="server" Text="board " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="minitextbox" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="BoardName" DataValueField="BoardID">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:boardConnectionString %>" SelectCommand="SELECT * FROM [Board]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
                  <td class="auto-style11">
                    <asp:Label ID="Label16" runat="server" Text="Percentage " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox11" runat="server" CssClass="minitextbox" MaxLength="3" onkeypress="return AllowOnlyNumbers(event)" oninput="RemoveInvalidCharacters(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox11" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="TextBox11" ErrorMessage="please enter vaild percentage " ForeColor="Red" ValidationExpression="^(100|[4-9][5-9]|[5-9][0-9])(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                </td>

            </tr>
       
        
        <!--Intermediate -->
         <tr>
                    <td class="headerss" colspan="4" algin="center">
                    <asp:Label ID="Label17" runat="server" Text="Intermediate" ></asp:Label>
                    <td class="auto-style14"></td> 
                </tr>
       
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label18" runat="server" Text="Course Name " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox12" runat="server" CssClass="minitextbox" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox12" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator><br/>
                
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox12" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                
                </td>
                 <td class="auto-style11">
                    <asp:Label ID="Label19" runat="server" Text="College Name" CssClass="names"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox13" runat="server" CssClass="minitextbox" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox13" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox13" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
            
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label20" runat="server" Text="University Name " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox14" runat="server" CssClass="minitextbox" MaxLength="30"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox14" ErrorMessage="Required" ForeColor="Red" CssClass="vaild" ValidationGroup="i1"></asp:RequiredFieldValidator>

                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label22" runat="server" Text="Passed out Year " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="DropDownList6" runat="server" AppendDataBoundItems="True" CssClass="minitextbox" DataSourceID="SqlDataSource2" DataTextField="year" DataValueField="year" onchange="validatePassedOutYear0();">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                    </asp:DropDownList>
                      <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DropDownList6" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
                    <br />
                      <asp:Label ID="lblResult0" runat="server" ForeColor="Red"></asp:Label>

                </td>

            </tr>
            <tr>
                <td class="auto-style8" >
                    <asp:Label ID="Label23" runat="server" Text="board " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="minitextbox" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="BoardName" DataValueField="BoardID">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
                  <td class="auto-style11">
                    <asp:Label ID="Label24" runat="server" Text="Percentage " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox17" runat="server" CssClass="minitextbox" MaxLength="3" onkeypress="return AllowOnlyNumbers(event)" oninput="RemoveInvalidCharacters(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox17" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="TextBox17" ErrorMessage="please enter vaild percentage " ForeColor="Red" ValidationExpression="^(100|[4-9][5-9]|[5-9][0-9])(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                </td>

            </tr>
       
         
        <tr>
                  <td class="headerss" colspan="4" algin="center">
                    <asp:Label ID="Label25" runat="server" Text="Graduation" ></asp:Label>
                  <td class="auto-style14"></td>   
             
                </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label26" runat="server" Text="Course Name " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox18" runat="server" CssClass="minitextbox" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox18" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator><br />
                
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox18" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                
                </td>
                 <td class="auto-style11">
                    <asp:Label ID="Label27" runat="server" Text="College Name" CssClass="names"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox19" runat="server" CssClass="minitextbox" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBox19" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox19" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
           
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label28" runat="server" Text="University Name" CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox20" runat="server" CssClass="minitextbox" MaxLength="30"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBox20" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator>

                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label30" runat="server" Text="Passed out Year " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="DropDownList7" runat="server" AppendDataBoundItems="True" CssClass="minitextbox" DataSourceID="SqlDataSource2" DataTextField="year" DataValueField="year" onchange="validatePassedOutYear1();">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                    </asp:DropDownList>
                      <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="DropDownList7" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
                    <br />
                      <asp:Label ID="lblResult1" runat="server" ForeColor="Red"></asp:Label>

                </td>

            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label31" runat="server" Text="board " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="minitextbox" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="BoardName" DataValueField="BoardID">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
                  <td class="auto-style11">
                    <asp:Label ID="Label32" runat="server" Text="Percentage " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox23" runat="server" CssClass="minitextbox" MaxLength="3" onkeypress="return AllowOnlyNumbers(event)" oninput="RemoveInvalidCharacters(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="TextBox23" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="TextBox23" ErrorMessage="please enter vaild percentage " ForeColor="Red" ValidationExpression="^(100|[4-9][5-9]|[5-9][0-9])(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                </td>

            </tr>
        
         <!--Post grduation -->
        
                  <tr>
                 <td class="headerss" colspan="4" algin="center">  <asp:Label ID="Label11" runat="server" Text="Post Graduation"></asp:Label>
                      <td class="auto-style14">
               </td> 
        </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label33" runat="server" Text="Course Name " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="minitextbox" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBox7" ErrorMessage="Required" ForeColor="Red" CssClass="vaild" Enabled="False"></asp:RequiredFieldValidator><br />
                
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                
                </td>
                 <td class="auto-style11">
                    <asp:Label ID="Label34" runat="server" Text="College Name" CssClass="names"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox24" runat="server" CssClass="minitextbox" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="TextBox24" ErrorMessage="Required" ForeColor="Red" CssClass="vaild" Enabled="False"></asp:RequiredFieldValidator><br />
                
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox24" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
          
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label35" runat="server" Text="University Name " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox25" runat="server" CssClass="minitextbox" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="TextBox25" ErrorMessage="Required" ForeColor="Red" CssClass="vaild" Enabled="False"></asp:RequiredFieldValidator>
                
                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label37" runat="server" Text="Passed out Year " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="DropDownList8" runat="server" AppendDataBoundItems="True" CssClass="minitextbox" DataSourceID="SqlDataSource2" DataTextField="year" DataValueField="year" onchange="validatePassedOutYear2();">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                    </asp:DropDownList>
                      <asp:Label ID="lblResult2" runat="server" ForeColor="Red"></asp:Label><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="DropDownList8" ErrorMessage="Required" ForeColor="Red" CssClass="vaild" InitialValue="0" Enabled="False"></asp:RequiredFieldValidator>
                
                </td>

            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label38" runat="server" Text="board " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="minitextbox" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="BoardName" DataValueField="BoardID">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="DropDownList4" ErrorMessage="Required" ForeColor="Red" CssClass="vaild" InitialValue="0" Enabled="False"></asp:RequiredFieldValidator>
                
                </td>
                  <td class="auto-style11">
                    <asp:Label ID="Label39" runat="server" Text="Percentage " CssClass="names"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox28" runat="server" CssClass="minitextbox" MaxLength="3" onkeypress="return AllowOnlyNumbers(event)" oninput="RemoveInvalidCharacters(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="TextBox28" ErrorMessage="Required" ForeColor="Red" CssClass="vaild" Enabled="False"></asp:RequiredFieldValidator>
                <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="TextBox28" ErrorMessage="please enter vaild percentage " ForeColor="Red" ValidationExpression="^(100|[4-9][5-9]|[5-9][0-9])(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                
                </td>

            </tr>
            <tr>
                <tb colspan="4">

                </tb>
                </tr>
        <tr>
            <td colspan="4" align="center">
       
            
            <asp:Label ID="Label40" runat="server" ForeColor="Red"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Button" CssClass="submitbutton" ValidationGroup="i1"
    OnClientClick="validateForm();" OnClick="Button1_Click"  align="center" CausesValidation="true"/>
        <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" Visible="false"  align="left" CssClass="editbutton"/>
        <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" Visible="false"  align="right" CssClass="confirmbutton"/>
            </td ></tr>
                 </table>
    </div>
       
             <div class="footer1">  <p> <asp:Label ID="footer1" runat="server" /> Registration Form All rights reserved.</p></div>
            


    </form>
</body>
</html>
