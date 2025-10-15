using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Medicine_Ordering.User
{
    public partial class register : System.Web.UI.Page
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
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (btnreg.Text == "Register")
            {
                getcon();
                cmd = new SqlCommand("insert into M_User (FullName, Gender, Email, MobileNo, Password, Address, City, State) " +
                    "Values ('" + txtfnm.Text + "', '" + rdgen.SelectedValue + "', '" + txtem.Text + "', '" + txtmb.Text + "', '" + txtpw.Text + "', '" + txtad.Text + "', '" + txtct.Text + "', '" + txtsct.Text + "')", con);

                i = cmd.ExecuteNonQuery();

                if (i > 0)
                {
                    Response.Write("<script>alert('Register successfully!!!');</script>");
                    Response.Redirect("login.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Register failed!!!');</script>");
                }
            }
        }
    }
}