using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace CustodySystem
{
    public partial class AdminHome : System.Web.UI.Page
    {
        public static SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

        protected void permisbmt_Click(object sender, EventArgs e)
        {


           /** con.Open();

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update Employee set Access='" + accessDropDownList + "',password='" + passText + "' where Employee_ID='" + idText + "'";
            cmd.ExecuteNonQuery();

            con.Close();*/
        }

        protected void viewB_Click(object sender, EventArgs e)
        {
           /* con.Open();

            SqlDataAdapter sda = new SqlDataAdapter("select * from Employee", con);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridViewEmp.DataSource = data;
            con.Close();*/
        }



    }
}