using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Medicine_Ordering.User
{
    public partial class login : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
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
            if (btnLogin.Text == "Login")
            {
                getcon();
                cmd = new SqlCommand("select count(*) from M_User where Email='" + txtEmail.Text + "' and Password='" + txtPassword.Text + "'", con);
                i = Convert.ToInt32(cmd.ExecuteScalar());

                if (i > 0)
                {
                    Session["User"] = txtEmail.Text;
                    Response.Redirect("~/Shop/medicines.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password!')</script>");
                }
            }
        }
    }
}