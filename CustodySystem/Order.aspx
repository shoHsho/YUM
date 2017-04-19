<%@ Page Title="" Language="C#" MasterPageFile="~/Emp.Master" AutoEventWireup="true"
    CodeBehind="Order.aspx.cs" Inherits="CustodySystem.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mstyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 78%;
            color: #000000;
            font-size: medium;
        }
        .textbox
        {
            text-align: center;
        }
        .style3
        {
            width: 100%;
        }
        .panel
        {
            text-align: right;
            float: right;
            font-size: medium;
            font-weight: bold;
            clear: both;
        }
        .CheckboxList
        {    text-align: right;
            float: right;
            font-size: medium;
            font-weight: bold;
            clear:both;
        }
        .CheckboxList input
        { text-align: right;
           float: right;
            font-size: medium;
            font-weight: bold;
            clear:both;
           
        }
        #myChecks label
        {
            margin-right: 5px;
            font-size: medium;
            font-weight: bold;
            clear:both;
        }
        .style4
        {
            width: 78%;
            color: #000000;
            font-size: medium;
            height: 35px;
        }
        .style5
        {
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1 id="titleh1" runat="server" style="border: thin solid #C0C0C0; height: 40px;
        text-align: right; line-height: 45px; color: #FFFFFF; background-color: #4D4D4D;
        padding-right: 10px; margin-bottom: 10px;">
        طلب عهدة</h1>
    <div style="border: thin solid #808080; margin-top: 10px;">
        <table class="style3" width="100%">
            <tr>
                <td style="border: thin solid #C0C0C0; text-align: right;">
                    <asp:TextBox ID="txtNo" runat="server" ReadOnly="True"  CssClass="textbox"></asp:TextBox>
                </td>
                <td style="border: thin solid #C0C0C0; font-weight: bold; margin-top: 10px; padding-top: 10px;
                    text-align: center;">
                    رقم الطلب
                </td>
            </tr>
            <tr>
                <td style="border: thin solid #C0C0C0; text-align: right;">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtaddDate"
                        Display="Dynamic" ErrorMessage="صيغة التاريخ غير صحيحة" ForeColor="#CC0000" SetFocusOnError="True"
                        ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"
                        ValidationGroup="a" />
                    <asp:TextBox ID="txtaddDate" runat="server" Height="26px" Width="111px" ForeColor="Black"
                        CssClass="textbox" ReadOnly="True"></asp:TextBox>
                </td>
                <td style="border: thin solid #C0C0C0; font-weight: bold; margin-top: 10px; padding-top: 10px;
                    text-align: center;">
                    التاريخ
                </td>
            </tr>
            <tr>
                <td class="style4" style="border: thin solid #C0C0C0; text-align: right;">
                    <div id="myChecks" style="text-align: right">
                        <asp:CheckBoxList ID="chLstPrevCustody" runat="server" TextAlign="Left" CssClass="CheckboxList">
                        </asp:CheckBoxList>
                    </div>
                </td>
                <td style="border: thin solid #C0C0C0; font-weight: bold; margin-top: 10px; padding-top: 10px;
                    text-align: center;" class="style5">
                    اختر العهدة
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Button ID="Button2" runat="server" Text="طلب" CssClass="button11" OnClick="Button2_Click"
                        ValidationGroup="a" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div style="border: thin solid #808080; margin-top: 10px;" dir="rtl">
        <h1 id="H1" runat="server" style="border: thin solid #C0C0C0; height: 40px; text-align: right;
            line-height: 45px; color: #FFFFFF; background-color: #4D4D4D; padding-right: 10px;
            margin-bottom: 10px;">
            الطلبات السابقة</h1>
        <div style="border: thin solid #808080; margin-top: 3px; margin-bottom: 10px;" dir="rtl">
            <table width="100%">
                <tr>
                    <td>
                        <div style="width: 100%; text-align: justify;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataKeyNames="OrderNo,Status" ForeColor="Black" Style="text-align: center; color: #FFFFFF;"
                                Width="100%" HorizontalAlign="Center">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="OrderNo" HeaderText="رقم الطلب">
                                        <HeaderStyle ForeColor="White" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Status" HeaderText="status" Visible="False" />
                                    <asp:BoundField DataField="Employee_ID" HeaderText="رقم الموظف">
                                        <HeaderStyle ForeColor="White" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Employee_Name" HeaderText="اسم الموظف">
                                        <ControlStyle Width="75px" />
                                        <HeaderStyle ForeColor="White" />
                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="170px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="stat" HeaderText="الحالة">
                                        <HeaderStyle ForeColor="White" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="OrderDate" HeaderText="التاريخ" DataFormatString="{0:d}">
                                        <HeaderStyle ForeColor="White" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="التفاصيل">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton_Update" runat="server" Height="26px" ImageUrl="~/images/edit1.jpg"
                                                OnClick="ImageButton_Update_Click" Width="26px" />
                                        </ItemTemplate>
                                        <HeaderStyle ForeColor="White" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Height="30px" HorizontalAlign="Center"
                                    VerticalAlign="Middle" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
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
                    <td width="100%">
                        <div style="text-align: center">
                            <asp:Label ID="lblstatus" runat="server"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="updateOrder" runat="server" style="text-align: center; width: 100%;" visible="false">
                            <table cellpadding="2" width="100%">
                                <tr>
                                    <td style="font-weight: bold; text-align: center;">
                                        العهدة
                                    </td>
                                    <td style="border: thin solid #C0C0C0; text-align: right;">
                                        <div id="myChecks" style="text-align: right">
                                            <asp:CheckBoxList ID="chLstCustody" runat="server" CssClass="CheckboxList" Enabled="False">
                                            </asp:CheckBoxList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Button ID="btnReceive" runat="server" Text="استلام" CssClass="button12" OnClick="btnReceive_Click"
                                            ValidationGroup="a" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div style="text-align: center">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
