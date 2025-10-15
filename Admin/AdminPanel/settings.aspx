<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeFile="settings.aspx.cs" Inherits="Online_Medicine_Ordering.Admin.AdminPanel.settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings - Pharmacy Admin</title>
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
                <li><a href="users.aspx"><i class="fas fa-users"></i> Users</a></li>
                <li><a href="reports.aspx"><i class="fas fa-chart-bar"></i> Reports</a></li>
                <li class="active"><a href="settings.aspx"><i class="fas fa-cog"></i> Settings</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <header class="header">
                <div class="header-left">
                    <h1>Settings</h1>
                    <p>Configure your pharmacy system</p>
                </div>
            </header>

            <!-- Settings Tabs -->
            <div class="settings-tabs">
                <button class="tab-btn active" onclick="showSettingsTab('general')">General</button>
                <button class="tab-btn" onclick="showSettingsTab('pharmacy')">Pharmacy Info</button>
                <button class="tab-btn" onclick="showSettingsTab('payment')">Payment</button>
                <button class="tab-btn" onclick="showSettingsTab('delivery')">Delivery</button>
                <button class="tab-btn" onclick="showSettingsTab('notifications')">Notifications</button>
                <button class="tab-btn" onclick="showSettingsTab('security')">Security</button>
            </div>

            <!-- General Settings -->
            <div id="generalSettings" class="settings-content active">
                <div class="settings-section">
                    <h3>General Settings</h3>
                    <form id="generalForm">
                        <div class="form-group">
                            <label for="siteName">Site Name</label>
                            <input type="text" id="siteName" value="Pharmacy Management System">
                        </div>
                        <div class="form-group">
                            <label for="siteDescription">Site Description</label>
                            <textarea id="siteDescription" rows="3">Your trusted online pharmacy for quality medicines and healthcare products.</textarea>
                        </div>
                        <div class="form-group">
                            <label for="timezone">Timezone</label>
                            <select id="timezone">
                                <option value="UTC-5">Eastern Time (UTC-5)</option>
                                <option value="UTC-6">Central Time (UTC-6)</option>
                                <option value="UTC-7">Mountain Time (UTC-7)</option>
                                <option value="UTC-8">Pacific Time (UTC-8)</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="currency">Currency</label>
                            <select id="currency">
                                <option value="USD">USD ($)</option>
                                <option value="EUR">EUR (€)</option>
                                <option value="GBP">GBP (£)</option>
                                <option value="CAD">CAD (C$)</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="language">Language</label>
                            <select id="language">
                                <option value="en">English</option>
                                <option value="es">Spanish</option>
                                <option value="fr">French</option>
                                <option value="de">German</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Save General Settings</button>
                    </form>
                </div>
            </div>

            <!-- Pharmacy Info Settings -->
            <div id="pharmacySettings" class="settings-content">
                <div class="settings-section">
                    <h3>Pharmacy Information</h3>
                    <form id="pharmacyForm">
                        <div class="form-group">
                            <label for="pharmacyName">Pharmacy Name</label>
                            <input type="text" id="pharmacyName" value="MediCare Pharmacy">
                        </div>
                        <div class="form-group">
                            <label for="pharmacyLicense">License Number</label>
                            <input type="text" id="pharmacyLicense" value="PH-12345-2024">
                        </div>
                        <div class="form-group">
                            <label for="pharmacyAddress">Address</label>
                            <textarea id="pharmacyAddress" rows="3">123 Health Street, Medical City, MC 12345</textarea>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="pharmacyPhone">Phone</label>
                                <input type="tel" id="pharmacyPhone" value="+1 (555) 123-4567">
                            </div>
                            <div class="form-group">
                                <label for="pharmacyEmail">Email</label>
                                <input type="email" id="pharmacyEmail" value="info@medicarepharmacy.com">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pharmacyHours">Operating Hours</label>
                            <input type="text" id="pharmacyHours" value="Mon-Fri: 8AM-8PM, Sat: 9AM-6PM, Sun: 10AM-4PM">
                        </div>
                        <button type="submit" class="btn btn-primary">Save Pharmacy Info</button>
                    </form>
                </div>
            </div>

            <!-- Payment Settings -->
            <div id="paymentSettings" class="settings-content">
                <div class="settings-section">
                    <h3>Payment Settings</h3>
                    <form id="paymentForm">
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="enableCreditCard" checked>
                                <span class="checkmark"></span>
                                Enable Credit Card Payments
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="enablePayPal" checked>
                                <span class="checkmark"></span>
                                Enable PayPal
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="enableStripe">
                                <span class="checkmark"></span>
                                Enable Stripe
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="enableCashOnDelivery" checked>
                                <span class="checkmark"></span>
                                Enable Cash on Delivery
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="stripeKey">Stripe Public Key</label>
                            <input type="text" id="stripeKey" placeholder="pk_test_...">
                        </div>
                        <div class="form-group">
                            <label for="paypalClientId">PayPal Client ID</label>
                            <input type="text" id="paypalClientId" placeholder="Your PayPal Client ID">
                        </div>
                        <button type="submit" class="btn btn-primary">Save Payment Settings</button>
                    </form>
                </div>
            </div>

            <!-- Delivery Settings -->
            <div id="deliverySettings" class="settings-content">
                <div class="settings-section">
                    <h3>Delivery Settings</h3>
                    <form id="deliveryForm">
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="enableDelivery" checked>
                                <span class="checkmark"></span>
                                Enable Delivery Service
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="deliveryFee">Standard Delivery Fee ($)</label>
                            <input type="number" id="deliveryFee" value="5.99" step="0.01">
                        </div>
                        <div class="form-group">
                            <label for="freeDeliveryThreshold">Free Delivery Threshold ($)</label>
                            <input type="number" id="freeDeliveryThreshold" value="50.00" step="0.01">
                        </div>
                        <div class="form-group">
                            <label for="deliveryTime">Standard Delivery Time (days)</label>
                            <input type="number" id="deliveryTime" value="2" min="1">
                        </div>
                        <div class="form-group">
                            <label for="expressDeliveryFee">Express Delivery Fee ($)</label>
                            <input type="number" id="expressDeliveryFee" value="12.99" step="0.01">
                        </div>
                        <div class="form-group">
                            <label for="expressDeliveryTime">Express Delivery Time (hours)</label>
                            <input type="number" id="expressDeliveryTime" value="24" min="1">
                        </div>
                        <div class="form-group">
                            <label for="deliveryZones">Delivery Zones</label>
                            <textarea id="deliveryZones" rows="4" placeholder="Zone 1: Downtown (Free delivery)
