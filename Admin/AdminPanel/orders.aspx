<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="Online_Medicine_Ordering.Admin.AdminPanel.orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Orders Management - Medicine Admin</title>
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
                    <h2><i class="fas fa-pills"></i>Pharmacy Admin</h2>
                </div>
                <ul class="sidebar-menu">
                    <li><a href="dashboard.aspx"><i class="fas fa-tachometer-alt"></i>Dashboard</a></li>
                    <li><a href="medicines.aspx"><i class="fas fa-pills"></i>Medicines</a></li>
                    <li><a href="categories.aspx"><i class="fas fa-tags"></i>Categories</a></li>
                    <li class="active"><a href="orders.aspx"><i class="fas fa-shopping-cart"></i>Orders</a></li>
                    <li><a href="users.aspx"><i class="fas fa-users"></i>Users</a></li>
                </ul>
            </nav>

        <%--    <!-- Main Content -->
            <main class="main-content">
                <header class="header">
                    <div class="header-left">
                        <h1>Orders Management</h1>
                        <p>Track and manage customer orders</p>
                    </div>
                    <div class="header-right">
                        <div class="header-stats">
                            <div class="stat-item">
                                <span class="stat-label">Pending:</span>
                                <span class="stat-value pending">12</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-label">Processing:</span>
                                <span class="stat-value processing">8</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-label">Delivered:</span>
                                <span class="stat-value delivered">156</span>
                            </div>
                        </div>
                    </div>
                </header>--%>

                <center>
        <h2>Manage Orders</h2>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="order-grid">
            <Columns>

                <asp:TemplateField HeaderText="Order ID">
                    <ItemTemplate>
                        <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("order_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="User ID">
                    <ItemTemplate>
                        <asp:Label ID="lblUserId" runat="server" Text='<%# Eval("user_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Order Date">
                    <ItemTemplate>
                        <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("Order_Date","{0:dd-MM-yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Total Amount">
                    <ItemTemplate>
                        <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Total_Amount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Order Status">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Order_Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Shipping Address">
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Shipping_Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Payment Method">
                    <ItemTemplate>
                        <asp:Label ID="lblPayment" runat="server" Text='<%# Eval("Payment_Method") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </center>
            <%--    <!-- Filters -->
                <div class="filters-section">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" id="orderSearch" placeholder="Search orders...">
                    </div>
                    <div class="filter-group">
                        <select id="statusFilter">
                            <option value="">All Status</option>
                            <option value="pending">Pending</option>
                            <option value="processing">Processing</option>
                            <option value="shipped">Shipped</option>
                            <option value="delivered">Delivered</option>
                            <option value="cancelled">Cancelled</option>
                        </select>
                        <input type="date" id="dateFilter" placeholder="Filter by date">
                        <button class="btn btn-secondary" onclick="clearFilters()">Clear Filters</button>
                    </div>
                </div>

                <!-- Orders Table -->
                <div class="table-container">
                    <table class="data-table" id="ordersTable">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer</th>
                                <th>Date</th>
                                <th>Items</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#ORD-001</td>
                                <td>
                                    <div class="customer-info">
                                        <strong>John Doe</strong>
                                        <small>john@example.com</small>
                                    </div>
                                </td>
                                <td>2024-01-15</td>
                                <td>3 items</td>
                                <td>$125.50</td>
                                <td><span class="status pending">Pending</span></td>
                                <td>
                                    <button class="btn btn-sm btn-primary" onclick="viewOrder(1)">View</button>
                                    <button class="btn btn-sm btn-success" onclick="updateOrderStatus(1)">Update</button>
                                </td>
                            </tr>
                            <tr>
                                <td>#ORD-002</td>
                                <td>
                                    <div class="customer-info">
                                        <strong>Jane Smith</strong>
                                        <small>jane@example.com</small>
                                    </div>
                                </td>
                                <td>2024-01-14</td>
                                <td>2 items</td>
                                <td>$89.25</td>
                                <td><span class="status processing">Processing</span></td>
                                <td>
                                    <button class="btn btn-sm btn-primary" onclick="viewOrder(2)">View</button>
                                    <button class="btn btn-sm btn-success" onclick="updateOrderStatus(2)">Update</button>
                                </td>
                            </tr>
                            <tr>
                                <td>#ORD-003</td>
                                <td>
                                    <div class="customer-info">
                                        <strong>Mike Johnson</strong>
                                        <small>mike@example.com</small>
                                    </div>
                                </td>
                                <td>2024-01-13</td>
                                <td>5 items</td>
                                <td>$156.75</td>
                                <td><span class="status delivered">Delivered</span></td>
                                <td>
                                    <button class="btn btn-sm btn-primary" onclick="viewOrder(3)">View</button>
                                    <button class="btn btn-sm btn-success" onclick="updateOrderStatus(3)">Update</button>
                                </td>
                            </tr>
                            <tr>
                                <td>#ORD-004</td>
                                <td>
                                    <div class="customer-info">
                                        <strong>Sarah Wilson</strong>
                                        <small>sarah@example.com</small>
                                    </div>
                                </td>
                                <td>2024-01-12</td>
                                <td>1 item</td>
                                <td>$45.99</td>
                                <td><span class="status shipped">Shipped</span></td>
                                <td>
                                    <button class="btn btn-sm btn-primary" onclick="viewOrder(4)">View</button>
                                    <button class="btn btn-sm btn-success" onclick="updateOrderStatus(4)">Update</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <div class="pagination">
                    <button class="btn btn-sm" disabled>Previous</button>
                    <span class="page-info">Page 1 of 10</span>
                    <button class="btn btn-sm">Next</button>
                </div>
            </main>
        </div>

        <!-- Order Details Modal -->
        <div id="orderModal" class="modal">
            <div class="modal-content large">
                <div class="modal-header">
                    <h2>Order Details - #ORD-001</h2>
                    <span class="close" onclick="closeOrderModal()">&times;</span>
                </div>
                <div class="order-details">
                    <div class="order-info">
                        <div class="info-section">
                            <h3>Customer Information</h3>
                            <p><strong>Name:</strong> John Doe</p>
                            <p><strong>Email:</strong> john@example.com</p>
                            <p><strong>Phone:</strong> +1 (555) 123-4567</p>
                            <p><strong>Address:</strong> 123 Main St, City, State 12345</p>
                        </div>
                        <div class="info-section">
                            <h3>Order Information</h3>
                            <p><strong>Order Date:</strong> January 15, 2024</p>
                            <p><strong>Status:</strong> <span class="status pending">Pending</span></p>
                            <p><strong>Payment Method:</strong> Credit Card</p>
                            <p><strong>Tracking Number:</strong> TRK123456789</p>
                        </div>
                    </div>
                    <div class="order-items">
                        <h3>Order Items</h3>
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Medicine</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Paracetamol 500mg</td>
                                    <td>2</td>
                                    <td>$5.99</td>
                                    <td>$11.98</td>
                                </tr>
                                <tr>
                                    <td>Ibuprofen 400mg</td>
                                    <td>1</td>
                                    <td>$8.99</td>
                                    <td>$8.99</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="3"><strong>Total:</strong></td>
                                    <td><strong>$20.97</strong></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="order-actions">
                        <button class="btn btn-success" onclick="updateOrderStatus(1)">Update Status</button>
                        <button class="btn btn-primary" onclick="printOrder(1)">Print Order</button>
                        <button class="btn btn-secondary" onclick="closeOrderModal()">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Status Update Modal -->
        <div id="statusModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Update Order Status</h2>
                    <span class="close" onclick="closeStatusModal()">&times;</span>
                </div>
                <form id="statusForm">
                    <div class="form-group">
                        <label for="newStatus">New Status</label>
                        <select id="newStatus" required>
                            <option value="pending">Pending</option>
                            <option value="processing">Processing</option>
                            <option value="shipped">Shipped</option>
                            <option value="delivered">Delivered</option>
                            <option value="cancelled">Cancelled</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="statusNote">Note (Optional)</label>
                        <textarea id="statusNote" rows="3" placeholder="Add a note about the status change..."></textarea>
                    </div>
                    <div class="modal-actions">
                        <button type="button" class="btn btn-secondary" onclick="closeStatusModal()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Update Status</button>
                    </div>
                </form>
            </div>
        </div>

        <script src="script.js"></script>
    </body>
    </html>--%>
</asp:Content>
