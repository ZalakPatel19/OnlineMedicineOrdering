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
    public partial class register_admin : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "Register")
            {
                getcon();
                cmd = new SqlCommand("insert into M_Admin(FullName,Email,MobileNo,Password) values ('" + txtfnm.Text + "','" + txtem.Text + "','" + txtmb.Text + "','"+txtpw.Text+"')", con);

                i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Write("<script>alert('Register successfully!!!')</script>");
                    Response.Redirect("Login_Admin.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Register failed!!!')</script>");
                }
            }
        }
    }
}