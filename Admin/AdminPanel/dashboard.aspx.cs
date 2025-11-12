using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Online_Medicine_Ordering.Admin.AdminPanel
{
    public partial class dashboard : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardStats();
            }
            getcon();
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void LoadDashboardStats()
        {
            getcon();

            // Total Medicines (Category count)
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Add_Cate", con);
            lblMedicineName.Text = cmd.ExecuteScalar().ToString();

            // Total Orders
            cmd = new SqlCommand("SELECT COUNT(*) FROM order_tbl", con);
            lblTotalOrders.Text = cmd.ExecuteScalar().ToString();

            // Total Users
            cmd = new SqlCommand("SELECT COUNT(*) FROM M_User", con);
            lblTotalUsers.Text = cmd.ExecuteScalar().ToString();

            // Total Revenue
            cmd = new SqlCommand("SELECT ISNULL(SUM(Total_Amount),0) FROM order_tbl", con);
            lblTotalRevenue.Text = cmd.ExecuteScalar().ToString();
        }

    }
}
