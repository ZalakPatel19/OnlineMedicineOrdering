<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="medicines.aspx.cs" Inherits="Online_Medicine_Ordering.Admin.AdminPanel.medicines" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* --- Main Layout --- */
        .admin-container {
            display: flex;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9fafb;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            min-width: 250px;
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

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 30px;
            background-color: #f0f4f8;
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

        /* Card Layout */
        .card {
            max-width: 650px;
            margin: 0 auto 40px auto;
            padding: 25px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        /* Form */
        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #2d3748;
        }

        .input-text,
        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea,
        select,
        asp\:DropDownList,
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
        input[type="number"]:focus,
        input[type="date"]:focus,
        textarea:focus,
        select:focus {
            border-color: #63b3ed;
            outline: none;
            box-shadow: 0 0 5px rgba(99, 179, 237, 0.5);
        }

        /* Buttons */
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

        /* GridView Card */
        .table-card {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            overflow-x: auto;
        }

        /* GridView Styling */
        .data-table {
            width: 100%;
            border-collapse: collapse;
            table-layout: auto;
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

        .data-table img {
            max-width: 100px;
            height: auto;
            display: block;
            margin: auto;
        }

        .btn-primary {
            background-color: #4299e1;
            color: white !important;
            border-radius: 3px;
            padding: 5px 10px;
            text-decoration: none !important;
            display: inline-block;
            font-size: 0.9rem;
        }

        .btn-primary:hover {
            background-color: #2b6cb0;
        }

        .btn-danger {
            background-color: #f56565;
            color: white !important;
            border-radius: 3px;
            padding: 5px 10px;
            text-decoration: none !important;
            display: inline-block;
            font-size: 0.9rem;
        }

        .btn-danger:hover {
            background-color: #c53030;
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

            .card, .table-card {
                margin: 0 10px 30px 10px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="admin-container">
        <!-- Sidebar -->
        <nav class="sidebar">
            <div class="sidebar-header">
                <h2><i class="fas fa-pills"></i> Med Admin</h2>
            </div>
            <ul class="sidebar-menu">
                <li><a href="dashboard.aspx"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="orders.aspx"><i class="fas fa-shopping-cart"></i> Orders</a></li>
                <li class="active"><a href="medicines.aspx"><i class="fas fa-pills"></i> Medicines</a></li>
                <li><a href="categories.aspx"><i class="fas fa-th-list"></i> Categories</a></li>
                <li><a href="users.aspx"><i class="fas fa-users"></i> Users</a></li>
                <li><a href="settings.aspx"><i class="fas fa-cog"></i> Settings</a></li>
                <li><a href="login.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <header class="header">
                <div class="header-left">
                    <h1>Medicines Management</h1>
                    <p>Manage your medicine inventory</p>
                </div>
            </header>

            <!-- Form Card -->
            <div class="card">
                <h2>Add New Medicine</h2>
                <div class="form-group">
                    <label>Category:</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="input-text" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label>Medicine Name:</label>
                    <asp:TextBox ID="txtMedicineName" runat="server" placeholder="Enter medicine name" CssClass="input-text"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Description:</label>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" placeholder="Enter description" CssClass="input-text"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Price (₹):</label>
                    <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" placeholder="Enter price" CssClass="input-text"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Stock Quantity:</label>
                    <asp:TextBox ID="txtStock" runat="server" TextMode="Number" placeholder="Enter stock quantity" CssClass="input-text"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Expiry Date:</label>
                    <asp:TextBox ID="txtExpiry" runat="server" TextMode="Date" CssClass="input-text"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Status:</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="input-text">
                        <asp:ListItem Text="Available" Value="Available" />
                        <asp:ListItem Text="Out of Stock" Value="Out of Stock" />
                        <asp:ListItem Text="Discontinued" Value="Discontinued" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label>Image:</label>
                    <asp:FileUpload ID="fldimg" runat="server" />
                </div>

                <asp:Button ID="btnSave" runat="server" Text="Save Medicine" CssClass="btn" OnClick="btnSave_Click" />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
            </div>

            <!-- GridView Card -->
            <div class="table-card">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="data-table" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price (₹)">
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Stock">
                            <ItemTemplate>
                                <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Expiry">
                            <ItemTemplate>
                                <asp:Label ID="lblExpiry" runat="server" Text='<%# Eval("ExpiryDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("Image") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="cmd_edt" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-primary"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="cmd_dlt" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-danger"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </main>
    </div>
</asp:Content>
