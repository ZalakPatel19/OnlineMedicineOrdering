<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Online_Medicine_Ordering.User.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - MediCare</title>
    <link rel="stylesheet" href="../Assets/css/style.css" />
    <link rel="icon" href="../Assets/images/favicon.ico" type="image/x-icon" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <header class="header">
            <nav class="navbar">
                <a href="../Home/index.aspx" class="logo">MediCare</a>
                <ul class="nav-links">
                    <li><a href="../Home/index.aspx">Home</a></li>
                    <li><a href="../Shop/medicines.aspx">Medicines</a></li>
                    <li><a href="../Shop/categories.aspx">Categories</a></li>
                    <li><a href="../Home/about.aspx">About</a></li>
                    <li><a href="../Home/contact.aspx">Contact</a></li>
                </ul>
                <div class="user-actions">
                    <a href="login.aspx" class="btn btn-secondary">Login</a>
                    <a href="register.aspx" class="btn btn-primary">Register</a>
                    <a href="../Shop/cart.aspx" class="btn btn-primary">
                        Cart (<span id="cartCount">0</span>)
                    </a>
                </div>
            </nav>
        </header>

        <!-- Login Section -->
        <section class="container" style="margin: 4rem auto; max-width: 500px;">
            <div class="card">
                <div class="card-content">
                    <h1 class="text-center mb-4">Login to Your Account</h1>
                    <p class="text-center mb-4" style="color: #666;">
                        Access your orders, prescriptions, and health information
                    </p>

                    <div class="form-group">
                        <label>Email Address *</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                    </div>

                    <div class="form-group">
                        <label>Password *</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>

                    <div class="form-group" style="display: flex; justify-content: space-between; align-items: center;">
                        <label style="display: flex; align-items: center; gap: 0.5rem;">
                            <asp:CheckBox ID="chkRememberMe" runat="server" />
                            <span>Remember me</span>
                        </label>
                        <a href="#" style="color: #007bff; text-decoration: none;">Forgot Password?</a>
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary"
                        Style="width:100%; padding:1rem; font-size:1.1rem;" OnClick="btnLogin_Click" />

                    <div class="text-center" style="margin: 2rem 0;">
                        <p>Don't have an account?
                            <a href="register.aspx" style="color: #007bff; text-decoration: none;">Sign up here</a>
                        </p>
                    </div>

                    <!-- Social Login -->
                    <div style="margin: 2rem 0;">
                        <div style="text-align: center; margin: 1rem 0; position: relative;">
                            <span style="background: white; padding: 0 1rem; color: #666;">Or continue with</span>
                            <hr style="position: absolute; top: 50%; left: 0; right: 0; z-index: -1;" />
                        </div>

                        <div style="display: flex; gap: 1rem;">
                            <button type="button" class="btn btn-secondary" style="flex: 1;">📧 Google</button>
                            <button type="button" class="btn btn-secondary" style="flex: 1;">📘 Facebook</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Guest Checkout Option -->
            <div class="card" style="margin-top: 2rem;">
                <div class="card-content text-center">
                    <h3>Continue as Guest</h3>
                    <p style="color: #666; margin: 1rem 0;">You can place an order without creating an account</p>
                    <a href="../Shop/checkout.aspx" class="btn btn-secondary">Guest Checkout</a>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="footer-content">
                    <div class="footer-section">
                        <h3>MediCare</h3>
                        <p>Your trusted online pharmacy for all your healthcare needs.</p>
                    </div>
                    <div class="footer-section">
                        <h3>Quick Links</h3>
                        <a href="../Home/index.aspx">Home</a>
                        <a href="../Shop/medicines.aspx">Medicines</a>
                        <a href="../Shop/categories.aspx">Categories</a>
                        <a href="../Home/about.aspx">About Us</a>
                    </div>
                    <div class="footer-section">
                        <h3>Customer Care</h3>
                        <a href="../Home/contact.aspx">Contact Us</a>
                        <a href="login.aspx">My Account</a>
                        <a href="orders.aspx">Order Tracking</a>
                    </div>
                </div>
                <div class="footer-bottom">
                    <p>&copy; 2024 MediCare. All rights reserved.</p>
                </div>
            </div>
        </footer>
    </form>
    <script src="../Assets/js/main.js"></script>
</body>
</html>
