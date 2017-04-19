using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
namespace CustodySystem.cls
{
    public class clscustody
    {
        public static int GetCustodyNo()
        {
            try
            {

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select max(Custody_ID) as NO from Custody ", cls.GeneralClass.con);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["NO"] == DBNull.Value)
                        return 1;
                    else
                        return (int.Parse(dt.Rows[0]["NO"].ToString())) + 1;
                }
                else
                    return 1;
            }
            catch (Exception)
            {

                return -1;
            }
        }
        public static long GetCustodyReceiptNo()
        {
            try
            {

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select max(CustodyReceiptID) as NO from CustodyReceipt ", cls.GeneralClass.con);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["NO"] == DBNull.Value)
                        return 1;
                    else
                        return (int.Parse(dt.Rows[0]["NO"].ToString())) + 1;
                }
                else
                    return 1;
            }
            catch (Exception)
            {

                return -1;
            }
        }
        public static Boolean NewCustody(int cno, string cname, string addDate, int amount, string notes, DataTable SpecDT)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select * from Custody where Custody_ID=0 ", cls.GeneralClass.con);
                da.Fill(dt);
                DataRow dr = dt.NewRow();
                dr["Custody_ID"] = cno;
                dr["Custody_Name"] = cname;
                dr["Added_Date"] = addDate;
                dr["Amount"] = amount;
                dr["Notes"] = notes;
                dt.Rows.Add(dr);
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.InsertCommand = cb.GetInsertCommand();
                da.Update(dt);

                DataTable dt1 = new DataTable();
                SqlDataAdapter da1 = new SqlDataAdapter("select * from Custody_Specification where SpecID=0 ", cls.GeneralClass.con);
                da1.Fill(dt1);
                DataRow dr1;
                foreach (DataRow row in SpecDT.Rows)
                {
                    dr1 = dt1.NewRow();
                    dr1["Specification"] = row["sp"].ToString();
                    dr1["Custody_ID"] = cno;
                    dt1.Rows.Add(dr1);
                }
                SqlCommandBuilder cb1 = new SqlCommandBuilder(da1);
                da1.InsertCommand = cb1.GetInsertCommand();
                da1.Update(dt1);

                DataTable dtStore = new DataTable();
                SqlDataAdapter daStore = new SqlDataAdapter("select * from Store where StoreID=0 ", cls.GeneralClass.con);
                daStore.Fill(dtStore);
                DataRow drStore;
                    drStore = dtStore.NewRow();
                    drStore["Custody_ID"] = cno;
                    drStore["AddDate"] = addDate;
                    drStore["Amount"] = amount;
                    dtStore.Rows.Add(drStore);
                SqlCommandBuilder cbStore = new SqlCommandBuilder(daStore);
                daStore.InsertCommand = cbStore.GetInsertCommand();
                daStore.Update(dtStore);
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public static DataTable GetAllJobs()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select distinct Job from Employee ", cls.GeneralClass.con);
                da.Fill(dt);

                return dt;
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static DataTable GetAllCustody()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select Custody_ID,Custody_Name from Custody ", cls.GeneralClass.con);
                da.Fill(dt);

                return dt;
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static Boolean JobCustodies( string job, int[] custNo)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select * from JobCustodies where id=0 ", cls.GeneralClass.con);
                da.Fill(dt);
                DataRow dr ;
                for (int i = 0; i < custNo.Length; i++)
                {
                    dr = dt.NewRow();
                    dr["Custody_ID"] = custNo[i];
                    dr["job"] = job;
                    dt.Rows.Add(dr);

                }

                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.InsertCommand = cb.GetInsertCommand();
                da.Update(dt);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        public static Boolean checkJobCustody(string job)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select * from JobCustodies where job='"+ job +"' ", cls.GeneralClass.con);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    return true;
                }

                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static Boolean checkCustodyReceipt(long OrderNo)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select * from CustodyReceiptDetails where OrderNo=" + OrderNo + " ", cls.GeneralClass.con);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    return true;
                }

                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public static DataTable GetJobCustody(string job)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(@"SELECT        dbo.JobCustodies.job, dbo.Custody.Custody_Name, dbo.JobCustodies.Custody_ID
FROM            dbo.Custody INNER JOIN
                         dbo.JobCustodies ON dbo.Custody.Custody_ID = dbo.JobCustodies.Custody_ID where job='" + job + "' ", cls.GeneralClass.con);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    return dt;
                }

                return null;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static Boolean NewOrder(long No,string dat,int empNo, int[] custNo)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select * from [Order] where OrderNo=0 ", cls.GeneralClass.con);
                da.Fill(dt);
                DataRow dr = dt.NewRow();
                dr["OrderNo"] = No;
                dr["Employee_ID"] = empNo;
                dr["OrderDate"] = dat;
                dr["Status"] = 0;
                 dt.Rows.Add(dr);
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.InsertCommand = cb.GetInsertCommand();
                da.Update(dt);

                DataTable dt1 = new DataTable();
                SqlDataAdapter da1 = new SqlDataAdapter("select * from Orderdetails where OrderDetails_ID=0 ", cls.GeneralClass.con);
                da1.Fill(dt1);
                DataRow dr1;
                for (int i = 0; i < custNo.Length; i++)
                {
                    dr1 = dt1.NewRow();
                    dr1["Custody_ID"] = custNo[i];
                    dr1["OrderNo"] = No;
                    dt1.Rows.Add(dr1);

                }

                SqlCommandBuilder cb1 = new SqlCommandBuilder(da1);
                da1.InsertCommand = cb1.GetInsertCommand();
                da1.Update(dt1);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public static DataTable GetOrderUnderProcess()
        {
            try
            {
                DataTable dt = new DataTable();
                string sql = @"SELECT        dbo.[Order].OrderNo, dbo.[Order].Employee_ID, dbo.[Order].OrderDate, dbo.[Order].Status, dbo.Employee.Employee_Name, dbo.Employee.Job
FROM            dbo.Employee INNER JOIN
                         dbo.[Order] ON dbo.Employee.Employee_ID = dbo.[Order].Employee_ID where Status=0";
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

        public static DataTable GetMyOrders(int empno)
        {
            try
            {
                DataTable dt = new DataTable();
                string sql = @"SELECT        dbo.[Order].OrderNo, dbo.[Order].Employee_ID, dbo.[Order].OrderDate, dbo.[Order].Status, dbo.Employee.Employee_Name, dbo.Employee.Job
FROM            dbo.Employee INNER JOIN
                         dbo.[Order] ON dbo.Employee.Employee_ID = dbo.[Order].Employee_ID where dbo.[Order].Employee_ID="+ empno +"";
                SqlDataAdapter da = new SqlDataAdapter(sql, GeneralClass.con);
                da.Fill(dt);
               
                dt.Columns.Add("stat");

                foreach (DataRow row in dt.Rows)
                {
                    if (Byte.Parse(row["Status"].ToString()) == 0)
                        row["stat"] = "تحت الإجراء";
                    else if (Byte.Parse(row["Status"].ToString()) == 1)
                        row["stat"] = "مقبول";
                    else
                        row["stat"] = "مرفوض";

                }
                return dt;

            }
            catch (Exception)
            {

                return null;
            }
        }
        public static DataTable GetOrdereject()
        {
            try
            {
                DataTable dt = new DataTable();
                string sql = @"SELECT        dbo.[Order].OrderNo, dbo.[Order].Employee_ID, dbo.[Order].OrderDate, dbo.[Order].Status, dbo.Employee.Employee_Name, dbo.Employee.Job
FROM            dbo.Employee INNER JOIN
                         dbo.[Order] ON dbo.Employee.Employee_ID = dbo.[Order].Employee_ID where Status=2";
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
        public static DataTable GetOrderAccept()
        {
            try
            {
                DataTable dt = new DataTable();
                string sql = @"SELECT        dbo.[Order].OrderNo, dbo.[Order].Employee_ID, dbo.[Order].OrderDate, dbo.[Order].Status, dbo.Employee.Employee_Name, dbo.Employee.Job
FROM            dbo.Employee INNER JOIN
                         dbo.[Order] ON dbo.Employee.Employee_ID = dbo.[Order].Employee_ID where Status=1";
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
        public static int GetOrderNo()
        {
            try
            {

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select max(OrderNo) as NO from [Order] ", cls.GeneralClass.con);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["NO"] == DBNull.Value)
                        return 1;
                    else
                        return (int.Parse(dt.Rows[0]["NO"].ToString())) + 1;
                }
                else
                    return 1;
            }
            catch (Exception)
            {

                return -1;
            }
        }

        public static DataTable GetOrderDetails(long orderNo )
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(@"SELECT        dbo.Orderdetails.Custody_ID, dbo.Custody.Custody_Name
FROM            dbo.Custody INNER JOIN
                         dbo.Orderdetails ON dbo.Custody.Custody_ID = dbo.Orderdetails.Custody_ID where  OrderNo=" + orderNo  + "", cls.GeneralClass.con);
                da.Fill(dt);
                return dt;
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static Boolean UpdateOrder(long OrderNo, byte status,int StaffNo)
        {
            try
            {
                DataTable dt = new DataTable();
                string sql = "select * from [Order] where OrderNo = " + OrderNo + "";
                SqlDataAdapter da = new SqlDataAdapter(sql, GeneralClass.con);
                da.Fill(dt);

                foreach (DataRow row in dt.Rows)
                {
                    row["Status"] = status;
                    row["StaffNo"] = StaffNo;
                    row["ReplyDate"] = DateTime.Now.ToString("dd/MM/yyyy");
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

        public static Boolean NewCustodyReceipt(long CustodyReceiptID, long OrderNo, int empNo, int[] custNo)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select * from CustodyReceipt where CustodyReceiptID=0 ", cls.GeneralClass.con);
                da.Fill(dt);
                DataRow dr = dt.NewRow();
                dr["CustodyReceiptID"] = CustodyReceiptID;
                dr["OrderNo"] = OrderNo;
                dr["Employee_ID"] = empNo;
                dr["ReceiptDate"] = DateTime.Now.ToString("dd/MM/yyyy");
                dt.Rows.Add(dr);
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.InsertCommand = cb.GetInsertCommand();
                da.Update(dt);

                DataTable dt1 = new DataTable();
                SqlDataAdapter da1 = new SqlDataAdapter("select * from CustodyReceiptDetails where CustRecDetailsNO=0 ", cls.GeneralClass.con);
                da1.Fill(dt1);
                DataRow dr1;
                for (int i = 0; i < custNo.Length; i++)
                {
                    dr1 = dt1.NewRow();
                    dr1["Custody_ID"] = custNo[i];
                    dr1["CustodyReceiptID"] = CustodyReceiptID;
                    dr1["Amount"] = 1;
                    dr1["OrderNo"] = OrderNo;
                    dt1.Rows.Add(dr1);

                }

                SqlCommandBuilder cb1 = new SqlCommandBuilder(da1);
                da1.InsertCommand = cb1.GetInsertCommand();
                da1.Update(dt1);

                DataTable dtStore = new DataTable();
                SqlDataAdapter daStore = new SqlDataAdapter("select * from Store where StoreID=0 ", cls.GeneralClass.con);
                daStore.Fill(dtStore);
                DataRow drStore;
                for (int i = 0; i < custNo.Length; i++)
                {
                    drStore = dtStore.NewRow();
                    drStore["Custody_ID"] = custNo[i];
                    drStore["AddDate"] = DateTime.Now.ToString("dd/MM/yyyy");
                    drStore["Amount"] = -1;
                    drStore["CustodyReceiptID"] = CustodyReceiptID;
                    dtStore.Rows.Add(drStore);
                }
              
                SqlCommandBuilder cbStore = new SqlCommandBuilder(daStore);
                daStore.InsertCommand = cbStore.GetInsertCommand();
                daStore.Update(dtStore);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}