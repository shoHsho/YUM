<%@ Page Title="" Language="C#" MasterPageFile="~/Staff.Master" AutoEventWireup="true" CodeBehind="JobCustodies.aspx.cs" Inherits="CustodySystem.JobCustodies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mstyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        
        .style1
        {
            width: 100%;
            color: #000000;
            font-size: medium;
        }
        .style2
        {
            font-weight: bold;
            width: 151px;
            text-align: center;
        }
        .textbox
        {
            text-align:center;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 389px;
        }
        .panel
        {
            text-align:right;
            float:right;
            font-size:medium;
            font-weight:bold;
        }
        .CheckboxList
        {    text-align: right;
            float: right;
            font-size: medium;
            font-weight: bold;
            clear:both;
        }
        .style5
        {
            width: 389px;
            height: 40px;
             margin-left:10px;
          
            padding-left:10px;
           
        }
        .style6
        {
            text-align: center;
            height: 40px;
        }
        #myChecks label{margin-right:5px;}
    </style>
</asp:Content>

<asp:Content ID="Content3" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
   
   <h1 id="titleh1" runat="server" 
        style="border: thin solid #C0C0C0; height: 40px; text-align: right; line-height: 45px; color: #FFFFFF; background-color: #4D4D4D; padding-right: 10px; margin-bottom: 10px;">
       عهد الوظائف - ربط العهد بالوظيفة</h1>  
             <div dir="rtl" style="border: thin solid #808080">
                 <table class="style1">
                     <tr>
                         <td class="style2">
                             اختر الوظيفة</td>
                         <td dir="rtl">
                             <asp:ScriptManager ID="ScriptManager1" runat="server">
                             </asp:ScriptManager>
                             <asp:DropDownList ID="ddljobs" runat="server" Height="24px" Width="175px" 
                                 AutoPostBack="True" onselectedindexchanged="ddljobs_SelectedIndexChanged">
                             </asp:DropDownList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                 ControlToValidate="ddljobs" Display="Dynamic" ErrorMessage="*" 
                                 ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             &nbsp;</td>
                         <td dir="rtl">
                             &nbsp;</td>
                     </tr>
                     </table>
    </div>
        <div style="border: thin solid #808080; margin-top: 10px;">
            <table class="style3">
                <tr>
                    <td dir="ltr" style="text-align: right">
                        <div id="myChecks" style="text-align: right">
                                <asp:CheckBoxList ID="chLstCustody" runat="server" TextAlign="Left" 
                                    cssclass="CheckboxList">
                                </asp:CheckBoxList>
                                </div>
                          
                    </td>
                    <td class="style6">
                        <strong>جميع العهد</strong></td>
                </tr>
                <tr>
                    <td class="style4" style="border: thin solid #C0C0C0">
                       
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                             <div id="myChecks">
                                                <asp:CheckBoxList ID="chLstPrevCustody" 
    runat="server" TextAlign="Left" 
                                    cssclass="CheckboxList">
                                   
                                                </asp:CheckBoxList>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddljobs" 
                                                    EventName="SelectedIndexChanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                       
                                        </td>
                    <td style="border: thin solid #C0C0C0; font-weight: bold; margin-top: 10px; padding-top: 10px; text-align: center;">
                        العهدة المرتبطة بالوظيفة المحددة</td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Button ID="Button2" runat="server" Text="اضافة" CssClass="button11" 
                            onclick="Button2_Click" ValidationGroup="a" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
    </div>
        </asp:Content>

