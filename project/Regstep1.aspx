<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regstep1.aspx.cs" Inherits="project.Regstep1" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cap" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>
        Registration Form 
    </title>
   
    <style>
   * {
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}

/* General Styles */
body {
    font-size: 14px;
    margin: 0;
}

/* Table Styling */
.table1, .table3 {
    box-shadow: 0 0 5px rgb(46, 138, 200);
    backdrop-filter: blur(10px);
    width: 90%;
    max-width: 1000px;
    margin: 30px auto;
    column-width: 400px;
}
.textboxss{
    height:40px;
    width:400px;
    align-items:center;

}
        .droplist {
            height: 40px;
            width: 405px;
             align-items:center;
        }

.names{
    font-size:larger;
   font-weight: 400;
   text-align:center;
   margin-left:10px;
}
/* Header Styling */
.header1 {
    text-align: center;
    padding: 3px;
    background-color: white;
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
    padding: 3px;
    background-color: rgb(46, 138, 200);
    color: black;
    text-align: right;
    height: 10px;
}

/* Footer Styling */
.footer1 {
    text-align: center;
    padding: 10px;
    background-color: rgb(44, 139, 198);
    color: black;
    margin-top: 20px;
}

.footer2 {
    text-align: center;
    padding: 3px;
    color: blue;
}

/* Buttons */
.submitbutton, .editbutton, .confirmbutton, .btnupload {
    height: 50px;
    width: 150px;
    margin: 10px;
    border: none;
    color: white;
    font-weight: bold;
    cursor: pointer;
}

.submitbutton {
    background-color: rgb(44, 139, 198);
}

.editbutton {
    background-color: red;
}

.confirmbutton {
    background-color: blue;
}

.btnupload {
    background-color: rgb(46, 138, 200);
    padding: 2px;
}

/* Input Fields */
.uploadtxtbox {
    height: 40px;
    width: 100%;
    max-width: 450px;
}

/* Logo */
.logo {
    height:105px ;
    max-width: 150px;
    margin: 0 auto;
    display: block;
    margin-left:20px;
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    .table1, .table3 {
        width: 95%;
    }
    .textboxss,.droplist{
        width:95%;
    }

    .submitbutton, .editbutton, .confirmbutton, .btnupload {
        width: 120px;
        font-size: 14px;
    }
}

@media screen and (max-width: 480px) {
    .table1, .table3 {
        column-width: auto;
    }
   

    .submitbutton, .editbutton, .confirmbutton, .btnupload {
        width: 100%;
    }
    .column-names{
        width:100px;
    }
}   .columns{
        width:100px;
        text-align:center;
    }
       
    </style>
    <script>
    function convertToUpper(input) {
        input.value = input.value.toUpperCase();
    }
   
   
</script>
     

