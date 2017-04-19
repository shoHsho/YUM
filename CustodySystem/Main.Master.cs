using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CustodySystem
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string access="";
                string name="";
                int EmpID = 0;
                DataTable dtEmp=null;
                if (cls.GeneralClass.checkuser(txtuser.Text.Trim(), txtpass.Text.Trim(), ref name, ref access, ref EmpID, ref dtEmp) == true)
                {
                    
                    Session["fullname"] = name;
                    Session["EmpID"] = EmpID;
                    Session["EmpData"] = dtEmp;
                    if (access == "Staff")
                        Response.Redirect("StaffHome.aspx");
                    else if (access == "Admin")
                        Response.Redirect("AdminHome.aspx");
                    else if (access == "Employee")
                        Response.Redirect("EmpHome.aspx");
                    else if (access == "Suspend")
                        Response.Write("<script> alert('المستخدم مطرود');</script>");
                }
                else
                    Response.Write("<script> alert('خطأ في اسم المستخدم او كلمة المرور'); </script>");
            }
            catch (Exception)
            {
                
                
            }
        }

        protected void create_Click(object sender, EventArgs e)
        {

        }

      
    }
}