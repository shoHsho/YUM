using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CustodySystem
{
    public partial class NewCustody : System.Web.UI.Page
    {
        DataTable dt;
        int indx;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtaddDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                txtid.Text = cls.clscustody.GetCustodyNo().ToString();
                dt = new DataTable();
              
                MakeDataTable();
                DataRow dr = dt.NewRow();
                dr["index"] = "1";
                dt.Rows.Add(dr);
                BindGrid();
            }
            else
            {

                dt = (DataTable)ViewState["DataTable"];
                indx = (int)ViewState["indx"];
            }
            ViewState["DataTable"] = dt;
            ViewState["indx"] = indx;
           
        }
        private void MakeDataTable()
        {
            dt.Columns.Add("sp");
            dt.Columns.Add("index");
          
        }

        private void AddToDataTable()
        {
            DataRow dr = dt.NewRow();
            dr["sp"] = "";
            dr["index"] = (indx+1).ToString();
            dt.Rows.Add(dr);
        }

        private void BindGrid()
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnPlus_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    if ((GridView1.Rows[i].FindControl("txtsp") as TextBox).Text.Length > 0 )
                    {
                        dt.Rows[i][0] = (GridView1.Rows[i].FindControl("txtsp") as TextBox).Text;
                        dt.Rows[i][1] = i+1;
                        indx=i+1;
                    }
                }
               
                AddToDataTable();
                BindGrid();
            }
            catch (Exception)
            {
                
                
            }
          
        }

        protected void btnMinus_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    if ((GridView1.Rows[i].FindControl("txtsp") as TextBox).Text.Length > 0)
                    {
                        dt.Rows[i][0] = (GridView1.Rows[i].FindControl("txtsp") as TextBox).Text;
                        dt.Rows[i][1] = i + 1;
                    }
                    else
                    {
                        dt.Rows.RemoveAt(i);
                       
                    }
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

            catch (Exception)
            {


            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            try
            {
                  dt.Rows.Clear();
                  DataRow dr;
                 
                 for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    if ((GridView1.Rows[i].FindControl("txtsp") as TextBox).Text.Length > 0 )
                    {
                        dr = dt.NewRow();
                        dr["sp"] =(GridView1.Rows[i].FindControl("txtsp") as TextBox).Text;
                        dt.Rows.Add(dr);
                    }
                }
                 if (dt.Rows.Count > 0)
                 {
                     if (cls.clscustody.NewCustody(int.Parse(txtid.Text), txtcname.Text.Trim(), txtaddDate.Text.Trim(), int.Parse(txtqty.Text), txtNotes.Text.Trim(), dt))
                     {
                         Response.Write("<script> alert('تم تسجيل العهدة بنجاح');</script>");
                         Response.Redirect(Request.RawUrl);
                     }
                     else
                         Response.Write("<script> alert('خطأ ، لم تتم اضافة العهدة');</script>");
                 }
                 else
                     Response.Write("<script> alert('لا يمكن حفظ العهدة بدون مواصفات');</script>");

            }
            catch (Exception)
            {
                
               
            }
           
        }

       

        protected void BtnDelete_Click1(object sender, EventArgs e)
        {
            SqlDataSource1.Delete();
        }

       

       
    }
}