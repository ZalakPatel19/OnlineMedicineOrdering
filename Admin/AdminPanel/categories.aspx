<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="categories.aspx.cs" Inherits="Online_Medicine_Ordering.Admin.AdminPanel.categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-container">
        <head>
            <style>
               /* Global */
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f4f6f9;
}

/* Admin container */
.admin-container {
    display: flex;
    min-height: 100vh;
}

/* Sidebar (Purple Gradient Like Image) */
.sidebar {
    width: 260px;
    background: linear-gradient(180deg, #6A5ACD, #8A2BE2);
    color: white;
    padding-top: 25px;
    position: fixed;
    height: 100%;
    box-shadow: 3px 0 15px rgba(0,0,0,0.2);
}

.sidebar-header h2 {
    text-align: center;
    font-size: 26px;
    font-weight: 700;
    padding-bottom: 16px;
}

.sidebar-menu {
    list-style: none;
    margin: 0;
    padding: 0;
}

.sidebar-menu li a {
    display: block;
    padding: 16px 22px;
    color: white;
    text-decoration: none;
    font-size: 15.5px;
    font-weight: 500;
    transition: 0.3s;
    border-left: 4px solid transparent;
}

.sidebar-menu li a i {
    margin-right: 12px;
}

.sidebar-menu li:hover a,
.sidebar-menu li.active a {
    background: rgba(255,255,255,0.12);
    border-left: 4px solid #ffd54f;
}

/* Main Content */
.main-content {
    margin-left: 260px;
    padding: 35px;
    width: calc(100% - 260px);
}

/* Header (White box like dashboard) */
.header {
    background: #ffffff;
    padding: 22px 28px;
    border-radius: 15px;
    box-shadow: 0 4px 14px rgba(0,0,0,0.1);
    margin-bottom: 30px;
}

.header-left h1 {
    font-size: 32px;
    margin: 0;
    color: #333;
}

.header-left p {
    margin: 5px 0 0;
    color: #666;
    font-size: 15px;
}

/* Input Form */
.form-group label {
    font-weight: 600;
    font-size: 14px;
}

.input-text {
    width: 100%;
    padding: 12px 14px;
    font-size: 15px;
    border: 1px solid #ccc;
    border-radius: 10px;
    outline: none;
}

.input-text:focus {
    border-color: #6A5ACD;
}

/* Green Add Button */
.btn {
    background: #43A047;
    color: white;
    padding: 10px 18px;
    font-size: 15px;
    font-weight: 600;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    transition: .3s;
}

.btn:hover {
    background: #2E7D32;
}

/* Table Container (White box like dashboard cards) */
.table-container {
    background: #ffffff;
    border-radius: 18px;
    padding: 25px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.08);
}

/* GridView styles */
.data-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 15px;
}

.data-table th {
    background: #6A5ACD;
    color: white;
    padding: 12px;
    text-align: left;
    border-radius: 6px;
}

.data-table td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
}

.btn-edit {
    color: #1E88E5;
    font-weight: 600;
    cursor: pointer;
}

.btn-delete {
    color: #E53935;
    font-weight: 600;
    cursor: pointer;
}

/* Responsive */
@media (max-width: 768px) {
    .sidebar {
        width: 200px;
    }
    .main-content {
        margin-left: 200px;
        width: calc(100% - 200px);
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
}

            </style>
        </head>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Sidebar -->
    <nav class="sidebar">
        <div class="sidebar-header">
            <h2><i class="fas fa-pills"></i>Med Admin</h2>
        </div>
        <ul class="sidebar-menu">
            <li><a href="dashboard.aspx"><i class="fas fa-tachometer-alt"></i>Dashboard</a></li>
            <li><a href="orders.aspx"><i class="fas fa-shopping-cart"></i>Orders</a></li>
            <li><a href="medicines.aspx"><i class="fas fa-pills"></i>Medicines</a></li>
            <li class="active"><a href="categories.aspx"><i class="fas fa-tags"></i>Categories</a></li>
            <li><a href="users.aspx"><i class="fas fa-users"></i>Users</a></li>
            <li><a href="login.aspx"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        <header class="header">
            <div class="header-left">
                <h1>Medicine Categories</h1>
                <p>Manage your medicine categories</p>
            </div>
        </header>

        <!-- Category Form -->
        <div class="form-group">
            <label>Category Name</label>
            <asp:TextBox ID="txtmct" runat="server" CssClass="input-text"></asp:TextBox>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Add Category" CssClass="btn" OnClick="Button1_Click" />

        <!-- GridView -->
        <div class="table-container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="data-table" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Category ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt" CssClass="btn-edit">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt" CssClass="btn-delete">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </main>
    </div>

</asp:Content>
