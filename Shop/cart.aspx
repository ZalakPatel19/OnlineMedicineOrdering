<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="Online_Medicine_Ordering.Shop.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart - MediCare</title>
        <style>
            /* ------------ GLOBAL STYLE ------------ */
body {
    margin: 0;
    padding: 0;
    font-family: "Poppins", sans-serif;
    background: #f4f6f9;
}

/* ------------ HEADER NAV ------------- */
.header {
    background: #ffffff;
    padding: 15px 0;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.navbar {
    width: 90%;
    margin: auto;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo {
    font-size: 26px;
    font-weight: 700;
    color: #4e73df;
    text-decoration: none;
}

.nav-links {
    list-style: none;
    display: flex;
    gap: 25px;
}

.nav-links li a {
    text-decoration: none;
    font-size: 16px;
    color: #333;
    font-weight: 500;
}

.nav-links li a:hover {
    color: #4e73df;
}

.user-actions .btn {
    padding: 8px 16px;
    border-radius: 6px;
    text-decoration: none;
    margin-left: 8px;
}

.btn-primary {
    background: #4e73df;
    color: #fff;
}

.btn-secondary {
    background: #6c757d;
    color: #fff;
}

/* -------------- CART TITLE -------------- */
div h3, div h2 {
    font-size: 26px;
    margin-bottom: 10px;
    color: #333;
    font-weight: 700;
}

/* -------------- GRIDVIEW TABLE -------------- */
.medicine-grid {
    width: 95%;
    margin: 20px auto;
    border-collapse: collapse;
    background: #fff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.15);
}

.medicine-grid th {
    background: #4e73df;
    color: #fff;
    padding: 12px;
    font-size: 15px;
    text-align: left;
}

.medicine-grid td {
    padding: 12px;
    font-size: 14px;
    border-bottom: 1px solid #ddd;
}

.medicine-grid tr:hover {
    background: #f1f3ff;
}

.medicine-grid img {
    border-radius: 5px;
}

/* ------------ REMOVE BUTTON ------------ */
a[ID*="btnRemove"], .btn-delete {
    color: red !important;
    font-weight: bold;
    cursor: pointer;
    text-decoration: none;
}

a[ID*="btnRemove"]:hover {
    text-decoration: underline;
}

/* ------------ UPDATE + CHECKOUT BUTTONS ------------ */
#btn_Update, #BtnCheckout {
    padding: 10px 20px;
    border: none;
    background: #4e73df;
    color: #fff;
    margin: 10px 5px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 15px;
}

#BtnCheckout {
    background: #28a745;
}

#btn_Update:hover {
    background: #3e5dc8;
}

#BtnCheckout:hover {
    background: #218838;
}

/* ---------- TOTAL LABEL ---------- */
#lblFinalTotal {
    font-size: 22px;
    color: #1e1e8f;
    display: block;
    margin-top: 10px;
}

/* ------------ FOOTER ------------ */
.footer {
    background-color: #111827;
    color: #fff;
    padding: 2rem 0;
    margin-top: 3rem;
}

.footer .container {
    width: 90%;
    margin: auto;
}

