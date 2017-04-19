using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace CustodySystem.cls
{
    public class GeneralClass
    {
       public static SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        public static Boolean checkuser(string userName, string password, ref string name,ref string access,ref int empid,ref DataTable dtEmp)
        {
            try
            {

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select * from Employee where Employee_ID='"+ userName +"' and password='"+ password +"' ", con);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    name=dt.Rows[0]["Employee_Name"].ToString();
                    access =dt.Rows[0]["Access"].ToString();
                    empid = int.Parse(dt.Rows[0]["Employee_ID"].ToString());
                    dtEmp = dt;
                    return true;
                }
                else
                    return false;
            }
            catch (Exception)
            {
               // System.Web.HttpContext.Current.Response.Write("<script> alert('خطأ في الاتصال بقاعدة البيانات'); </script>");
                return false;
            }
        }

        public static Boolean UpdatePasswordPhone(int id, int phone,string password)
        {
            try
            {
                DataTable dt = new DataTable();
                string sql = "select * from Employee where Employee_ID = " + id + "";
                SqlDataAdapter da = new SqlDataAdapter(sql, GeneralClass.con);
                da.Fill(dt);

                foreach (DataRow row in dt.Rows)
                {
                    row["Phone_No"] = phone;
                    row["password"] = password;
                }

                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.UpdateCommand = cb.GetUpdateCommand();
                da.Update(dt);
                return true;

            }
            catch (Exception)
            {

                return false;
            }
        }
    }
}