<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdatePermision.aspx.cs" Inherits="CustodySystem.UpdatePermision" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
 <link href="css/mstyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            font-weight: bold;
        }
        .style4
        {
            width: 124px;
            height: 40px;
        }
        .style5
        {
            height: 40px;
        }
        .style8
        {
            width: 124px;
            height: 30px;
        }
        .style9
        {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
<h1 id="titleh1" runat="server" 
        style="border: thin solid #C0C0C0; height: 40px; text-align: right; line-height: 45px; color: #FFFFFF; background-color: #4D4D4D; padding-right: 10px; margin-bottom: 10px;">
       تعديل الصلاحية للموظف</h1>  
            <div dir="rtl" style="border: thin solid #808080">
                 <table class="style1">
                     <tr>
                         <td class="style8">
                             رقم الموظف</td>
                         <td dir="rtl" class="style9" style="text-align: right">
                             <asp:TextBox ID="txtNo" runat="server" Height="26px" Width="150px" 
                                 CssClass="textbox" ReadOnly="True"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td class="style8">
                             اسم الموظف</td>
                         <td dir="rtl" class="style9">
                             <asp:TextBox ID="txtname" runat="server" Height="26px" Width="250px" 
                                 CssClass="textbox" ReadOnly="True"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td class="style8">
                             رقم الجوال</td>
                         <td dir="rtl" class="style9" style="text-align: right">
                             <asp:TextBox ID="txtPhone" runat="server" Height="26px" Width="150px" 
                                 CssClass="textbox" ReadOnly="True"></asp:TextBox>
                           
                         </td>
                     </tr>
                     <tr>
                         <td class="style8">
                             القسم</td>
                         <td dir="rtl" class="style9">
                             <asp:TextBox ID="txtDepartment" runat="server" Height="26px" Width="250px" 
                                 CssClass="textbox" ReadOnly="True"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td class="style8">
                             الوظيفة</td>
                         <td dir="rtl" class="style9">
                             <asp:TextBox ID="txtJob" runat="server" Height="26px" Width="250px" 
                                 CssClass="textbox" ReadOnly="True"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td class="style8">
                             الصلاحية</td>
                         <td dir="rtl" style="text-align: right" class="style9">
                             <asp:DropDownList ID="ddlPermission" runat="server" Height="26px" Width="150px">
                                 <asp:ListItem>Admin</asp:ListItem>
                                 <asp:ListItem>Staff</asp:ListItem>
                                 <asp:ListItem>Employee</asp:ListItem>
                                 <asp:ListItem>Suspend</asp:ListItem>
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td class="style4">
                             </td>
                         <td dir="rtl" style="text-align: right" class="style5">
                        <asp:Button ID="Button2" runat="server" Text="تحديث" CssClass="button11" 
                            onclick="Button2_Click1" ValidationGroup="a" />
                    &nbsp;
                        <asp:Button ID="Button3" runat="server" Text="رجوع" CssClass="buttonBack" 
                            onclick="Button2_Click" ValidationGroup="a" />
                         </td>
                     </tr>
                     </table>
    </div>
        <div style="border: thin solid #808080; margin-top: 10px;" dir="rtl">
            
    </div>
        </asp:Content>