</head>
<body>
    <form id="form1" runat="server">
        <a class="links" align="left" style="color:red;text-decoration:underline;" href="homepage.aspx" > logout</a>
         <header>
        
        <div class="header1"><img src="./Uploads/logo.png" alt="Company Logo" class="logo" align="left" /><h1>WELCOME TO MY COMPANY </h1></div>
        <div class="header3"> 
             </div>
        
    </header>
    <div>
    
        <table align="center" class="table1">
           <tr>
               <td colspan="2" align="center">
                <div class="header2"><h2>Registration<asp:Label ID="Label22" runat="server" ForeColor="White" Visible="False" >app</asp:Label>
                    </h2></div>    
               </td>
               </tr>
            <tr>
                <td class="column-names">
                    <asp:Label ID="Label1" runat="server" CssClass="names" Text="Surname "></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:TextBox ID="TextBox1" runat="server" AutoCompleteType="FirstName" CssClass="textboxss" ValidateRequestMode="Enabled" MaxLength="25"  onkeyup="convertToUpper(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="column-names">
                    <asp:Label ID="Label2" runat="server" CssClass="names" Text="Name "></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:TextBox ID="TextBox2" runat="server" AutoCompleteType="LastName" CssClass="textboxss" MaxLength="25"  onkeyup="convertToUpper(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="column-names">
                    <asp:Label ID="Label3" runat="server" CssClass="names" Text="Father Name "></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="textboxss" MaxLength="25" onkeyup="convertToUpper(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="column-names">
                    <asp:Label ID="Label4" runat="server" CssClass="names" Text="Mother Name"></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="textboxss" MaxLength="25"   onkeyup="convertToUpper(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="please enter characters only" ForeColor="Red" ValidationExpression="[A-Za-z ]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
              <tr>
                <td class="column-names">
                    <asp:Label ID="Label13" runat="server" CssClass="names" Text="Gender"></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:DropDownList ID="DropDownList5" runat="server" CssClass="droplist"  >
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                        <asp:ListItem Value="1">MALE</asp:ListItem>
                        <asp:ListItem Value="2">FEMALE</asp:ListItem>
                       
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList5" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="column-names">
                    <asp:Label ID="Label12" runat="server" CssClass="names" Text="Catagory "></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:DropDownList ID="DropDownList6" runat="server" CssClass="droplist">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                        <asp:ListItem Value="1">GENERAL</asp:ListItem>
                        <asp:ListItem Value="2">OBC</asp:ListItem>
                        <asp:ListItem Value="3">SC</asp:ListItem>
                        <asp:ListItem Value="4">ST</asp:ListItem>
                        <asp:ListItem Value="5">EWS</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList6" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
    <td class="column-names">
        <asp:Label ID="Label5" runat="server" CssClass="names" Text="Date of Birth "></asp:Label>
    </td>
    <td class="column" align="center">
        <asp:TextBox 
            ID="TextBox5" 
            runat="server" 
            CssClass="textboxss" 
            TextMode="Date" 
            oninput="calculateAge()" 
            Placeholder="MM/DD/YYYY"  ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="TextBox5" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
        <br />
        <asp:RangeValidator
            ID="rvAgeRange"
            runat="server"
            ControlToValidate="TextBox5"
            MinimumValue="01/01/1975"
            MaximumValue="01/01/2007"
            Type="Date"
            ErrorMessage="Age must be between 18 and 50 years."
            ForeColor="Red" />
        
    </td>
</tr>
             <tr>
                <td class="column-names">
                    <asp:Label ID="Label10" runat="server" CssClass="names" Text="Phone Number "></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="textboxss" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox8" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox8" ErrorMessage="please enter number must start with 6to9" ForeColor="Red" ValidationExpression="^[6-9]\d{9}$" ValidationGroup="i1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="column-names" >
                    <asp:Label ID="Label11" runat="server" CssClass="names" Text=" Email id "></asp:Label>
&nbsp;</td>
                <td class="column" align="center">
                    <asp:TextBox ID="TextBox9" runat="server" CssClass="textboxss" MaxLength="25" onkeyup="convertToUpper(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox9" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox9" ErrorMessage="Invaild Email Id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="i1"></asp:RegularExpressionValidator>
                </td>
            </tr>
<tr>
                <td class="column-names">
                    <asp:Label ID="Label6" runat="server" CssClass="names" Text="Address "></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="textboxss" MaxLength="25" onkeyup="convertToUpper(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td class="column-names" >
                    <asp:Label ID="Label18" runat="server" CssClass="names" Text="Country"></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:DropDownList ID="DropDownList7" runat="server" CssClass="droplist">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                        <asp:ListItem Value="1">INDIA</asp:ListItem>
                        <asp:ListItem Value="2">OTHERS</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="DropDownList7" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
                    <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="DropDownList7" ErrorMessage="only Indians are eligible  " ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="2"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td class="column-names">
                    <asp:Label ID="Label8" runat="server" CssClass="names" Text="State "></asp:Label>
                </td>
                 <td class="column" align="center">

       <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="droplist"   OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1"  onkeyup="convertToUpper(this)">
               

            </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
    </td>
            </tr>
            <tr>
                <td class="column-names" >
                    <asp:Label ID="Label7" runat="server" CssClass="names" Text="District "></asp:Label>
                </td>
               
    
    <td class="column" align="center">
        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="droplist">
                
            </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
    </td>
