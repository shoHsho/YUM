using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CustodySystem
{
    public partial class UpdatePermision : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (IsPostBack == false)
                {
                    EmpNo = int.Parse(Request.QueryString["id"]);
                    getUserData();
                }

            }
            catch (Exception)
            {


            }
        }
        void getUserData()
        {
            DataTable dt = cls.PermiClass.GetEmpDataByID(EmpNo);
            foreach (DataRow row in dt.Rows)
            {
                txtNo.Text = row["Employee_ID"].ToString();
                txtPhone.Text = row["Phone_No"].ToString();
                txtname.Text = row["Employee_Name"].ToString();
                txtDepartment.Text = row["Department"].ToString();
                txtJob.Text = row["Job"].ToString();
                ddlPermission.Text = row["Access"].ToString().Trim();
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usersprivilege.aspx");
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            if (cls.PermiClass.UpdatePermission(EmpNo, ddlPermission.SelectedValue.ToString().Trim()))
                Response.Write("<script> alert('تم تحديث الصلاحية للموظف')</script>");
            else
                Response.Write("<script> alert('حدث خطأ أثناء تحديث الصلاحية للموظف')</script>");

        }
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
    }
}