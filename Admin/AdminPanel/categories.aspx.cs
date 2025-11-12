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
    public partial class categories : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        int i;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }

        }
        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtmct.Text.Trim() == "")
                return;

            getcon();
            string categoryName = txtmct.Text.Trim();

            if (ViewState["EditingCategoryId"] != null)
            {
                int id = Convert.ToInt32(ViewState["EditingCategoryId"]);
                cmd = new SqlCommand("UPDATE Add_Cate SET MedicineType='" + categoryName + "' WHERE Id=" + id, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                ViewState["EditingCategoryId"] = null;
            }
            else
            {
                cmd = new SqlCommand("INSERT INTO Add_Cate(MedicineType)" + " VALUES('" + categoryName + "')", con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
            }

            txtmct.Text = "";
            BindGrid();
        }

        void BindGrid()
        {
            getcon();
            cmd = new SqlCommand("SELECT Id, MedicineType AS CategoryName FROM Add_Cate", con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            getcon();
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "cmd_dlt")
            {
                cmd = new SqlCommand("DELETE FROM Add_Cate WHERE Id=" + id, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
            }
            else if (e.CommandName == "cmd_edt")
            {
                cmd = new SqlCommand("SELECT * FROM Add_Cate WHERE Id=" + id, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtmct.Text = ds.Tables[0].Rows[0]["MedicineType"].ToString();
                    ViewState["EditingCategoryId"] = id;
                }
            }

            BindGrid();

        }
    }
}