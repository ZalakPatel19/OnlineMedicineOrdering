<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Online_Medicine_Ordering.Shop.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
       <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart - MediCare</title>
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
                    <a href="cart.html" class="btn btn-primary">Cart (<span id="cartCount">0</span>)
                    </a>
                </div>
            </nav>
        </header>
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
 <h3>  Your Cart</h3>
         <br />
 <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="fruit-grid" DataKeyNames="prod_cart_id">
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
                 <asp:TemplateField HeaderText="Quantity">
                     <ItemTemplate>
                         <asp:TextBox ID="txtQuantity" runat="server"
                             Text='<%# Eval("Quantity") %>'
                             Width="50px"></asp:TextBox>
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
                <%-- <asp:TemplateField HeaderText="Action">
                     <ItemTemplate>
                         <asp:LinkButton ID="btnRemove" runat="server"
                             CommandName="Remove"
                             CommandArgument='<%# Eval("prod_cart_id") %>'
                             Text="Remove" ForeColor="Red" />
                     </ItemTemplate>
                 </asp:TemplateField>--%>
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
         <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

         
</asp:Content>
