<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="Online_Medicine_Ordering.Admin.AdminPanel.user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users Management - Pharmacy Admin</title>
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
                <h2><i class="fas fa-pills"></i> Medicine Admin</h2>
            </div>
            <ul class="sidebar-menu">
                <li><a href="dashboard.aspx"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="medicines.aspx"><i class="fas fa-pills"></i> Medicines</a></li>
                <li><a href="categories.aspx"><i class="fas fa-tags"></i> Categories</a></li>
                <li><a href="orders.aspx"><i class="fas fa-shopping-cart"></i> Orders</a></li>
                <li><a href="prescriptions.aspx"><i class="fas fa-file-medical"></i> Prescriptions</a></li>
                <li class="active"><a href="users.aspx"><i class="fas fa-users"></i> Users</a></li>
                <li><a href="reports.aspx"><i class="fas fa-chart-bar"></i> Reports</a></li>
                <li><a href="settings.aspx"><i class="fas fa-cog"></i> Settings</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <header class="header">
                <div class="header-left">
                    <h1>Users Management</h1>
                    <p>Manage customer accounts and information</p>
                </div>
                <div class="header-right">
                    <button class="btn btn-primary" onclick="openUserModal()">
                        <i class="fas fa-plus"></i> Add User
                    </button>
                </div>
            </header>

            <!-- Filters and Search -->
            <div class="filters-section">
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" id="userSearch" placeholder="Search users...">
                </div>
                <div class="filter-group">
                    <select id="statusFilter">
                        <option value="">All Status</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                        <option value="suspended">Suspended</option>
                    </select>
                    <select id="roleFilter">
                        <option value="">All Roles</option>
                        <option value="customer">Customer</option>
                        <option value="admin">Admin</option>
                        <option value="staff">Staff</option>
                    </select>
                    <button class="btn btn-secondary" onclick="clearFilters()">Clear Filters</button>
                </div>
            </div>

            <!-- Users Table -->
            <div class="table-container">
                <table class="data-table" id="usersTable">
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Last Login</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <img src="https://via.placeholder.com/40x40" alt="User" class="user-avatar">
                                    <div>
                                        <strong>John Doe</strong>
                                        <small>ID: #USR-001</small>
                                    </div>
                                </div>
                            </td>
                            <td>john@example.com</td>
                            <td>+1 (555) 123-4567</td>
                            <td><span class="role customer">Customer</span></td>
                            <td><span class="status active">Active</span></td>
                            <td>2 hours ago</td>
                            <td>
                                <button class="btn btn-sm btn-primary" onclick="editUser(1)">Edit</button>
                                <button class="btn btn-sm btn-info" onclick="viewUser(1)">View</button>
                                <button class="btn btn-sm btn-warning" onclick="suspendUser(1)">Suspend</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <img src="https://via.placeholder.com/40x40" alt="User" class="user-avatar">
                                    <div>
                                        <strong>Jane Smith</strong>
                                        <small>ID: #USR-002</small>
                                    </div>
                                </div>
                            </td>
                            <td>jane@example.com</td>
                            <td>+1 (555) 234-5678</td>
                            <td><span class="role customer">Customer</span></td>
                            <td><span class="status active">Active</span></td>
                            <td>1 day ago</td>
                            <td>
                                <button class="btn btn-sm btn-primary" onclick="editUser(2)">Edit</button>
                                <button class="btn btn-sm btn-info" onclick="viewUser(2)">View</button>
                                <button class="btn btn-sm btn-warning" onclick="suspendUser(2)">Suspend</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <img src="https://via.placeholder.com/40x40" alt="User" class="user-avatar">
                                    <div>
                                        <strong>Mike Johnson</strong>
                                        <small>ID: #USR-003</small>
                                    </div>
                                </div>
                            </td>
                            <td>mike@example.com</td>
                            <td>+1 (555) 345-6789</td>
                            <td><span class="role staff">Staff</span></td>
                            <td><span class="status active">Active</span></td>
                            <td>3 hours ago</td>
                            <td>
                                <button class="btn btn-sm btn-primary" onclick="editUser(3)">Edit</button>
                                <button class="btn btn-sm btn-info" onclick="viewUser(3)">View</button>
                                <button class="btn btn-sm btn-warning" onclick="suspendUser(3)">Suspend</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <img src="https://via.placeholder.com/40x40" alt="User" class="user-avatar">
                                    <div>
                                        <strong>Sarah Wilson</strong>
                                        <small>ID: #USR-004</small>
                                    </div>
                                </div>
                            </td>
                            <td>sarah@example.com</td>
                            <td>+1 (555) 456-7890</td>
                            <td><span class="role customer">Customer</span></td>
                            <td><span class="status suspended">Suspended</span></td>
                            <td>1 week ago</td>
                            <td>
                                <button class="btn btn-sm btn-primary" onclick="editUser(4)">Edit</button>
                                <button class="btn btn-sm btn-info" onclick="viewUser(4)">View</button>
                                <button class="btn btn-sm btn-success" onclick="activateUser(4)">Activate</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <button class="btn btn-sm" disabled>Previous</button>
                <span class="page-info">Page 1 of 15</span>
                <button class="btn btn-sm">Next</button>
            </div>
        </main>
    </div>

    <!-- User Modal -->
    <div id="userModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 id="userModalTitle">Add User</h2>
                <span class="close" onclick="closeUserModal()">&times;</span>
            </div>
            <form id="userForm">
                <div class="form-group">
                    <label for="userFirstName">First Name</label>
                    <input type="text" id="userFirstName" required>
                </div>
                <div class="form-group">
                    <label for="userLastName">Last Name</label>
                    <input type="text" id="userLastName" required>
                </div>
                <div class="form-group">
                    <label for="userEmail">Email</label>
                    <input type="email" id="userEmail" required>
                </div>
                <div class="form-group">
                    <label for="userPhone">Phone</label>
                    <input type="tel" id="userPhone">
                </div>
                <div class="form-group">
                    <label for="userRole">Role</label>
                    <select id="userRole" required>
                        <option value="">Select Role</option>
                        <option value="customer">Customer</option>
                        <option value="staff">Staff</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="userStatus">Status</label>
                    <select id="userStatus" required>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                        <option value="suspended">Suspended</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="userAddress">Address</label>
                    <textarea id="userAddress" rows="3"></textarea>
                </div>
                <div class="modal-actions">
                    <button type="button" class="btn btn-secondary" onclick="closeUserModal()">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save User</button>
                </div>
            </form>
        </div>
    </div>

    <!-- User Details Modal -->
    <div id="userDetailsModal" class="modal">
        <div class="modal-content large">
            <div class="modal-header">
                <h2>User Details - John Doe</h2>
                <span class="close" onclick="closeUserDetailsModal()">&times;</span>
            </div>
            <div class="user-details">
                <div class="user-profile">
                    <img src="https://via.placeholder.com/150x150" alt="User" class="user-avatar-large">
                    <h3>John Doe</h3>
                    <p class="user-role">Customer</p>
                    <span class="status active">Active</span>
                </div>
                <div class="user-info-details">
                    <div class="info-section">
                        <h3>Contact Information</h3>
                        <p><strong>Email:</strong> john@example.com</p>
                        <p><strong>Phone:</strong> +1 (555) 123-4567</p>
                        <p><strong>Address:</strong> 123 Main St, City, State 12345</p>
                    </div>
                    <div class="info-section">
                        <h3>Account Information</h3>
                        <p><strong>User ID:</strong> #USR-001</p>
                        <p><strong>Member Since:</strong> January 1, 2024</p>
                        <p><strong>Last Login:</strong> 2 hours ago</p>
                        <p><strong>Total Orders:</strong> 15</p>
                    </div>
                    <div class="info-section">
                        <h3>Recent Orders</h3>
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Date</th>
                                    <th>Total</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#ORD-001</td>
                                    <td>Jan 15, 2024</td>
                                    <td>$125.50</td>
                                    <td><span class="status delivered">Delivered</span></td>
                                </tr>
                                <tr>
                                    <td>#ORD-002</td>
                                    <td>Jan 10, 2024</td>
                                    <td>$89.25</td>
                                    <td><span class="status delivered">Delivered</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>


</asp:Content>
