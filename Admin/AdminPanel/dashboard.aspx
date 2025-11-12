<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="Online_Medicine_Ordering.Admin.AdminPanel.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Medicine Management</title>
        <style>
            /* Global */
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f4f6f9;
}

/* Container Layout */
.admin-container {
    display: flex;
    min-height: 100vh;
}

/* Sidebar */
.sidebar {
    width: 250px;
    background: #2E7D32;
    color: #fff;
    padding-top: 20px;
    position: fixed;
    height: 100%;
    box-shadow: 3px 0 10px rgba(0,0,0,0.2);
}

.sidebar-header h2 {
    text-align: center;
    padding: 0 15px 10px 15px;
    font-size: 22px;
    font-weight: 700;
}

.sidebar-menu {
    list-style: none;
    padding: 0;
    margin: 20px 0;
}

.sidebar-menu li a {
    display: block;
    padding: 14px 20px;
    color: #fff;
    text-decoration: none;
    font-size: 15px;
    font-weight: 500;
    transition: 0.3s;
}

.sidebar-menu li a i {
    margin-right: 10px;
}

.sidebar-menu li:hover a,
.sidebar-menu li.active a {
    background: #1B5E20;
    padding-left: 28px;
}

/* Main Content */
.main-content {
    margin-left: 250px;
    padding: 30px;
    width: calc(100% - 250px);
}

/* Header */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #fff;
    padding: 15px 25px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    margin-bottom: 25px;
}

.header-left h1 {
    margin: 0;
    font-size: 26px;
}

.header-left p {
    margin: 5px 0 0;
    color: #666;
}

/* User Menu */
.user-menu {
    position: relative;
    padding: 8px 14px;
    background: #e8f5e9;
    border-radius: 8px;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 8px;
}

.user-name {
    font-weight: 600;
}

.user-menu i {
    font-size: 22px;
    color: #2E7D32;
}

.user-menu:hover .dropdown {
    display: block;
}

/* Dropdown */
.dropdown {
    display: none;
    position: absolute;
    top: 42px;
    right: 0;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    width: 120px;
}

.dropdown a {
    display: block;
    padding: 10px 15px;
    color: #000;
    text-decoration: none;
}

.dropdown a:hover {
    background: #f4f4f4;
}

/* Cards */
.dashboard-container {
    display: flex;
    gap: 20px;
    margin-bottom: 25px;
    flex-wrap: wrap;
}

.card {
    background: #fff;
    width: 250px;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 6px 16px rgba(0,0,0,0.15);
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-5px);
}

.card h3 {
    margin: 0 0 10px;
}

.card p {
    color: #777;
    font-size: 14px;
}

/* Summary Section */
.summary-section {
    display: flex;
    gap: 20px;
    margin-top: 20px;
    flex-wrap: wrap;
}

.summary-box {
    background: #ffffff;
    padding: 20px;
    width: 220px;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

.summary-box h4 {
    margin: 0 0 10px;
    font-weight: 600;
}

.summary-box span {
    font-size: 24px;
    font-weight: 700;
    color: #2E7D32;
}

/* Welcome Text */
.welcome {
    margin-top: 30px;
    background: #e8f5e9;
    padding: 20px;
    border-radius: 10px;
}

.welcome h3 {
    margin: 0 0 10px;
}

.welcome p {
    margin: 0;
    color: #444;
}

/* Responsive */
@media (max-width: 768px) {
    .sidebar {
        width: 210px;
    }
    .main-content {
        margin-left: 210px;
        width: calc(100% - 210px);
    }
}

@media (max-width: 600px) {
    .sidebar {
        display: none;
    }

    .main-content {
        margin-left: 0;
        width: 100%;
    }

    .header {
        flex-direction: column;
        text-align: center;
        gap: 10px;
    }

    .dashboard-container,
    .summary-section {
        justify-content: center;
    }
}


        </style>
        <link rel="stylesheet" href="styles.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    </head>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <body>
        <div class="admin-container">
            <!-- Sidebar -->
            <nav class="sidebar">
                <div class="sidebar-header">
                    <h2><i class="fas fa-pills"></i>Medicine Admin</h2>
                </div>
                <ul class="sidebar-menu">
                    <li class="active"><a href="dashboard.aspx"><i class="fas fa-tachometer-alt"></i>Dashboard</a></li>
                    <li><a href="medicines.aspx"><i class="fas fa-pills"></i>Medicines</a></li>
                    <li><a href="categories.aspx"><i class="fas fa-tags"></i>Categories</a></li>
                    <li><a href="orders.aspx"><i class="fas fa-shopping-cart"></i>Orders</a></li>
                    <li><a href="users.aspx"><i class="fas fa-users"></i>Users</a></li>
                </ul>
            </nav>

            <!-- Main Content -->
            <main class="main-content">
                <header class="header">
                    <div class="header-left">
                        <h1>Dashboard</h1>
                        <p>Welcome back, Admin!</p>
                    </div>
                    <div class="header-right">
                        <div class="user-menu">
                            <span class="user-name">Admin User</span>
                            <i class="fas fa-user-circle"></i>
                            <div class="dropdown">
                                <a href="#" onclick="logout()">Logout</a>
                            </div>
                        </div>
                    </div>
                </header>

              
                 <%-- <div class="dashboard-container">
        <div class="card">
            <h3>Manage Fruits</h3>
            <p>Add, update, or delete fruit items.</p>
            <a href="ManageFruits.aspx" style="color: #28a745; font-weight: bold;">Go →</a>
        </div>--%>
        <div class="card">
            <h3>Manage Orders</h3>
            <p>View and update customer orders.</p>
            <a href="orders.aspx" style="color: #28a745; font-weight: bold;">Go →</a>
        </div>
        <div class="card">
            <h3>Manage Users</h3>
            <p>View, block, or manage user accounts.</p>
            <a href="user.aspx" style="color: #28a745; font-weight: bold;">Go →</a>
        </div>
    </div>
     <div class="summary-section">
                <div class="summary-box">
                    <h4>Total Medicine</h4>
                    <span><asp:Label ID="lblMedicineName" runat="server" Text="0"></asp:Label></span>
                </div>

                <div class="summary-box">
                    <h4>Total Orders</h4>
                    <span><asp:Label ID="lblTotalOrders" runat="server" Text="0"></asp:Label></span>
                </div>

                <div class="summary-box">
                    <h4>Total Users</h4>
                    <span><asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></span>
                </div>

                <div class="summary-box">
                    <h4>Total Revenue</h4>
                    <span>₹<asp:Label ID="lblTotalRevenue" runat="server" Text="0"></asp:Label></span>
                </div>
            </div>

            <div class="welcome">
                <h3>Welcome, <%= Session["Admin"] %> 👋</h3>
                <p>Use the cards above to manage your website efficiently.</p>
            </div>

        </main>
</div>
</asp:Content>
