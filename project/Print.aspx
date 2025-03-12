<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Print.aspx.cs" Inherits="project.Print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <%--   <link rel="stylesheet" type="text/css" href="Regstyle2.css" />--%>
    

     <script type="text/javascript">
        function openPrintDialog() {
            // Hide the button
            document.getElementById('<%= Button1.ClientID %>').style.display = 'none';
             document.getElementById('<%= Button2.ClientID %>').style.display = 'none';
            // Open the print dialog
            window.print();

            // Show the button again after printing (optional)
            setTimeout(function () {
                document.getElementById('<%= Button1.ClientID %>').style.display = 'inline-block';
                document.getElementById('<%= Button2.ClientID %>').style.display = 'inline-block';
            }, 500);

        }
    </script>

    <style type="text/css">
     body {
    border: double;
    width: auto;
    margin: 0;
    padding: 0;
}

/* Table Styles */
.printtable1 {
    height: auto;
    max-width: 1000px;
    width: 90%;
    margin: 50px auto;
    align-self: center;
}

/* Header */
.Printheader {
    background-color: lightgray;
    text-align: center;
    color: black;
    font-size: x-large;
    font-weight: 800;
    max-width: 100%;
    padding: 10px;
}

/* Table Cells */
td {
    border: 1px solid black;
    padding: 5px;
    text-align: center;
}

/* Text Styles */
.pnt {
    font-weight: 300;
}

.pntm {
    font-weight: 500;
}

/* General Headers */
.header1 {
    text-align: center;
    padding: 3px;
    background-color: rgb(255, 255, 255);
    height: 75px;
    width: auto;
}

h1 {
    text-align: center;
}

/* Logo */
.logo {
    height: 105px;
    width: auto;
    max-width: 190px;
    margin-left: 30px;
    border: unset;
}

/* Additional Header */
.header3 {
    text-align: right;
    padding: 3px;
    background-color: rgb(46, 138, 200);
    color: black;
    height: 10px;
    width: auto;
}

/* Button Styling */
.buttonsubmit {
    max-width: 90%;
    margin: auto;
    display: block;
    text-align: center;
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    .Printheader {
        font-size: large;
    }

    .logo {
        height: 80px;
        max-width: 150px;
        margin-left: 10px;
    }

    td {
        font-size: smaller;
        padding: 3px;
    }

    .buttonsubmit {
        width: 100%;
        max-width: 200px;
    }
}

        
    </style>

   


   

    </head>
