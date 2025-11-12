<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="Online_Medicine_Ordering.Shop.cheakout" %>

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
        <style>
            /* ===========================
   GLOBAL STYLES
=========================== */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }

            body {
                background: #f5f9fc;
                color: #333;
            }

            /* ===========================
   NAVBAR
=========================== */
            .header {
                background: #ffffff;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                padding: 10px 0;
            }

            .navbar {
                display: flex;
                align-items: center;
                justify-content: space-between;
                width: 90%;
                margin: auto;
            }

                .navbar .logo {
                    font-size: 1.8rem;
                    font-weight: 600;
                    color: #0077b6;
                    text-decoration: none;
                }

            .nav-links {
                list-style: none;
                display: flex;
                gap: 25px;
            }

                .nav-links li a {
                    text-decoration: none;
                    font-size: 1rem;
                    color: #333;
                    transition: 0.3s;
                }

                    .nav-links li a:hover {
                        color: #0077b6;
                    }

            .user-actions a {
                margin-left: 10px;
            }

            /* Buttons */
            .btn {
                padding: 8px 15px;
                background: #0077b6;
                color: #fff;
                border-radius: 6px;
                border: none;
                text-decoration: none;
                transition: .3s;
                cursor: pointer;
            }

                .btn:hover {
                    background: #005f8a;
                }

            .btn-secondary {
                background: #6c757d;
            }

                .btn-secondary:hover {
                    background: #565e64;
                }

            /* ===========================
   MAIN CONTAINER
=========================== */
            .container {
                width: 90%;
                margin: 30px auto;
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #0077b6;
            }

            /* ===========================
   GRIDVIEW TABLE
=========================== */
            .fruit-grid {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background: #fff;
                border-radius: 10px;
                overflow: hidden;
            }

                .fruit-grid th {
                    background: #0077b6;
                    color: white;
                    padding: 12px;
                    font-size: 1rem;
                }

                .fruit-grid td {
                    padding: 12px;
                    text-align: center;
                    border-bottom: 1px solid #eee;
                }

                .fruit-grid tr:hover {
                    background: #f0f8ff;
                }

            /* ===========================
   FORM SECTIONS
=========================== */
            .section {
                margin: 25px 0;
            }

            .textbox {
                width: 100%;
                padding: 12px;
                border-radius: 8px;
                border: 1px solid #ccc;
                font-size: 1rem;
            }

            .total-label {
                font-size: 1.4rem;
                font-weight: bold;
                color: #005f8a;
            }

            .message {
                font-size: 1.1rem;
                margin-top: 10px;
                display: block;
                color: green;
            }

            /* ===========================
                FOOTER
                =========================== */
            .footer {
                background: #023e8a;
                color: #fff;
                padding: 40px 0;
                margin-top: 50px;
            }

            .footer-content {
                width: 90%;
                margin: auto;
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            .footer-section h3 {
                font-size: 1.3rem;
                margin-bottom: 10px;
            }

            .footer-section a {
                display: block;
                color: #d9ecff;
                margin-top: 6px;
                text-decoration: none;
            }

                .footer-section a:hover {
                    color: #fff;
                }

            .footer-bottom {
                text-align: center;
                margin-top: 20px;
                font-size: 0.9rem;
            }

            /* ===========================
   RESPONSIVE
=========================== */
            @media (max-width: 768px) {
                .navbar {
                    flex-direction: column;
                    gap: 15px;
                }

                .nav-links {
                    flex-wrap: wrap;
                    justify-content: center;
                }

                .fruit-grid td img {
                    width: 40px;
                    height: 40px;
                }
            }
        </style>
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
                <a href="cart.aspx" class="btn btn-primary">Cart (<span id="cartCount">0</span>)
                </a>
            </div>
        </nav>
    </header>

    <%-- <!-- Page Content -->
    <section class="container" style="margin: 4rem auto; text-align: center;">
        <div class="card">
            <div class="card-content">
                <h1>Checkout Page</h1>
                <p>This page is currently under construction.</p>
            </div>
        </div>
    </section>--%>

    <div>
        <div class="container">
            <h1>Order Summary</h1>
            <br />
            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="fruit-grid" DataKeyNames="prod_cart_id">
                <Columns>
                    <asp:TemplateField HeaderText="Medicine Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMedicineName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Stock">
                        <ItemTemplate>
                            <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="imgMedicine" runat="server" Height="50" Width="50" ImageUrl='<%# Eval("Image") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            <%#Convert.ToInt32(Eval("Price"))*Convert.ToInt32(Eval("Stock")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="section">
                <asp:Label ID="lblOrderTotal" runat="server" CssClass="total-label" Text="Order Total: ₹0"></asp:Label>
            </div>

            <div class="section">
                <h2>Shipping Address</h2>
                <asp:TextBox ID="txtShippingAddress" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="3" placeholder="Enter your shipping address"></asp:TextBox>
            </div>

            <div class="section">
                Payment Method</h2>
                    <asp:RadioButtonList ID="rblPaymentMethod" runat="server">
                        <asp:ListItem Text="Cash on Delivery" Value="Cash" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Debit Card" Value="Debit"></asp:ListItem>
                        <asp:ListItem Text="UPI" Value="UPI"></asp:ListItem>
                    </asp:RadioButtonList>
            </div>

            <div class="section" style="text-align: center;">
                <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn" OnClick="btnPlaceOrder_Click" />
                <br />
                <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            </div>
        </div>
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

    <%--    <script src="../Assets/js/main.js"></script>--%>
</asp:Content>
