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
    public partial class admin_login : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;
        int i;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtem.Text != null && txtpw != null)
            {


                getcon();
                cmd = new SqlCommand("select count(*) from M_Admin where Email = '" + txtem.Text + "' and Password='" + txtpw.Text + "'", con);
                i = Convert.ToInt32(cmd.ExecuteScalar());


                if (i > 0)
                {
                    Session["Admin"] = txtem.Text;
                    Response.Redirect("dashboard.aspx");

                }
                else
                {
                    Response.Write("<script> alrt('Invalid User')</script>");
                }


            }
        }
    }
}