.footer-content {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

.footer-section h3 {
    font-size: 20px;
    margin-bottom: 10px;
}

.footer-section a {
    display: block;
    margin-bottom: 6px;
    color: #cbd5e1;
    text-decoration: none;
}

.footer-section a:hover {
    color: #4e73df;
}

.footer-bottom {
    text-align: center;
    margin-top: 1.5rem;
    font-size: 14px;
}

        </style>
        <link rel="stylesheet" href="../Assets/css/style.css">
        <link rel="icon" href="../Assets/images/favicon.ico" type="image/x-icon">
    </head>
    <body>
        <!-- Header -->
        <header class="header">
            <nav class="navbar">
                <a href="../Home/index.html" class="logo">MediCare</a>
                <ul class="nav-links">
                    <li><a href="../Home/index.aspx">Home</a></li>
                    <li><a href="medicines.aspx">Medicines</a></li>
                    <li><a href="categories.aspx">Categories</a></li>
                    <li><a href="../Home/about.aspx">About</a></li>
                    <li><a href="../Home/contact.aspx">Contact</a></li>
                </ul>
                <div class="user-actions">
                    <a href="../User/login.aspx" class="btn btn-secondary" id="loginBtn">Login</a>
                    <a href="../User/register.aspx" class="btn btn-primary" id="registerBtn">Register</a>
                    <div id="userMenu" style="display: none;"></div>
                    <a href="cart.aspx" class="btn btn-primary">Cart (<span id="cartCount">0</span>)
                    </a>
                </div>
            </nav>
        </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
       <%-- <!-- Page Header -->
    <section class="hero" style="height: 200px;">
        <div class="hero-content">
            <h1>Shopping Cart</h1>
            <p>Review your selected medicines before checkout</p>
        </div>
    </section>

    <!-- Cart Content -->
    <section class="container">
        <div class="grid grid-2" style="margin: 2rem 0; gap: 2rem;">
            <!-- Cart Items -->
            <div>
                <div class="card">
                    <div class="card-content">
                        <h2>Cart Items</h2>
                        <div id="cartItems">
                            <!-- Cart items will be populated by JavaScript -->
                        </div>
                        
                        <!-- Empty Cart Message -->
                        <div id="emptyCartMessage" style="display: none; text-align: center; padding: 3rem;">
                            <h3>Your cart is empty</h3>
                            <p>Add some medicines to get started!</p>
                            <a href="medicines.html" class="btn btn-primary">Browse Medicines</a>
                        </div>
                    </div>
                </div>

                <!-- Continue Shopping -->
                <div class="card" style="margin-top: 1rem;">
                    <div class="card-content text-center">
                        <a href="medicines.html" class="btn btn-secondary">Continue Shopping</a>
                        <button onclick="clearCart()" class="btn btn-danger" style="margin-left: 1rem;">Clear Cart</button>
                    </div>
                </div>
            </div>

            <!-- Order Summary -->
            <div>
                <div class="card">
                    <div class="card-content">
                        <h2>Order Summary</h2>
                        
                        <div id="orderSummary">
                            <div style="display: flex; justify-content: space-between; margin: 1rem 0;">
                                <span>Subtotal:</span>
                                <span id="subtotal">$0.00</span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin: 1rem 0;">
                                <span>Shipping:</span>
                                <span id="shipping">$0.00</span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin: 1rem 0;">
                                <span>Tax:</span>
                                <span id="tax">$0.00</span>
                            </div>
                            <hr style="margin: 1rem 0;">
                            <div style="display: flex; justify-content: space-between; margin: 1rem 0; font-size: 1.2rem; font-weight: bold;">
                                <span>Total:</span>
                                <span id="total">$0.00</span>
                            </div>
                        </div>

                        <div style="margin: 2rem 0;">
                            <a href="checkout.html" class="btn btn-primary" style="width: 100%; padding: 1rem; font-size: 1.1rem;">
                                Proceed to Checkout
                            </a>
                        </div>

                        <!-- Promo Code -->
                        <div style="margin: 2rem 0;">
                            <h3>Promo Code</h3>
                            <div style="display: flex; gap: 0.5rem;">
                                <input type="text" id="promoCode" placeholder="Enter promo code" class="form-control">
                                <button onclick="applyPromoCode()" class="btn btn-secondary">Apply</button>
                            </div>
                            <div id="promoMessage" style="margin-top: 0.5rem;"></div>
                        </div>

                        <!-- Security Badges -->
                        <div style="margin: 2rem 0; text-align: center;">
                            <h3>Secure Checkout</h3>
                            <div style="display: flex; justify-content: center; gap: 1rem; margin: 1rem 0;">
                                <div style="background: #f8f9fa; padding: 0.5rem 1rem; border-radius: 5px; font-size: 0.9rem;">
                                    🔒 SSL Secured
                                </div>
                                <div style="background: #f8f9fa; padding: 0.5rem 1rem; border-radius: 5px; font-size: 0.9rem;">
                                    💳 Safe Payment
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Delivery Information -->
                <div class="card" style="margin-top: 1rem;">
                    <div class="card-content">
                        <h3>Delivery Information</h3>
                        <div style="margin: 1rem 0;">
                            <p>✅ Free delivery on orders over $50</p>
                            <p>✅ Same-day delivery available</p>
                            <p>✅ Express delivery in 2-4 hours</p>
                            <p>✅ Prescription verification included</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Recently Viewed -->
    <section class="container">
        <h2 class="text-center mb-4">Recently Viewed</h2>
        <div class="grid grid-3">
            <div class="card product-card" data-category="tablets" data-price="15.99" data-name="Paracetamol 500mg">
                <img src="../../images/paracetamol.jpeg" alt="Paracetamol 500mg" class="card-img">
                <div class="card-content">
                    <h3 class="card-title">Paracetamol 500mg</h3>
                    <p class="card-text">Pain relief and fever reducer</p>
                    <div class="price">$15.99</div>
                    <button class="btn btn-primary add-to-cart" 
                            data-product-id="1" 
                            data-product-name="Paracetamol 500mg" 
                            data-product-price="15.99" 
                            data-product-image="../../images/paracetamol.jpeg">
                        Add to Cart
                    </button>
                </div>
            </div>
            <div class="card product-card" data-category="syrups" data-price="12.50" data-name="Cough Syrup">
                <img src="../../images/coughsyrup.jpeg" alt="Cough Syrup" class="card-img">
                <div class="card-content">
                    <h3 class="card-title">Cough Syrup</h3>
                    <p class="card-text">Relieves cough and throat irritation</p>
                    <div class="price">$12.50</div>
                    <button class="btn btn-primary add-to-cart" 
                            data-product-id="2" 
                            data-product-name="Cough Syrup" 
                            data-product-price="12.50" 
                            data-product-image="../../images/coughsyrup.jpeg">
                        Add to Cart
                    </button>
                </div>
            </div>
            <div class="card product-card" data-category="otc" data-price="8.99" data-name="Vitamin D3">
                <img src="../../images/vitaminD3.jpeg" alt="Vitamin D3" class="card-img">
                <div class="card-content">
                    <h3 class="card-title">Vitamin D3</h3>
                    <p class="card-text">Essential vitamin for bone health</p>
                    <div class="price">$8.99</div>
                    <button class="btn btn-primary add-to-cart" 
                            data-product-id="3" 
                            data-product-name="Vitamin D3" 
                            data-product-price="8.99" 
                            data-product-image="../../images/vitaminD3.jpeg">
                        Add to Cart
                    </button>
                </div>
            </div>
        </div>
    </section>--%>

     <div>
   Your Cart</h3>
         <br />
 <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="medicine-grid" DataKeyNames="prod_cart_id">
             <Columns>
                 <asp:TemplateField HeaderText="Name">
                     <ItemTemplate>
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Price">
                     <ItemTemplate>
                         <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Stock">
                     <ItemTemplate>
                         <asp:TextBox ID="txtStock" runat="server"  Text='<%# Eval("Stock") %>' Width="50px"></asp:TextBox>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Stock">
                     <ItemTemplate>
                         <asp:Label ID="Label5" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Image">
                     <ItemTemplate>
                         <asp:Image ID="Image1" runat="server" Height="50" Width="50" ImageUrl='<%# Eval("Image") %>' />
                     </ItemTemplate>
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                     <ItemTemplate>
                         <asp:LinkButton ID="btnRemove" runat="server"
                             CommandName="Remove"
                             CommandArgument='<%# Eval("prod_cart_id") %>'
                             Text="Remove" ForeColor="Red" />
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
         </asp:GridView>

         <br />
         <%-- <asp:TemplateField HeaderText="Action">
                     <ItemTemplate>
                         <asp:LinkButton ID="btnRemove" runat="server"
                             CommandName="Remove"
                             CommandArgument='<%# Eval("prod_cart_id") %>'
                             Text="Remove" ForeColor="Red" />
                     </ItemTemplate>
                 </asp:TemplateField>--%>       
         <%--        <asp:Button ID="btnUpdateCart" runat="server" Text="Update Cart" OnClick="btnUpdateCart_Click" />--%>      
         <%--<asp:Button ID="btnUpdateCart" runat="server" Text="Update Cart" OnClick="btnUpdateCart_Click" />--%>
         <%--<asp:Button ID="btn_Update" runat="server" Text="Update Cart" OnClick="btn_Update_Click1"  />--%>
         <asp:Button ID="btn_Update" runat="server" Text="Update Cart" OnClick="btn_Update_Click2" />
         <asp:Button ID="BtnCheckout" runat="server" Text="Checkout" OnClick="BtnCheckout_Click" />

         <br />
         <br />
         <asp:Label ID="lblFinalTotal" runat="server"
             Text="Total: ₹0.00"
             Font-Bold="True"
             ForeColor="Blue"
             Font-Size="Large"></asp:Label>

     </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>MediCare3>MediCare</h3>
                    <p>Your trusted online pharmacy for all your healthcare needs.</p>
                </div>
                <div class="footer-section">
                    <h3>Quick Links</h3>
                    <a href="../Home/index.aspx">Home</a>
                    <a href="medicines.aspx">Medicines</a>
                    <a href="categories.aspx">Categories</a>
                    <a href="../Home/about.aspx">About Us</a>
                </div>
                <div class="footer-section">
                    <h3>Customer Care</h3>
                    <a href="../Home/contact.aspx">Contact Us</a>
                    <a href="../User/login.aspx">My Account</a>
                    <a href="../User/orders.aspx">Order Tracking</a>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 MediCare. All rights reserved.</p>
            </div>
        </div>
    </footer>
</asp:Content>
