using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CustodySystem
{
    public partial class Staff : System.Web.UI.MasterPage
    {
        public int EmpNo
        {
            get
            {
                int no = (int)ViewState["EmpNo"];
                if (no > 0)
                    return no;
                else
                    return 0;
            }
            set
            {
                ViewState["EmpNo"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["fullname"] != null)
                {
                    ltrName.Text = (string)Session["fullname"];
                    ltrfullName.Text = (string)Session["fullname"];

                    DataTable dt = (DataTable)Session["EmpData"];
                    if (dt != null)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            EmpNo = int.Parse(row["Employee_ID"].ToString());
                            ltrDept.Text = row["Department"].ToString();
                            ltrJob.Text = row["Job"].ToString();
                            txtPhone.Text = row["Phone_No"].ToString();
                            txtpass.Attributes["value"] = row["password"].ToString();
                            txtconfirm.Attributes["value"] = row["password"].ToString();
                        }
                    }

                }
                else
                    Response.Redirect("Home.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Home.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // update phone and password
            if (cls.GeneralClass.UpdatePasswordPhone(EmpNo, int.Parse(txtPhone.Text), txtpass.Text.Trim()))
                Response.Write("<script> alert('تم تحديث بيانات الموظف بنجاح');</script>");
            else
                Response.Write("<script> alert('حدث خطأ أثناء تحديث البيانات');</script>");
        }
    }
}