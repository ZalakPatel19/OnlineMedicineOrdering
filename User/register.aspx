<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="Online_Medicine_Ordering.User.register" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register - MediCare</title>
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
                    <a href="login.aspx" class="btn btn-secondary" id="loginBtn">Login</a>
                    <a href="register.aspx" class="btn btn-primary" id="registerBtn">Register</a>
                    <a href="../Shop/cart.aspx" class="btn btn-primary">Cart (<span id="cartCount">0</span>)</a>
                </div>
            </nav>
        </header>

        <!-- Registration Section -->
        <section class="container" style="margin: 4rem auto; max-width: 600px;">
            <div class="card">
                <div class="card-content">
                    <h1 class="text-center mb-4">Create Your Account</h1>
                    <p class="text-center mb-4" style="color: #666;">Join thousands of customers who trust MediCare for their healthcare needs</p>

                    <!-- Personal Information -->
                    <h3 style="margin: 2rem 0 1rem 0; color: #333;">Personal Information</h3>
                    <div class="grid grid-2">
                        <div class="form-group">
                            <label>Full Name *</label>
                            <asp:TextBox ID="txtfnm" CssClass="form-control" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>Gender *</label>
                            <asp:RadioButtonList ID="rdgen" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Email *</label>
                        <asp:TextBox ID="txtem" CssClass="form-control" TextMode="Email" runat="server" />
                    </div>

                    <div class="form-group">
                        <label>Mobile No *</label>
                        <asp:TextBox ID="txtmb" CssClass="form-control" runat="server" />
                    </div>

                    <!-- Account Security -->
                    <h3 style="margin: 2rem 0 1rem 0; color: #333;">Account Security</h3>
                    <div class="form-group">
                        <label>Password *</label>
                        <asp:TextBox ID="txtpw" CssClass="form-control" TextMode="Password" runat="server" />
                        <small style="color: #666;">Password must be at least 8 characters long</small>
                    </div>

                    <!-- Address Information -->
                    <h3 style="margin: 2rem 0 1rem 0; color: #333;">Address Information</h3>
                    <div class="form-group">
                        <label>Address *</label>
                        <asp:TextBox ID="txtad" CssClass="form-control" runat="server" />
                    </div>

                    <div class="grid grid-2">
                        <div class="form-group">
                            <label>City *</label>
                            <asp:TextBox ID="txtct" CssClass="form-control" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>State *</label>
                            <asp:TextBox ID="txtsct" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <center>
                        <asp:Button ID="btnreg" runat="server" CssClass="btn btn-primary" Text="Register" OnClick="Button1_Click" />
                    </center>
                </div>
            </div>

            <div class="text-center" style="margin: 2rem 0;">
                <p>Already have an account? <a href="login.aspx" style="color: #007bff; text-decoration: none;">Login here</a></p>
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
