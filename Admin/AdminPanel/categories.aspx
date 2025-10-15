<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="categories.aspx.cs" Inherits="Online_Medicine_Ordering.Admin.AdminPanel.categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-container">
        <head>
            <style>
                /* --- Container --- */
                .admin-container {
                    display: flex;
                    min-height: 100vh;
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background-color: #f9fafb;
                }

                /* --- Sidebar (matches Medicines page) --- */
                .sidebar {
                    width: 250px;
                    background-color: #2d3748;
                    color: #cbd5e0;
                    display: flex;
                    flex-direction: column;
                    padding: 20px 0;
                }

                .sidebar-header {
                    padding: 0 30px;
                    font-size: 1.5rem;
                    font-weight: 700;
                    color: #edf2f7;
                    margin-bottom: 30px;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                    .sidebar-header i {
                        font-size: 1.8rem;
                        color: #63b3ed;
                    }

                .sidebar-menu {
                    list-style: none;
                    padding: 0;
                    margin: 0;
                    flex-grow: 1;
                }

                    .sidebar-menu li {
                        margin: 10px 0;
                    }

                        .sidebar-menu li a {
                            color: #cbd5e0;
                            text-decoration: none;
                            display: flex;
                            align-items: center;
                            padding: 10px 30px;
                            font-size: 1rem;
                            border-left: 4px solid transparent;
                            transition: all 0.3s ease;
                        }

                            .sidebar-menu li a i {
                                margin-right: 12px;
                            }

                            .sidebar-menu li.active a,
                            .sidebar-menu li a:hover {
                                background-color: #63b3ed;
                                color: white;
                                border-left-color: #4299e1;
                            }

                /* --- Main Content --- */
                .main-content {
                    flex-grow: 1;
                    padding: 30px 40px;
                    background-color: #fff;
                    box-shadow: inset 0 0 10px #e2e8f0;
                    overflow-y: auto;
                }

                .header {
                    margin-bottom: 30px;
                    border-bottom: 2px solid #e2e8f0;
                    padding-bottom: 15px;
                }

                .header-left h1 {
                    font-size: 2rem;
                    color: #2d3748;
                    margin-bottom: 5px;
                }

                .header-left p {
                    color: #718096;
                    font-size: 1rem;
                }

                /* --- Form Styling --- */
                .form-group {
                    margin-bottom: 20px;
                    max-width: 500px;
                }

                    .form-group label {
                        display: block;
                        font-weight: 600;
                        margin-bottom: 8px;
                        color: #2d3748;
                    }

                .input-text,
                input[type="text"],
                asp\:TextBox {
                    width: 100%;
                    padding: 8px 12px;
                    font-size: 1rem;
                    border: 1.5px solid #cbd5e0;
                    border-radius: 5px;
                    transition: border-color 0.3s ease;
                    box-sizing: border-box;
                }

                    input[type="text"]:focus,
                    asp\:TextBox:focus {
                        border-color: #63b3ed;
                        outline: none;
                        box-shadow: 0 0 5px rgba(99,179,237,0.5);
                    }

                /* --- Button --- */
                .btn {
                    display: inline-block;
                    padding: 10px 25px;
                    background-color: #4299e1;
                    color: white !important;
                    border: none;
                    border-radius: 5px;
                    font-weight: 600;
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                    font-size: 1rem;
                    user-select: none;
                }

                    .btn:hover {
                        background-color: #2b6cb0;
                    }

                .btn-sm {
                    padding: 5px 12px;
                    font-size: 0.85rem;
                }

                /* --- GridView --- */
                .table-container {
                    max-width: 100%;
                    overflow-x: auto;
                    margin-top: 40px;
                }

                .data-table {
                    width: 100%;
                    border-collapse: collapse;
                    box-shadow: 0 0 15px -5px #a0aec0;
                }

                    .data-table th,
                    .data-table td {
                        padding: 12px 15px;
                        border: 1px solid #e2e8f0;
                        text-align: left;
                        color: #2d3748;
                        font-size: 0.95rem;
                    }

                    .data-table th {
                        background-color: #edf2f7;
                        font-weight: 700;
                    }

                    .data-table tr:nth-child(even) {
                        background-color: #f7fafc;
                    }

                /* Edit/Delete buttons */
                .btn-edit {
                    background-color: #10b981;
                    color: white !important;
                    border-radius: 3px;
                    padding: 5px 10px;
                    text-decoration: none !important;
                    display: inline-block;
                    font-size: 0.9rem;
                }

                    .btn-edit:hover {
                        background-color: #059669;
                    }

                .btn-delete {
                    background-color: #ef4444;
                    color: white !important;
                    border-radius: 3px;
                    padding: 5px 10px;
                    text-decoration: none !important;
                    display: inline-block;
                    font-size: 0.9rem;
                }

                    .btn-delete:hover {
                        background-color: #dc2626;
                    }

                @media (max-width: 768px) {
                    .admin-container {
                        flex-direction: column;
                    }

                    .sidebar {
                        width: 100%;
                        flex-direction: row;
                        overflow-x: auto;
                    }

                    .sidebar-menu {
                        display: flex;
                        flex-direction: row;
                    }

                        .sidebar-menu li {
                            margin: 0 10px;
                        }

                    .main-content {
                        padding: 20px;
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
            <li><a href="settings.aspx"><i class="fas fa-cog"></i>Settings</a></li>
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
