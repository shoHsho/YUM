using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CustodySystem
{
    public partial class StaffOrders : System.Web.UI.Page
    {
        static long OrderNo = 0;
        static int StaffNo = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 DataTable dt = (DataTable)Session["EmpData"];
                 if (dt != null)
                 {
                     StaffNo = int.Parse(dt.Rows[0]["Employee_ID"].ToString());
                 }
                displayOrderunderProcess();
                displayOrderAccept();
                displayOrderReject();
            }
        }
        void displayOrderunderProcess()
        {
            lblstatus.Text = "";
            updateOrder.Visible = false;
            DataTable dt = cls.clscustody.GetOrderUnderProcess();
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                updateOrder.Visible = true;
            }
            else
            {
                lblstatus.Text = "لا يوجد طلبات تحت الإجراء";
                updateOrder.Visible = false;
            }
        }
        void displayOrderAccept()
        {
            lblaccept.Text = "";
            DataTable dt = cls.clscustody.GetOrderAccept();
            if (dt.Rows.Count > 0)
            {
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            else
                lblaccept.Text = "لا يوجد طلبات تمت الموافقة عليها";
        }

        void displayOrderReject()
        {
            lblreject.Text = "";
            DataTable dt = cls.clscustody.GetOrdereject();
            if (dt.Rows.Count > 0)
            {
                GridView3.DataSource = dt;
                GridView3.DataBind();
            }
            else
                lblreject.Text = "لا يوجد طلبات مرفوضة";
        }
        protected void ImageButton_Update_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                ImageButton btn = (ImageButton)sender;
                GridViewRow gvr = (GridViewRow)btn.NamingContainer;

                int rowindex = gvr.RowIndex;
                OrderNo = long.Parse(GridView1.DataKeys[rowindex][0].ToString());
                ddlstatus.SelectedIndex=0;
                DataTable dt = cls.clscustody.GetOrderDetails(OrderNo);
                chLstCustody.DataTextField = "Custody_Name";
                chLstCustody.DataValueField = "Custody_ID";
                chLstCustody.DataSource = dt;
                chLstCustody.DataBind();

                for (int i = 0; i < chLstCustody.Items.Count; i++)
                {
                    chLstCustody.Items[i].Selected = true;
                }

            }
            catch (Exception ex)
            {
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // send
            if (ddlstatus.SelectedIndex > 0)
            {
                if (cls.clscustody.UpdateOrder(OrderNo, byte.Parse(ddlstatus.SelectedIndex.ToString()), StaffNo))
                    Response.Write("<script> alert('تم ارسال الطلب بنجاح')</script>");
            }
            else
                Response.Write("<script> alert('لا يمكن ارسال الطلب بدون تغيير الحالة')</script>");
        }
    }
}