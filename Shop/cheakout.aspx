<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="cheakout.aspx.cs" Inherits="Online_Medicine_Ordering.Shop.cheakout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout - MediCare</title>
        <link rel="stylesheet" href="../Assets/css/style.css">
        <link rel="icon" href="../Assets/images/favicon.ico" type="image/x-icon">
    </head>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <!-- Header -->
    <header class="header">
        <nav class="navbar">
            <a href="../Home/index.aspx" class="logo">MediCare</a>
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
                <a href="cart.aspx" class="btn btn-primary">
                    Cart (<span id="cartCount">0</span>)
                </a>
            </div>
        </nav>
    </header>

    <!-- Page Content -->
    <section class="container" style="margin: 4rem auto; text-align: center;">
        <div class="card">
            <div class="card-content">
                <h1>Checkout Page</h1>
                <p>This page is currently under construction.</p>
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

    <script src="../Assets/js/main.js"></script>
</asp:Content>
