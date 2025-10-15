using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Medicine_Ordering.Shop
{
    public partial class medicines : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm;

        PagedDataSource pg;
        int row, p;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (!IsPostBack)
            {
                ViewState["pid"] = 0;
            }
            //fillcombo();
            filllist();
            if (Session["User"] != null)
            {
                getcon();
                ds = new DataSet();
                da = new SqlDataAdapter("SELECT * FROM M_User WHERE Email = '" + Session["User"] + "'", con);

                da.Fill(ds);
                int uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                String s = ds.Tables[0].Rows[0][1].ToString();
                //Label3.Text = "Welcome:" + s;
            }
            else
            {
                Response.Redirect("../User/login.aspx");

            }

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void dlMedicines_ItemCommand(object source, DataListCommandEventArgs e) // datalist
        {
            if (e.CommandName == "cmd_view")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("ViewDetails.aspx?id=" + id);
            }
            else if (e.CommandName == "cmd_add")
            {
                da = new SqlDataAdapter("SELECT * FROM M_User WHERE Email = '" + Session["User"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

                int prodid = Convert.ToInt32(e.CommandArgument);

                da = new SqlDataAdapter("SELECT * FROM Medicines_Admin_tbl  WHERE Id = '" + prodid + "'", con);
                ds = new DataSet();
                da.Fill(ds);


                string prdnm = ds.Tables[0].Rows[0]["Name"].ToString();
                decimal prdprc = Convert.ToDecimal(ds.Tables[0].Rows[0]["Price"]);
                string img = ds.Tables[0].Rows[0]["Image"].ToString();
                int Stock = 1;

                cmd = new SqlCommand("INSERT INTO Cart_tbl (user_cart_id, prod_cart_id, Name, Price, Stock, Image) " +
                         "VALUES ('" + userid + "', '" + prodid + "', '" + prdnm + "', '" + prdprc + "', '" + Stock + "', '" + img + "')", con);

                cmd.ExecuteNonQuery();

            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)//previous
        {
            LinkButton2.Enabled = true;

            p -= Convert.ToInt32(ViewState["id"]) - 1;

            ViewState["id"] = Convert.ToInt32(p);

            int temp = row / pg.PageSize;
            if (p == temp)
            {
                LinkButton1.Enabled = false;
            }

            //int CurrentPage = Convert.ToInt32(ViewState["id"]);
            //CurrentPage--;
            //ViewState["id"] = CurrentPage;
            filllist();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)//next
        {
            LinkButton1.Enabled = true;
            p += Convert.ToInt32(ViewState["id"]) + 1;

            ViewState["id"] = Convert.ToInt32(p);

            int temp = row / pg.PageSize;
            if (p == temp)
            {
                LinkButton2.Enabled = false;
            }
            //int CurrentPage = Convert.ToInt32(ViewState["id"]);
            //CurrentPage++;
            //ViewState["id"] = CurrentPage;
            //filllist();
            filllist();
        }

        void filllist()
        {
            getcon();
            da = new SqlDataAdapter("select * from Medicines_Admin_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();

            pg.AllowPaging = true;
            pg.PageSize = 3;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["id"]);

            //LinkButton1.Enabled = !pg.IsFirstPage;
            //LinkButton2.Enabled = !pg.IsLastPage;

            pg.DataSource = ds.Tables[0].DefaultView;
            dlMedicines.DataSource = pg;
            dlMedicines.DataBind();

        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("cart.aspx");

        //}

        //protected void Button1_Click1(object sender, EventArgs e)
        //{

        //}


        //protected void Button1_Click1(object sender, EventArgs e)
        //{
        //    Response.Redirect("cart.aspx");
        //}

        protected void btnviewcart_Click(object sender, EventArgs e)
        {
            Response.Redirect("../shop/cart.aspx");
        }
    }
}
