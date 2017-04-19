using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CustodySystem
{
    public partial class JobCustodies : System.Web.UI.Page
    {
        DataTable dt, dtcust;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                dt = cls.clscustody.GetAllJobs();
                ddljobs.DataTextField = "job";
                ddljobs.DataValueField = "job";
                ddljobs.DataSource = dt;
                ddljobs.DataBind();


                bindcheckListBox();
            }


        }

        void bindcheckListBox()
        {
            dtcust = cls.clscustody.GetAllCustody();
            chLstCustody.DataTextField = "Custody_Name";
            chLstCustody.DataValueField = "Custody_ID";
            chLstCustody.DataSource = dtcust;
            chLstCustody.DataBind();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {


            try
            {

                if (cls.clscustody.checkJobCustody(ddljobs.SelectedValue.ToString()))
                {
                    Response.Write("<script> alert('تم ربط هذه الوظيفة بالعهدة من قبل');</script>");
                    return;
                }
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
                    Response.Write("<script> alert('لا يوجد عهدة للوظيفة المختارة');</script>");
                    return;
                }
                if (cls.clscustody.JobCustodies(ddljobs.SelectedValue.ToString(), arr))
                {
                    Response.Write("<script> alert('تم حفظ البيانات بنجاح');</script>");
                }
                else
                    Response.Write("<script> alert('خطأ ، لم يتم حفظ البيانات');</script>");


            }
            catch (Exception)
            {


            }

        }

        protected void ddljobs_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            if (ddljobs.SelectedIndex != -1)
            {
                
                DataTable dtCustody = cls.clscustody.GetJobCustody(ddljobs.SelectedValue.ToString().Trim());
                if (dtCustody != null)
                {
                    chLstPrevCustody.DataTextField = "Custody_Name";
                    chLstPrevCustody.DataValueField = "Custody_ID";
                    chLstPrevCustody.DataSource = dtCustody;
                    chLstPrevCustody.DataBind();
                    for (int i = 0; i < chLstCustody.Items.Count; i++)
                    {
                        chLstCustody.Items[i].Selected = true;
                    }
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
        }
    }
}