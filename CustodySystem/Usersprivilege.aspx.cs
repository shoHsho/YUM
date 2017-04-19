using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CustodySystem
{
    public partial class Usersprivilege : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displayEmployees();
            }
           
        }
        void displayEmployees()
        {
            lblstatus.Text = "";
            DataTable dt = cls.PermiClass.GetAllEmpData();
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
                lblstatus.Text = "لا يوجد موظفين";
        }
        void displayEmployeesByName()
        {
            lblstatus.Text = "";
            DataTable dt = cls.PermiClass.GetEmpDataByName(txtname.Text.Trim());
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
                lblstatus.Text = "لا يوجد موظفين";
        }
        protected void ImageButton_Update_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                ImageButton btn = (ImageButton)sender;
                GridViewRow gvr = (GridViewRow)btn.NamingContainer;

                int rowindex = gvr.RowIndex;
                int EmpID = int.Parse(GridView1.DataKeys[rowindex][0].ToString());
                Response.Redirect("UpdatePermision.aspx?id=" + EmpID + "");

            }
            catch (Exception ex)
            {
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            displayEmployeesByName();
        } 
    }
}