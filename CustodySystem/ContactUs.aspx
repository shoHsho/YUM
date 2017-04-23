<%@ Page Title="حول النظام" Language="C#"  MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="CustodySystem.ContactUs" %>
<%@ MasterType VirtualPath="~/Main.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ContactUs</title>
    <script language="javascript"type="text/javascript">
        //<![CDATA]
        function Reset1_onclick() {
            document.getElementById("ContactUs").reset();
        }
        //]]>

    </script>
    <link href="css/mstyles.css" rel="stylesheet" type="text/css" />
   
    <style type="text/css">
        .auto-style1 {
            width: 50px;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right-column-content">
             
            <div style="font-family:Arial">
                 <h1 id="H1" runat="server" 
        style="border: thin solid #C0C0C0; height: 40px; text-align: left; line-height: 45px; color: #FFFFFF; background-color: #4D4D4D; padding-left: 10px; margin-bottom: 10px;">Contact Us</h1>  
<fieldset style="width:35px">
    


    <table id="ContactUs">
        <tr>
            <td class="style1">
              <b>Name:</b>
             </td>
          
             <td class="style1">
                   <asp:TextBox ID="txtName"  runat="server" Width="208px"></asp:TextBox>
            </td>
             <td class="auto-style1">
 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
     runat="server" 
     ErrorMessage="Name is required" 
     ControlToValidate="txtName" 
     Text="*"
     foreColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
         <td class="style1">
              <b>Email:</b>
             </td>
          
             <td class="style1">
                   <asp:TextBox ID="txtEmail"  runat="server" Width="208px"></asp:TextBox>
            </td>
             <td class="auto-style1">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                    runat="server" 
                    ErrorMessage="Email is required" 
                    ControlToValidate="txtEmail" 
                     Display="Dynamic"
                      Text="*"
                     ForeColor="Red">*</asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                     Display="Dynamic"
                      runat="server" 
                     ErrorMessage="Please Enter a Valid Email" 
                     ControlToValidate="txtEmail"
                      ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                
                
            </td>
        </tr>
         <tr>
           
             <td class="style1">
              <b>Subject:</b>
             </td>
          
             <td class="style1">
                   <asp:TextBox ID="txtSubject"  runat="server" Width="208px"></asp:TextBox>
            </td>
             <td class="auto-style1">
 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
     runat="server" 
     ErrorMessage="Subject is required" 
     ControlToValidate="txtSubject" 
     Text="*"
     foreColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
            <tr>
           
             <td style="vertical-align:top">
              <b>Comments:</b>
             </td>
          
             <td style="vertical-align:top">
                   <asp:TextBox ID="txtComments"  runat="server" Width="208px" Rows="5" TextMode="MultiLine"></asp:TextBox>
            </td>
             <td style="vertical-align:top">
 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
     runat="server" 
     ErrorMessage="Comments are required" 
     ControlToValidate="txtComments" 
     Text="*"
     foreColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td  colspan="3">
                <asp:ValidationSummary ForeColor="Red" 
                    HeaderText="Please Fix The Following Errors" 
                    ID="ValidationSummary1" 
                    runat="server" />
            </td>
        </tr>
        <tr >
           <td colspan="3">
               <asp:Label ID="Label1" runat="server" Font-Bold="true"></asp:Label>
           </td>
        </tr>
        <tr>
        <td colspan="3">
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
            <input id="Reset1" type="reset" value="Reset" onclick="return Reset1_onclick()" />
        </td>
         </tr>
    </table>


</fieldset>
            </div>
      
      <h1 id="titleh1" runat="server" style="color: #FF0000; text-align: right;"></h1>
       
      </div>
</asp:Content>
