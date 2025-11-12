<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="Online_Medicine_Ordering.User.orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Orders - MediCare</title>
        <link rel="stylesheet" href="../Assets/css/style.css">
        <link rel="icon" href="../Assets/images/favicon.ico" type="image/x-icon">
    </head>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    body>
    <!-- Header -->
    <header class="header">
        <nav class="navbar">
            <a href="../Home/index.html" class="logo">MediCare</a>
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
                <div id="userMenu" style="display: none;"></div>
                <a href="../Shop/cart.aspx" class="btn btn-primary">Cart (<span id="cartCount">0</span>)
                </a>
            </div>
        </nav>
    </header>

    <!-- Page Header -->
    <section class="hero" style="height: 200px;">
        <div class="hero-content">
            <h1>My Orders</h1>
            <p>Track your orders and view order history</p>
        </div>
    </section>

    <!-- Orders Content -->
    <section class="container">
        <!-- Order Filters -->
        <div class="card" style="margin: 2rem 0;">
            <div class="card-content">
                <div class="grid grid-2">
                    <div>
                        <h3>Filter Orders</h3>
                        <div style="display: flex; gap: 1rem; margin-top: 1rem;">
                            <button class="btn btn-secondary" onclick="filterOrders('all')">All Orders</button>
                            <button class="btn btn-secondary" onclick="filterOrders('pending')">Pending</button>
                            <button class="btn btn-secondary" onclick="filterOrders('processing')">Processing</button>
                            <button class="btn btn-secondary" onclick="filterOrders('shipped')">Shipped</button>
                            <button class="btn btn-secondary" onclick="filterOrders('delivered')">Delivered</button>
                        </div>
                    </div>
                    <div>
                        <h3>Search Orders</h3>
                        <div style="display: flex; gap: 0.5rem; margin-top: 1rem;">
                            <input type="text" id="orderSearch" placeholder="Search by order ID or product name" class="form-control">
                            <button onclick="searchOrders()" class="btn btn-primary">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Orders List -->
        <div id="ordersList">
            <!-- Orders will be populated by JavaScript -->
        </div>

        <!-- Empty State -->
        <div id="emptyOrders" style="display: none; text-align: center; padding: 4rem;">
            <h3>No Orders Found</h3>
            <p style="color: #666; margin: 1rem 0;">You haven't placed any orders yet.</p>
            <a href="../Shop/medicines.aspx" class="btn btn-primary">Start Shopping</a>
        </div>
    </section>

    <!-- Order Details Modal -->
    <div id="orderDetailsModal" class="modal">
        <div class="modal-content" style="max-width: 800px;">
            <span class="close" onclick="closeModal('orderDetailsModal')">&times;</span>
            <h2>Order Details</h2>
            <div id="orderDetailsContent">
                <!-- Order details will be populated by JavaScript -->
            </div>
        </div>
    </div>

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
                    <a href="profile.aspx">My Account</a>
                    <a href="orders.aspx">Order Tracking</a>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 MediCare. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="../Assets/js/main.js"></script>
</asp:Content>
