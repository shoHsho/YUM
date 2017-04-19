using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace CustodySystem.cls
{
    public class PermiClass
    {
        public static SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
/*
        public static Boolean permichange(string id, string pass, ref string access)
        {
            try
            {

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("update Employee set Access='" + accessDropDownList + "',password='" + passText + "' where Employee_ID='" + idText + "'",con;
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    name = dt.Rows[0]["Employee_Name"].ToString();
                    access = dt.Rows[0]["Access"].ToString();
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
        }*/

        public static DataTable GetAllEmpData()
        {
            try
            {
                DataTable dt = new DataTable();
                string sql = "select * from Employee";
                SqlDataAdapter da = new SqlDataAdapter(sql, GeneralClass.con);
                da.Fill(dt);
                int i = 1;
                dt.Columns.Add("index");

                foreach (DataRow row in dt.Rows)
                {
                    row["index"] = i;
                    i = i + 1;

                }
                return dt;

            }
            catch (Exception)
            {

                return null;
            }
        }

        public static DataTable GetEmpDataByName(string name)
        {
            try
            {
                DataTable dt = new DataTable();
                string sql = "select * from Employee where Employee_Name like N'%"+name+"%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, GeneralClass.con);
                da.Fill(dt);
                int i = 1;
                dt.Columns.Add("index");

                foreach (DataRow row in dt.Rows)
                {
                    row["index"] = i;
                    i = i + 1;

                }
                return dt;

            }
            catch (Exception)
            {

                return null;
            }
        }

        public static DataTable GetEmpDataByID(int id)
        {
            try
            {
                DataTable dt = new DataTable();
                string sql = "select * from Employee where Employee_ID = " + id + "";
                SqlDataAdapter da = new SqlDataAdapter(sql, GeneralClass.con);
                da.Fill(dt);
               
                return dt;

            }
            catch (Exception)
            {

                return null;
            }
        }

        public static Boolean UpdatePermission(int id,string permission)
        {
            try
            {
                DataTable dt = new DataTable();
                string sql = "select * from Employee where Employee_ID = " + id + "";
                SqlDataAdapter da = new SqlDataAdapter(sql, GeneralClass.con);
                da.Fill(dt);
               
                foreach (DataRow row in dt.Rows)
                {
                    row["Access"] = permission;
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