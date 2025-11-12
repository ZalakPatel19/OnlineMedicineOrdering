using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Online_Medicine_Ordering.Shop
{
    public partial class cheakout : System.Web.UI.Page
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
                fill_grid();
            }
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fill_grid()
        {
            getcon();
            da = new SqlDataAdapter("Select * from M_User where Email ='" + Session["User"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);


                da = new SqlDataAdapter("SELECT *, (Price * Stock) AS Total FROM Cart_tbl WHERE user_cart_id = '" + uid + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                gvCart.DataSource = ds;
                gvCart.DataBind();


                decimal finalTotal = 0;
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (dr["Total"] != DBNull.Value)
                        finalTotal += Convert.ToDecimal(dr["Total"]);

                }
                lblOrderTotal.Text = "Final Total: ₹" + finalTotal.ToString("0.00");

            }
            else
            {
                gvCart.DataSource = null;
                gvCart.DataBind();
                lblOrderTotal.Text = "Final Total = ₹0.00";
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            getcon();

            // 1. Get user ID from registerf
            getcon();
            da = new SqlDataAdapter("Select * from M_User where Email ='" + Session["User"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)

            {

                lblMessage.Text = "User not found.";
                return;

            }

            int uid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            // 2. Get cart items for user

            da = new SqlDataAdapter("SELECT *, (Price * Stock) AS Total FROM Cart_tbl WHERE user_cart_id = '" + uid + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            DataTable cartItems = ds.Tables[0];

            if (cartItems.Rows.Count == 0)
            {
                lblMessage.Text = "Your cart is empty.";
                return;
            }
            // 3. Calculate total amount

            decimal totalAmount = 0;

            foreach (DataRow dr in cartItems.Rows)
            {
                if (dr["Total"] != DBNull.Value)
                    totalAmount += Convert.ToDecimal(dr["Total"]);
            }
            // 4. Insert order_tbl

            string shippingAddress = txtShippingAddress.Text.Trim();

            string paymentMethod = rblPaymentMethod.SelectedValue;

            if (string.IsNullOrEmpty(shippingAddress))
            {
                lblMessage.Text = "Please enter a shipping address.";
                return;
            }

            cmd = new SqlCommand("INSERT INTO order_tbl (user_id, Order_Date, Total_Amount, Order_Status, Shipping_Address, Payment_Method) " +
                                 "VALUES ('" + uid + "', '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', '" + totalAmount +
                                 "', 'Pending', '" + shippingAddress + "', '" + paymentMethod + "'); SELECT SCOPE_IDENTITY();", con);

            int orderId = Convert.ToInt32(cmd.ExecuteScalar());

            // 5. Insert order_items_tbl for each cart item

            foreach (DataRow dr in cartItems.Rows)
            {
                cmd = new SqlCommand("INSERT INTO order_item_tbl (order_id, prod_id,Name, Price,Stock,Image) " +
                 "VALUES ('" + orderId + "', '" + dr["prod_cart_id"] + "', '" + dr["Name"] + "', '" + dr["Price"] +
                 "', '" + dr["Stock"] + "', '" + dr["Image"] + "')", con);

                cmd.ExecuteNonQuery();

            }

            // 6. Clear cart

            cmd = new SqlCommand("DELETE FROM Cart_tbl WHERE user_cart_Id = '" + uid + "'", con);
            cmd.ExecuteNonQuery();

            //con.close();

            lblMessage.Text = "Order placed successfully!";
            gvCart.DataSource = null;
            gvCart.DataBind();
            lblOrderTotal.Text = "";

        }
    }
}