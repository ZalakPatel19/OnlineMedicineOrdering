using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Online_Medicine_Ordering.Admin.AdminPanel
{
    public partial class medicines : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (!IsPostBack)
            {
                fillcombo();
                fillgrid();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void clear()
        {
            txtMedicineName.Text = "";
            txtDescription.Text = "";
            txtPrice.Text = "";
            txtStock.Text = "";
            txtExpiry.Text = "";
        }
        void imgupload()
        {
            if (fldimg.HasFile)
            {
                fnm = "..//images/" + fldimg.FileName;
                fldimg.SaveAs(Server.MapPath(fnm));
            }
        }

        void fillcombo()
        {
            getcon();
            da = new SqlDataAdapter("select Id, MEdicineType  from Add_Cate", con);
            ds = new DataSet();
            da.Fill(ds);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ddlCategory.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }

        }
        void fillgrid()//gridview
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Medicines_Admin_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save Medicine")
            {
                getcon();
                imgupload();
                cmd = new SqlCommand("INSERT INTO Medicines_Admin_tbl (CategoryId, Name, Description, Price, Stock, ExpiryDate, Status, Image) VALUES('" + ddlCategory.SelectedIndex + "', '" + txtMedicineName.Text + "', '" + txtDescription.Text + "', '" + txtPrice.Text + "', '" + txtStock.Text + "', '" + txtExpiry.Text + "', '" + ddlStatus.SelectedIndex + "', '" + fnm + "')", con);
                cmd.ExecuteNonQuery();
                clear();
                //Response.Redirect(Request.RawUrl);
            }
            else
            {
                getcon();
                SqlCommand cmd = new SqlCommand("UPDATE Medicines_tbl SET " +
                 "Name='" + txtMedicineName.Text + "', " +
                 "Description='" + txtDescription.Text + "', " +
                 "Price='" + txtPrice.Text + "', " +
                 "Stock='" + txtStock.Text + "' " +
                 "ExpiryDate='" + txtExpiry.Text + "' " +
                 "Status='" + ddlStatus.Text + "' " +
                 "WHERE Id='" + ViewState["id"] + "'", con);
                cmd.ExecuteNonQuery();
                clear();
                fillgrid();
                btnSave.Text = "Save Medicine";
            }

        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select Id from Add_Cate where MedicineType='" + ddlCategory.SelectedItem.Text + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            ViewState["id"] = ds.Tables[0].Rows[0][0].ToString();
        }
        void select()//gridview
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Medicines_Admin_tbl WHERE Id='" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            txtMedicineName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            //ddlCategory.SelectedValue = ds.Tables[0].Rows[0]["CategoryId"].ToString();
            txtPrice.Text = ds.Tables[0].Rows[0]["Price"].ToString();
            txtStock.Text = ds.Tables[0].Rows[0]["Stock"].ToString();
            txtExpiry.Text = ds.Tables[0].Rows[0]["ExpiryDate"].ToString();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                btnSave.Text = "Update";
                //Select();
                select();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                getcon();
                cmd = new SqlCommand("DELETE FROM Medicines_Admin_tbl WHERE Id='" + id + "'", con);
                cmd.ExecuteNonQuery();
                fillgrid();
            }
        }
    }
}