Zone 2: Suburbs ($5.99 delivery fee)
Zone 3: Outskirts ($12.99 delivery fee)"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Delivery Settings</button>
                    </form>
                </div>
            </div>

            <!-- Notification Settings -->
            <div id="notificationSettings" class="settings-content">
                <div class="settings-section">
                    <h3>Notification Settings</h3>
                    <form id="notificationForm">
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="emailNotifications" checked>
                                <span class="checkmark"></span>
                                Enable Email Notifications
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="smsNotifications">
                                <span class="checkmark"></span>
                                Enable SMS Notifications
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="orderNotifications" checked>
                                <span class="checkmark"></span>
                                New Order Notifications
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="lowStockNotifications" checked>
                                <span class="checkmark"></span>
                                Low Stock Notifications
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="prescriptionNotifications" checked>
                                <span class="checkmark"></span>
                                Prescription Upload Notifications
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="adminEmail">Admin Email</label>
                            <input type="email" id="adminEmail" value="admin@medicarepharmacy.com">
                        </div>
                        <div class="form-group">
                            <label for="smsApiKey">SMS API Key</label>
                            <input type="text" id="smsApiKey" placeholder="Your SMS API Key">
                        </div>
                        <button type="submit" class="btn btn-primary">Save Notification Settings</button>
                    </form>
                </div>
            </div>

            <!-- Security Settings -->
            <div id="securitySettings" class="settings-content">
                <div class="settings-section">
                    <h3>Security Settings</h3>
                    <form id="securityForm">
                        <div class="form-group">
                            <label for="sessionTimeout">Session Timeout (minutes)</label>
                            <input type="number" id="sessionTimeout" value="30" min="5">
                        </div>
                        <div class="form-group">
                            <label for="maxLoginAttempts">Max Login Attempts</label>
                            <input type="number" id="maxLoginAttempts" value="5" min="3">
                        </div>
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="requireTwoFactor" checked>
                                <span class="checkmark"></span>
                                Require Two-Factor Authentication
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="enableAuditLog" checked>
                                <span class="checkmark"></span>
                                Enable Audit Logging
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="requireStrongPasswords" checked>
                                <span class="checkmark"></span>
                                Require Strong Passwords
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="passwordExpiry">Password Expiry (days)</label>
                            <input type="number" id="passwordExpiry" value="90" min="30">
                        </div>
                        <button type="submit" class="btn btn-primary">Save Security Settings</button>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <script src="script.js"></script>
</body>
</html>

</asp:Content>
