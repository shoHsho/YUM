<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Usersprivilege.aspx.cs" Inherits="CustodySystem.Usersprivilege" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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
            width: 477px;
        }
      
    </style>
</asp:Content>
<asp:Content ID="Content3" runat="server" 
    contentplaceholderid="ContentPlaceHolder3">
   
   <h1 id="titleh1" runat="server" 
        style="border: thin solid #C0C0C0; height: 40px; text-align: right; line-height: 45px; color: #FFFFFF; background-color: #4D4D4D; padding-right: 10px; margin-bottom: 10px;">
       الصلاحيات</h1>  
             <div dir="rtl" >
                 <table class="style1">
                     <tr>
                         <td class="style2">
                             &nbsp;</td>
                         <td dir="rtl">
                             <asp:ScriptManager ID="ScriptManager1" runat="server">
                             </asp:ScriptManager>
                         </td>
                     </tr>
                     <tr>
                         <td>
                         <div style="display: block; text-align: left; overflow: auto; height: 100%;">  <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="button12" 
                            onclick="Button2_Click" ValidationGroup="a" /></div>
                      
                         </td>
                         <td dir="rtl">
                           <div style="text-align: right">  <asp:TextBox ID="txtname" runat="server" 
                                   Height="26px" Width="250px" 
                                 CssClass="textbox"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                 ControlToValidate="txtname" Display="Dynamic" ErrorMessage="*" 
                                 ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator></div>
                         </td>
                     </tr>
                     </table>
    </div>
        <div style="border: thin solid #808080; margin-top: 10px;" dir="rtl">
            <table class="style3">
                <tr>
                    <td >
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                            <div style="width: 100%">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" DataKeyNames="Employee_ID" ForeColor="Black" 
                                    style="text-align: center; color: #FFFFFF;" Width="100%">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="index" HeaderText="#">
                                        <HeaderStyle ForeColor="White" HorizontalAlign="Center" 
                                            VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Employee_ID" HeaderText="رقم الموظف">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Employee_Name" HeaderText="اسم الموظف">
                                        <ControlStyle Width="75px" />
                                        <HeaderStyle ForeColor="White" />
                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="170px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Department" HeaderText="القسم">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="job" HeaderText="الوظيفة">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Access" HeaderText="الصلاحية">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton_Update" runat="server" Height="26px" 
                                                    ImageUrl="~/images/edit1.jpg" onclick="ImageButton_Update_Click" Width="26px" />
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Height="30px" 
                                        HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Center" 
                                        VerticalAlign="Middle" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                </asp:GridView>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td >
                    
                                          <div style="text-align: center">
            <asp:Label ID="lblstatus" runat="server" Text="Label"></asp:Label>
</div></td>
                </tr>
                </table>
    </div>
        </asp:Content>