<body>
    <form id="form1" runat="server">
         <header>
        <div class="header1"><img src="./Uploads/logo.png" alt="Company Logo" class="logo" align="left" /><h1>WELCOME TO MY COMPANY </h1></div>
        <div class="header3"> 
             </div>
        
    </header>
    <div>
    
        <table class="printtable1" algin="center">
            <tr>
                <td colspan="8" align="Left" class="Printheader" >Personal Details 
    
                </td>
                
            </tr>
            <tr>
                <td colspan="8" align="Left" class="Printheader" >Registration No <asp:Label ID="Label77" runat="server" ForeColor="Red"></asp:Label></td>
                
            </tr>
            <tr>
                <td><asp:Label ID="label1" runat="server" Text="surname" CssClass="pnt"></asp:Label></td>
                 <td>
                     <asp:Label ID="Label2" runat="server" CssClass="pntm"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Name" CssClass="pnt"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" CssClass="pntm"></asp:Label>
                </td>
                <td rowspan="4" colspan="4">
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="307px" CssClass="auto-style4" />
                </td>
               
            </tr>
             <tr>
                <td><asp:Label ID="label5" runat="server" Text="Father Name" CssClass="pnt"></asp:Label></td>
                 <td>
                     <asp:Label ID="Label6" runat="server" CssClass="pntm"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Mother Name" CssClass="pnt"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" CssClass="pntm"></asp:Label>
                </td>
                 
            </tr>
            <tr>
                <td><asp:Label ID="label9" runat="server" Text="Gender" CssClass="pnt"></asp:Label></td>
                 <td>
                     <asp:Label ID="Label10" runat="server" CssClass="pntm"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Category" CssClass="pnt"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label12" runat="server" CssClass="pntm"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="label13" runat="server" Text="Date of Birth" CssClass="pnt"></asp:Label></td>
                 <td>
                     <asp:Label ID="Label14" runat="server" CssClass="pntm"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="Phone Number" CssClass="pnt"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label16" runat="server" CssClass="pntm"></asp:Label>
                </td>
            </tr>
            <tr>
                <td rowspan="2"><asp:Label ID="label21" runat="server" Text="address" CssClass="pnt"></asp:Label></td>
                 <td rowspan="2">
                     <asp:Label ID="Label22" runat="server" CssClass="pntm"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label19" runat="server" Text="Email Id"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label20" runat="server" CssClass="pntm"></asp:Label>
                </td>
                 <td rowspan="2" colspan="4">
                     <asp:Image ID="Image2" runat="server"  Height="50px" Width="216px" CssClass="auto-style5"/>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label23" runat="server" Text="Permanent Address" CssClass="pnt"></asp:Label>
                 </td>
                 <td>
                    <asp:Label ID="Label24" runat="server" CssClass="pntm"></asp:Label>
                 </td>
                           </tr>
          
            <tr>
                 <td colspan="8" align="Left" class="Printheader" >Qulification Details </td>
                
            </tr>
           <tr>
                <td><asp:Label ID="label25" runat="server" Text="qualification"></asp:Label></td>
                 <td>
                     <asp:Label ID="Label26" runat="server" Text="Course Name "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label27" runat="server" Text="College Name"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label28" runat="server" Text="University Name"></asp:Label>
                </td>
               
                 <td>
                     <asp:Label ID="Label30" runat="server" Text="Passed Out "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label31" runat="server" Text="Board"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label32" runat="server" Text="Percentage"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="label33" runat="server"></asp:Label></td>
                 <td>
                     <asp:Label ID="Label34" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label35" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label36" runat="server">           -  </asp:Label>
                </td>
               
                 <td>
                     <asp:Label ID="Label38" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label39" runat="server" ></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label40" runat="server"></asp:Label>
                </td>
            </tr>
           <tr>
                <td><asp:Label ID="label41" runat="server" ></asp:Label></td>
                 <td>
                     <asp:Label ID="Label42" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label43" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label44" runat="server" ></asp:Label>
                </td>
               
                 <td>
                     <asp:Label ID="Label46" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label47" runat="server" ></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label48" runat="server"></asp:Label>
                </td>
            </tr>
           <tr>
                <td><asp:Label ID="label49" runat="server" ></asp:Label></td>
                 <td>
                     <asp:Label ID="Label50" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label51" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label52" runat="server" ></asp:Label>
                </td>
              
                 <td>
                     <asp:Label ID="Label54" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label55" runat="server" ></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label56" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="label57" runat="server" ></asp:Label></td>
                 <td>
                     <asp:Label ID="Label58" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label59" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label60" runat="server" ></asp:Label>
                </td>
             
                 <td>
                     <asp:Label ID="Label62" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label63" runat="server" ></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label64" runat="server" ></asp:Label>
                </td>
            </tr>
            
        
            <tr>
                <td colspan="8"  align="Left" class="Printheader" >Documents Status </td>
                
            </tr>
            <tr>
                <td colspan="4" class="column"><asp:Label ID="label67" runat="server" Text="Aadhar"></asp:Label></td>
                 <td colspan="4" class="auto-style7">
                     <asp:Label ID="Label68" runat="server"></asp:Label>
                </td>
                
                </tr>
                      <tr>
                <td colspan="4" class="column"><asp:Label ID="label69" runat="server" Text="Class X"></asp:Label></td>
                 <td colspan="4" class="auto-style7">
                     <asp:Label ID="Label70" runat="server"></asp:Label>
                </td>
                </tr>
                        <tr>
                <td colspan="4" class="column"><asp:Label ID="label71" runat="server" Text="Intermediate"></asp:Label></td>
                 <td colspan="4" class="auto-style7">
                     <asp:Label ID="Label72" runat="server"></asp:Label>
                </td>
                </tr>
                  <tr>
                <td colspan="4" class="column"><asp:Label ID="label73" runat="server" Text="Degree"></asp:Label></td>
                 <td colspan="4" class="auto-style7">
                     <asp:Label ID="Label74" runat="server"></asp:Label>
                </td>
                </tr>
                      <tr>
                <td colspan="4" class="column"><asp:Label ID="label75" runat="server" Text="Post Garduation"></asp:Label></td>
                 <td colspan="4" class="auto-style7">
                     <asp:Label ID="Label76" runat="server"></asp:Label>
                </td>
                </tr>
       </table>
       <%--<table class="itable" align="center" >
            <tr>
                <td colspan="8" align="center" class="Printheader" > Instructions </td> 

            </tr>
                <tr>
                
                <td>1. Read all the instructions carefully before proceeding.</td>
            </tr>
            <tr>
                
                <td>2. Follow each step in the given order to avoid errors.</td>
            </tr>
            <tr>
                
                <td>3. Ensure you have all required materials before starting.</td>
            </tr>
            <tr>
                
                <td>4. Contact support if you encounter any issues.</td>
            </tr>
            <tr>
                
                <td>5. Double-check your work before submission.</td>
            </tr>
                
       </table>--%>
        <div class="buttonsubmit" align="center">
             <asp:Button ID="Button2" runat="server" Text="Home" width="100px" Height="30px" margin-top="50px" align="left" OnClick="Button2_Click"/>
        <asp:Button ID="Button1" runat="server" OnClientClick="openPrintDialog(); return false;" Text="Printout" width="100px" Height="30px" margin-top="50px" align="right"/>
           
        <asp:Label ID="Label78" runat="server" ForeColor="Red"></asp:Label>
    
            </div> 
    </div>
    </form>
</body>
</html>
