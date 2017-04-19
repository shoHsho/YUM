<%@ Page Title="" Language="C#" MasterPageFile="~/Staff.Master" AutoEventWireup="true" CodeBehind="StaffOrders.aspx.cs" Inherits="CustodySystem.StaffOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mstyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
          .panel
        {
            text-align:right;
            float:right;
            font-size:medium;
            font-weight:bold;
        }
        #myChecks label{margin-right:5px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1 id="titleh1" runat="server" 
        style="border: thin solid #C0C0C0; height: 40px; text-align: right; line-height: 45px; color: #FFFFFF; background-color: #4D4D4D; padding-right: 10px; margin-bottom: 10px;">
       طلبات العهد 
       تحت الاجراء</h1>  
             
        <div style="border: thin solid #808080; margin-top: 3px; margin-bottom: 10px;" 
        dir="rtl">
            <table width="100%" >
                <tr>
                    <td >
                      
                            <div style="width: 100%">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" DataKeyNames="OrderNo" ForeColor="Black" 
                                    style="text-align: center; color: #FFFFFF;" Width="100%">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="OrderNo" HeaderText="رقم الطلب">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Employee_ID" HeaderText="رقم الموظف">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Employee_Name" HeaderText="اسم الموظف">
                                        <ControlStyle Width="75px" />
                                        <HeaderStyle ForeColor="White" />
                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="170px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="job" HeaderText="الوظيفة">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="OrderDate" HeaderText="التاريخ" 
                                            DataFormatString="{0:d}">
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
                           
                    </td>
                </tr>
                <tr>
                    <td width="100%" >
                    
                                          <div style="text-align: center">
            <asp:Label ID="lblstatus" runat="server"></asp:Label>
</div></td>
                </tr>
                <tr>
                    <td >
                    
                                          <div id="updateOrder" runat="server" style="text-align: center">
            
                                              <table cellpadding="2" class="style1">
                                                  <tr>
                                                      <td style="font-weight: bold">
                                                          حالة الطلب</td>
                                                      <td style="text-align: right">
                                                          <asp:DropDownList ID="ddlstatus" runat="server" Font-Bold="True">
                                                              <asp:ListItem Value="0">تحت الاجراء</asp:ListItem>
                                                              <asp:ListItem Value="1">قبول</asp:ListItem>
                                                              <asp:ListItem Value="2">رفض</asp:ListItem>
                                                          </asp:DropDownList>
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td style="font-weight: bold">
                                                          العهدة</td>
                                                      <td style="border: thin solid #C0C0C0">
                                                         <div id="myChecks">
                                                <asp:CheckBoxList ID="chLstCustody" 
    runat="server" 
                                    cssclass="panel">
                                   
                                                </asp:CheckBoxList>
                                                </div></td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                          &nbsp;</td>
                                                      <td>
                                                          <asp:Button ID="btnSearch1" runat="server" Text="ارسال" CssClass="button12" 
                            onclick="Button2_Click" ValidationGroup="a" /></td>
                                                  </tr>
                                                  <tr>
                                                      <td colspan="2">
                                                                             
                                          <div style="text-align: center">
            
                                              
            
</div></td>
                                                  </tr>
                                              </table>
            
</div></td>
                </tr>
                </table>
    </div>
    <h1 id="H1" runat="server" 
        
    style="border: thin solid #C0C0C0; height: 40px; text-align: right; line-height: 45px; color: #FFFFFF; background-color: #4D4D4D; padding-right: 10px; margin-bottom: 1px;">
        طلبات العهد المقبولة</h1>
    <div style="border: thin solid #808080; margin-top: 3px; margin-bottom: 10px;" 
        dir="rtl">
            <table width="100%" >
                <tr>
                    <td >
                        
                            <div style="width: 100%">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" DataKeyNames="Employee_ID" ForeColor="Black" 
                                    style="text-align: center; color: #FFFFFF;" Width="100%">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="OrderNo" HeaderText="رقم الطلب">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Employee_ID" HeaderText="رقم الموظف">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Employee_Name" HeaderText="اسم الموظف">
                                        <ControlStyle Width="75px" />
                                        <HeaderStyle ForeColor="White" />
                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="170px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Job" HeaderText="الوظيفة">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="OrderDate" HeaderText="التاريخ" 
                                            DataFormatString="{0:d}">
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
                          
                    </td>
                </tr>
                <tr>
                    <td width="100%" >
                    
                                          <div style="text-align: center">
            <asp:Label ID="lblaccept" runat="server"></asp:Label>
</div></td>
                </tr>
                <tr>
                    <td >
                    
                                          <div style="text-align: center">
            
                                              
            
</div></td>
                </tr>
                </table>
    </div>
    <h1 id="H2" runat="server" 
        style="border: thin solid #C0C0C0; height: 40px; text-align: right; line-height: 45px; color: #FFFFFF; background-color: #4D4D4D; padding-right: 10px; margin-bottom: 10px;">
        طلبات العهد المرفوضة</h1>
        <div style="border: thin solid #808080; margin-top: 10px;" dir="rtl">
            <table width="100%" >
                <tr>
                    <td >
                      
                            <div style="width: 100%">
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" DataKeyNames="Employee_ID" ForeColor="Black" 
                                    style="text-align: center; color: #FFFFFF;" Width="100%">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="OrderNo" HeaderText="رقم الطلب">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Employee_ID" HeaderText="رقم الموظف">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Employee_Name" HeaderText="اسم الموظف">
                                        <ControlStyle Width="75px" />
                                        <HeaderStyle ForeColor="White" />
                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="170px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="job" HeaderText="الوظيفة">
                                        <HeaderStyle ForeColor="White" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="OrderDate" HeaderText="التاريخ" 
                                            DataFormatString="{0:d}">
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
                          
                    </td>
                </tr>
                <tr>
                    <td width="100%" >
                    
                                          <div style="text-align: center">
            <asp:Label ID="lblreject" runat="server"></asp:Label>
</div></td>
                </tr>
                <tr>
                    <td >
                    
                                          <div style="text-align: center">
            
                                              
            
</div></td>
                </tr>
                </table>
    </div>
        </asp:Content>
