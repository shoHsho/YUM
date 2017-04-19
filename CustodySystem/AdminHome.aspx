<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="CustodySystem.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="css/mstyles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <p style="color: #FF0000; font-size: xx-large;">
                  محتوى الأدمن</p>
               <div  id ="MainPanels" >
               <div id="permiDiv"><asp:Panel ID="permiPanel" runat="server" Height="456px" Width="568px" > <!-- style="visibility: hidden;"-->
    <br /> 
   <!-- <asp:Button ID="viewB" runat="server" Text="View" Height="26px" Width="69px" onclick="viewB_Click" />-->
                      <br />
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:constr %>" 
                          
                       SelectCommand="SELECT [Employee_ID], [Employee_Name], [Phone_No], [Department], [Job], [Access] FROM [Employee]"></asp:SqlDataSource>
    <br />
                      <asp:GridView ID="GridViewEmp" runat="server" AllowSorting="True" 
                          AutoGenerateColumns="False" DataKeyNames="Employee_ID" 
                          DataSourceID="SqlDataSource1" Height="134px" Width="513px">
                          <Columns>
                              <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" 
                                  ReadOnly="True" SortExpression="Employee_ID" />
                              <asp:BoundField DataField="Employee_Name" HeaderText="Employee_Name" 
                                  SortExpression="Employee_Name" />
                              <asp:BoundField DataField="Phone_No" HeaderText="Phone_No" 
                                  SortExpression="Phone_No" />
                              <asp:BoundField DataField="Department" HeaderText="Department" 
                                  SortExpression="Department" />
                              <asp:BoundField DataField="Job" HeaderText="Job" SortExpression="Job" />
                              <asp:BoundField DataField="Access" HeaderText="Access" 
                                  SortExpression="Access" />
                          </Columns>
                      </asp:GridView>
    <br />
    <br />
    <form id="permiForm" action="suspend.aspx" >
    <table >
        
        <tr>
            <td><asp:Label ID="idLabel" runat="server" Text="ID"></asp:Label></td>
            <td><asp:TextBox ID="idText" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="nameLabel" runat="server" Text="Name"></asp:Label></td>
            <td><asp:TextBox ID="nameText" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="deptLabel" runat="server" Text="Department"></asp:Label></td>
            <td><asp:TextBox ID="deptText" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="accessLabel" runat="server" Text="Access"></asp:Label></td>
            <td><asp:DropDownList ID="accessDropDownList" runat="server" Width="125px">
                    <asp:ListItem Value="1">Admin</asp:ListItem>
                    <asp:ListItem Value="2">Staff</asp:ListItem>
                    <asp:ListItem Selected="True" Value="3">Employee</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
         <tr>
            <td><asp:Label ID="passLabel" runat="server" Text="Password"></asp:Label></td>
            <td><asp:TextBox ID="passText" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
        <td ></td>
        </tr>
        <tr>
        <td><asp:Button ID="clr" runat="server" Text="Clear" 
                OnClientClick="this.form.reset();return false;" Height="26px" Width="69px" /></td>
        <td><asp:Button ID="sbmt" runat="server" Text="Submit" Height="26px" Width="69px" 
                onclick="permisbmt_Click" /></td>
        </tr>
        </table>
        <br />
    
        </form>
    </asp:Panel></div>

     <div id="ReportDiv"> <asp:Panel ID="ReportPanel" runat="server" >
      تقارير
    </asp:Panel></div>
  
       <div id="OrderDiv"><asp:Panel ID="OrderPanel" runat="server" >
        طلب عهد
    </asp:Panel></div> 
    
  <div id="ReturnDiv"> <asp:Panel ID="ReturnPanel" runat="server" >
    ارجاع عهد
    </asp:Panel></div> 

   <div id="AcceptDiv"><asp:Panel ID="AcceptPanel" runat="server" >
    قبول
    </asp:Panel></div>
     </div>         
</asp:Content>

