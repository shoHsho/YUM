using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CustodySystem
{
    public partial class Order : System.Web.UI.Page
    {
        static int empID = 0;
        static long OrderNo = 0;
        static string job = null;
        static byte status = 0;
        static long CustodyReceiptNo = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = (DataTable)Session["EmpData"];
                if (dt != null)
                {
                    empID = int.Parse(dt.Rows[0]["Employee_ID"].ToString());
                    job = dt.Rows[0]["Job"].ToString();
                    txtaddDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    txtNo.Text = cls.clscustody.GetOrderNo().ToString();
                    DataTable dtCustody = cls.clscustody.GetJobCustody(dt.Rows[0]["Job"].ToString());
                    if (dtCustody != null)
                    {
                        chLstPrevCustody.DataTextField = "Custody_Name";
                        chLstPrevCustody.DataValueField = "Custody_ID";
                        chLstPrevCustody.DataSource = dtCustody;
                        chLstPrevCustody.DataBind();
                    }
                    else
                    {
                        chLstPrevCustody.DataSource = null;

                        chLstPrevCustody.Items.Clear();
                        //chLstPrevCustody.DataTextField = "";
                        //chLstPrevCustody.DataValueField = "";
                        //chLstPrevCustody.DataSource = dtCustody;
                        chLstPrevCustody.DataBind();

                    }
                }
                displayMyOrder();
            }
        }
        void displayMyOrder()
        {
            lblstatus.Text = "";
            updateOrder.Visible = false;
            DataTable dt = cls.clscustody.GetMyOrders(empID);
            if (dt!= null)
            {
                  
                GridView1.DataSource = dt;
                GridView1.DataBind();
              if(dt.Rows.Count==0)
              {
                  lblstatus.Text = "لا يوجد طلبات عهدة للموظف";
                  updateOrder.Visible = false;
              }
                //updateOrder.Visible = true;
            }
            else
            {
                lblstatus.Text = "لا يوجد طلبات عهدة للموظف";
                updateOrder.Visible = false;
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int[] arr = new int[chLstPrevCustody.Items.Count];
            int i = 0;
            foreach (ListItem item in chLstPrevCustody.Items)
            {
                if (item.Selected)
                {
                    string selectedValue = item.Value;
                    arr[i] = int.Parse(item.Value);
                    i++;
                }
            }

            if (arr.Length == 0)
            {
                Response.Write("<script> alert('لا يوجد عهدة للوظيفة المختارة');</script>");
                return;
            }
            if (cls.clscustody.NewOrder(long.Parse(txtNo.Text), txtaddDate.Text.Trim(), empID, arr))
            {
                Response.Write("<script> alert('تم ارسال الطلب بنجاح');</script>");
            }
            else
                Response.Write("<script> alert('خطأ ، لم يتم ارسال الطلب');</script>");
        }

        protected void ImageButton_Update_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                ImageButton btn = (ImageButton)sender;
                GridViewRow gvr = (GridViewRow)btn.NamingContainer;

                int rowindex = gvr.RowIndex;
                OrderNo = long.Parse(GridView1.DataKeys[rowindex][0].ToString());
                status = byte.Parse(GridView1.DataKeys[rowindex][1].ToString());
                DataTable dt = cls.clscustody.GetOrderDetails(OrderNo);
                if(dt!=null)
                {
                chLstCustody.DataTextField = "Custody_Name";
                chLstCustody.DataValueField = "Custody_ID";
                chLstCustody.DataSource = dt;
                chLstCustody.DataBind();

                for (int i = 0; i < chLstCustody.Items.Count; i++)
                {
                    chLstCustody.Items[i].Selected = true;
                }
                updateOrder.Visible = true;
                CustodyReceiptNo = cls.clscustody.GetCustodyReceiptNo();
            }
                else
                    updateOrder.Visible = false;
            }
            catch (Exception ex)
            {
            }
        }

        protected void btnReceive_Click(object sender, EventArgs e)
        {
            // if status for order is accept
            if (status == 1)
            {
                int[] arr = new int[chLstCustody.Items.Count];
                int i = 0;
                foreach (ListItem item in chLstCustody.Items)
                {
                    if (item.Selected)
                    {
                        string selectedValue = item.Value;
                        arr[i] = int.Parse(item.Value);
                        i++;
                    }
                }

                if (arr.Length == 0)
                {
                    Response.Write("<script> alert('لا يوجد عهدة ');</script>");
                    return;
                }

                if (cls.clscustody.checkCustodyReceipt(OrderNo))
                {
                    Response.Write("<script> alert('هذا الطلب تم استلامه من قبل');</script>");
                    return;
                }
                if (cls.clscustody.NewCustodyReceipt(CustodyReceiptNo, OrderNo, empID, arr))
                    Response.Write("<script> alert('تم الاستلام بنجاح')</script>");
                else
                    Response.Write("<script> alert('حدث خطأ أثناء الاستلام')</script>");
            }
            
        }
    }
}