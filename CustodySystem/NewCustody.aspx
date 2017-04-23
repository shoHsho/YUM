<%@ Page Title="" Language="C#" MasterPageFile="~/Staff.Master" AutoEventWireup="true" CodeBehind="NewCustody.aspx.cs" Inherits="CustodySystem.NewCustody" %>
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
            width: 477px;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 477px;
            text-align: center;
        }
        .auto-style4 {
            width: 215px;
        }
        .auto-style5 {
            width: 57%;
            height: 49px;
        }
        .auto-style6 {
            text-align: center;
            margin-top: 0;
        }
        .auto-style7 {
            text-align: justify;
        }
        </style>
</asp:Content>

<asp:Content ID="Content3" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
   
   <h1 id="titleh1" runat="server" 
        style="border: thin solid #C0C0C0; height: 40px; line-height: 45px; color: #FFFFFF; background-color: #4D4D4D; padding-right: 10px; margin-bottom: 10px;" class="auto-style1">اضافة عهدة</h1>  
             <div dir="rtl" style="border: thin solid #808080">
                 <table class="style1">
                     <tr>
                         <td class="style2">
                             رقم العهدة</td>
                         <td dir="rtl" class="auto-style7">
                             <asp:TextBox ID="txtid" runat="server" Height="26px" Width="111px" 
                                 CssClass="textbox" ReadOnly="True"></asp:TextBox>
                             <asp:ScriptManager ID="ScriptManager1" runat="server">
                             </asp:ScriptManager>
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             اسم العهدة</td>
                         <td dir="rtl" class="auto-style7">
                             <asp:TextBox ID="txtcname" runat="server" Height="26px" Width="250px" 
                                 CssClass="textbox"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                 ControlToValidate="txtcname" Display="Dynamic" ErrorMessage="*" 
                                 ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             تاريخ الإضافة</td>
                         <td dir="rtl" class="auto-style7">
                             <asp:TextBox ID="txtaddDate" runat="server" Height="26px" Width="111px" 
                                 ForeColor="Black" CssClass="textbox"></asp:TextBox>
                           
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                 ControlToValidate="txtaddDate" Display="Dynamic" 
                                 ErrorMessage="صيغة التاريخ غير صحيحة" ForeColor="#CC0000" 
                                 SetFocusOnError="True" 
                                 ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" 
                                 ValidationGroup="a" />
                           
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             الكمية او العدد</td>
                         <td dir="rtl" class="auto-style7">
                             <asp:TextBox ID="txtqty" runat="server" Height="26px" Width="111px" 
                                 CssClass="textbox"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                 ControlToValidate="txtqty" Display="Dynamic" ErrorMessage="*" 
                                 ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             ملاحظات</td>
                         <td dir="rtl" class="auto-style7">
                             <asp:TextBox ID="txtNotes" runat="server" Height="57px" TextMode="MultiLine" 
                                 Width="250px" CssClass="textbox"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             &nbsp;</td>
                         <td dir="rtl" class="auto-style7">
                             &nbsp;</td>
                     </tr>
                     </table>
    </div>
        <div style="border: thin solid #808080; margin-top: 10px;">
            <table class="style3">
                <tr>
                    <td class="auto-style2">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="#CCCCCC" 
    BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" ForeColor="Black" 
    GridLines="Horizontal" ShowHeader="False" 
                            Width="100%">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                &nbsp;<asp:TextBox ID="txtsp" runat="server" Height="26px" 
                                            style="text-align: center" TabIndex="1" Text='<%# Bind("sp") %>' 
                                            Width="100%"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <br />
                                                <asp:TextBox ID="txtindex" runat="server" BackColor="#E6F2F2" Height="26px" 
                                                    ReadOnly="True" style="text-align: center" TabIndex="1" Width="35px" Text='<%# Bind("index") %>'></asp:TextBox>
                                            </ItemTemplate>
                                            <ItemStyle Width="40px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnPlus" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnMinus" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                    <td class="auto-style1">
                        <strong>المواصفات</strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnMinus" runat="server"  
                                            style="font-weight: 700; font-size: large" Text="-" 
                            Width="38px" CssClass="textbox" onclick="btnMinus_Click" />
                                    &nbsp;
                                        <asp:Button ID="btnPlus" runat="server" onclick="btnPlus_Click" 
                                            style="font-weight: 700; font-size: large" Text="+" 
                            Width="38px" CssClass="textbox" />
                                    </td>
                    <td>
                        &nbsp;</td>
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
    <div>

    </div>

     <h1 id="H1" runat="server" 
        style="border: thin solid #C0C0C0; height: 40px; line-height: 45px; color: #FFFFFF; background-color: #4D4D4D; padding-right: 10px; margin-bottom: 10px;" class="auto-style1">حذف عهدة</h1> 
 <div  style="border: thin solid #808080">

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" DeleteCommand="DELETE FROM [Custody] WHERE [Custody_ID] = @Custody_ID" InsertCommand="INSERT INTO [Custody] ([Custody_ID], [Custody_Name], [Added_Date], [Amount]) VALUES (@Custody_ID, @Custody_Name, @Added_Date, @Amount)" SelectCommand="SELECT [Custody_ID], [Custody_Name], [Added_Date], [Amount] FROM [Custody]" UpdateCommand="UPDATE [Custody] SET [Custody_Name] = @Custody_Name, [Added_Date] = @Added_Date, [Amount] = @Amount WHERE [Custody_ID] = @Custody_ID">
         <DeleteParameters>
             <asp:ControlParameter ControlID="TxtIDentefication" Name="Custody_ID" PropertyName="Text" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Custody_ID" Type="Int32" />
             <asp:Parameter Name="Custody_Name" Type="String" />
             <asp:Parameter DbType="Date" Name="Added_Date" />
             <asp:Parameter Name="Amount" Type="Int32" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Custody_Name" Type="String" />
             <asp:Parameter DbType="Date" Name="Added_Date" />
             <asp:Parameter Name="Amount" Type="Int32" />
             <asp:Parameter Name="Custody_ID" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
     <table class="auto-style5">
         <tr>
             <td class="auto-style4">
                 <asp:TextBox ID="TxtIDentefication" runat="server" Width="208px" CssClass="auto-style6" Height="40px"></asp:TextBox>
             </td>
             <td><asp:Button ID="BtnDelete" runat="server" Text="Delete" CssClass="button11" ForeColor="White" Height="34px" Width="102px"  />
                 </td>
         </tr>
     </table>
     <br />
     <table class="style3">
         
         <tr>
             <td>
                 
                 <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource1" Width="552px">
                 </asp:GridView>
                 
             </td>
             
         </tr>
     </table>

 </div>

     <h1 id="H2" runat="server" 
        style="border: thin solid #C0C0C0; height: 40px; line-height: 45px; color: #FFFFFF; background-color: #4D4D4D; padding-right: 10px; margin-bottom: 10px;" class="auto-style1">تحديث عهدة</h1> 
    <div  style= "border: thin solid #C0C0C0;">

        <br />
     
        <br />

    </div>
       
        

       
        

    

       
        </asp:Content>

