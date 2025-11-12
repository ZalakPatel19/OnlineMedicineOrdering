using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Medicine_Ordering.Admin.AdminPanel
{
    public partial class orders : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;
        protected void Page_Load(object sender, EventArgs e)
        {

            getcon();
            if (!IsPostBack)
            {
                fillgrid();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();

        }
        private void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM order_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}