</tr>
            
           
            <tr>
                <td class="column-names" >
                    <asp:Label ID="Label9" runat="server" Text="Pincode " CssClass="names"></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="textboxss" MaxLength="6" onkeyup="convertToUpper(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox7" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox7" ErrorMessage="Please enter 6 number only" ForeColor="Red" ValidationExpression="^\d{6}$" ValidationGroup="i1"></asp:RegularExpressionValidator>
                </td>
            </tr>
           
              <tr>
                <td class="auto-style2" colspan="2" align="left" align="center">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="permanent address"  Font-Size="X-Large" Font-Underline="true" Font-Bold="true" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                   
                </td>
            </tr>
            <tr>
                <td class="column-names">
                    <asp:Label ID="Label14" runat="server" CssClass="names" Text="Address "></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:TextBox ID="TextBox10" runat="server" CssClass="textboxss" MaxLength="25" onkeyup="convertToUpper(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox10" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td class="column-names" >
                    <asp:Label ID="Label19" runat="server" CssClass="names" Text="Country"></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:DropDownList ID="DropDownList8" runat="server" CssClass="droplist" onkeyup="convertToUpper(this)">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                        <asp:ListItem Value="INDIA">INDIA</asp:ListItem>
                        <asp:ListItem Value="OTHERS">OTHERS</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="DropDownList8" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
                    <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="DropDownList8" ErrorMessage="only Indians are eligible  " ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="2"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
    <td class="column-names" >
        <asp:Label ID="Label16" runat="server" CssClass="names" Text="State "></asp:Label>
    </td>
    <td class="column" align="center">
         <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True"  CssClass="droplist"  OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged1" >
               
            </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
    <td class="column-names" >
        <asp:Label ID="Label15" runat="server" CssClass="names" Text="District "></asp:Label>
    </td>
    <td class="column" align="center">
        <asp:DropDownList ID="DropDownList4" runat="server" CssClass="droplist"  >
                
            </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="DropDownList4" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild" InitialValue="0"></asp:RequiredFieldValidator>
    </td>
</tr>
           
            <tr>
                <td class="column-names">
                    <asp:Label ID="Label17" runat="server" Text="Pincode " CssClass="names"></asp:Label>
                </td>
                <td class="column" align="center">
                    <asp:TextBox ID="TextBox11" runat="server" CssClass="textboxss" MaxLength="6"   onkeyup="convertToUpper(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBox11" ErrorMessage="Required" ForeColor="Red" ValidationGroup="i1" CssClass="vaild"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox11" ErrorMessage="Please enter 6 number only" ForeColor="Red" ValidationExpression="^\d{6}$" ValidationGroup="i1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td rowspan="2" class="column-names">
                    <asp:Label ID="Label21" runat="server" Text="Enter the captcha" CssClass="names"></asp:Label>
                </td>
                <td class="column" colspan="2" align="center">
                    <cap:CaptchaControl ID="captcha1" runat="server" CaptchaLength="5" CaptchaHeight="50" CaptchaWidth="200" CaptchaLineNoise="None" CaptchaMinTimeout="3" CaptchaMaxTimeout="240" ForeColor="Blue" BackColor="white" CaptchaChars="ABCDEFGHIJKLMNOPQRSTUVWX123456789" Height="75px" Width="284px" />
                </td>
            </tr>
             <tr>
                <td class="column" colspan="2" align="center">
                    <asp:TextBox ID="TextBox12" runat="server" Height="41px" Width="282px"></asp:TextBox>
                    <asp:Label ID="Label20" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2" align="left">
                   
                  <div>
    <b> DECLARATION <span style="color: red;">&ast;</span></b>
</div>
          <asp:CheckBox ID="chkDeclaration" runat="server" Text="1. I declare that I have carefully read and fully understood the various instructions, eligibility criteria, and other conditions and I hereby agree to abide by them." />
            <!-- Checkbox for accepting declaration -->
          
        </td>
    </tr>
            <tr>
                    <td class="auto-style9" colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Text="Submit" align="center"  ValidationGroup="i1" OnClick="Button1_Click"  CssClass="submitbutton"/>
                         <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" Visible="false"  align="left" CssClass="editbutton"/>
                         <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" Visible="false"  align="right" CssClass="confirmbutton"/>
                    </td>
                
            </tr>
    
        </table>
    
    </div>
         <footer>
       <div class="footer1">  <p> Registration Form All rights reserved.</p></div>
        </footer>
    </form>
</body>
</html>
