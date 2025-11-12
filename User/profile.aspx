<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="Online_Medicine_Ordering.User.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Profile - MediCare</title>
        <link rel="stylesheet" href="../Assets/css/style.css">
        <link rel="icon" href="../Assets/images/favicon.ico" type="image/x-icon">
    </head>
    <body>
        <!-- Header -->
        <header class="header">
            <nav class="navbar">
                <a href="../Home/index.aspx" class="logo">MediCare</a>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Page Header -->
    <section class="hero" style="height: 200px;">
        <div class="hero-content">
            <h1>My Profile</h1>
            <p>Manage your account and health information</p>
        </div>
    </section>

    <!-- Profile Content -->
    <section class="container">
        <div class="grid grid-2" style="margin: 2rem 0; gap: 2rem;">
            <!-- Profile Navigation -->
            <div>
                <div class="card">
                    <div class="card-content">
                        <div style="text-align: center; margin-bottom: 2rem;">
                            <div style="width: 100px; height: 100px; background: #667eea; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 1rem;">
                                <span style="color: white; font-size: 2rem; font-weight: bold;" id="userInitials">JD</span>
                            </div>
                            <h2 id="userName">John Doe</h2>
                            <p style="color: #666;" id="userEmail">john.doe@example.com</p>
                        </div>

                        <nav style="display: flex; flex-direction: column; gap: 0.5rem;">
                            <button class="btn btn-secondary tab-btn active" onclick="showTab('personal')" style="justify-content: flex-start;">
                                👤 Personal Information
                            </button>
                            <button class="btn btn-secondary tab-btn" onclick="showTab('health')" style="justify-content: flex-start;">
                                🏥 Health Information
                            </button>
                            <button class="btn btn-secondary tab-btn" onclick="showTab('address')" style="justify-content: flex-start;">
                                📍 Address Book
                            </button>
                            <button class="btn btn-secondary tab-btn" onclick="showTab('payment')" style="justify-content: flex-start;">
                                💳 Payment Methods
                            </button>
                            <button class="btn btn-secondary tab-btn" onclick="showTab('security')" style="justify-content: flex-start;">
                                🔒 Security Settings
                            </button>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- Profile Content -->
            <div>
                <!-- Personal Information Tab -->
                <div id="personal" class="tab-content">
                    <div class="card">
                        <div class="card-content">
                            <h2>Personal Information</h2>
                            <form id="personalForm">
                                <div class="grid grid-2">
                                    <div class="form-group">
                                        <label for="firstName">First Name *</label>
                                        <input type="text" id="firstName" name="firstName" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="lastName">Last Name *</label>
                                        <input type="text" id="lastName" name="lastName" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email Address *</label>
                                    <input type="email" id="email" name="email" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="phone">Phone Number *</label>
                                    <input type="tel" id="phone" name="phone" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="dateOfBirth">Date of Birth *</label>
                                    <input type="date" id="dateOfBirth" name="dateOfBirth" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <select id="gender" name="gender" class="form-control">
                                        <option value="">Select Gender</option>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                        <option value="other">Other</option>
                                        <option value="prefer-not-to-say">Prefer not to say</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-primary">Update Information</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Health Information Tab -->
                <div id="health" class="tab-content" style="display: none;">
                    <div class="card">
                        <div class="card-content">
                            <h2>Health Information</h2>
                            <p style="color: #666; margin-bottom: 2rem;">This information helps us provide better healthcare recommendations and ensure medication safety.</p>

                            <form id="healthForm">
                                <div class="form-group">
                                    <label for="allergies">Known Allergies</label>
                                    <textarea id="allergies" name="allergies" class="form-control" rows="3" placeholder="List any known allergies to medications or substances"></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="medicalConditions">Medical Conditions</label>
                                    <textarea id="medicalConditions" name="medicalConditions" class="form-control" rows="3" placeholder="List any chronic medical conditions"></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="currentMedications">Current Medications</label>
                                    <textarea id="currentMedications" name="currentMedications" class="form-control" rows="3" placeholder="List medications you are currently taking"></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="emergencyContact">Emergency Contact</label>
                                    <input type="text" id="emergencyContact" name="emergencyContact" class="form-control" placeholder="Name and phone number">
                                </div>

                                <div class="form-group">
                                    <label for="bloodType">Blood Type</label>
                                    <select id="bloodType" name="bloodType" class="form-control">
                                        <option value="">Select Blood Type</option>
                                        <option value="A+">A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-">B-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-">AB-</option>
                                        <option value="O+">O+</option>
                                        <option value="O-">O-</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-primary">Update Health Information</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Address Book Tab -->
                <div id="address" class="tab-content" style="display: none;">
                    <div class="card">
                        <div class="card-content">
                            <h2>Address Book</h2>
                            <p style="color: #666; margin-bottom: 2rem;">Manage your delivery addresses for faster checkout.</p>

                            <div id="addressList">
                                <!-- Addresses will be populated by JavaScript -->
                            </div>

                            <button onclick="openModal('addAddressModal')" class="btn btn-primary">Add New Address</button>
                        </div>
                    </div>
                </div>

                <!-- Payment Methods Tab -->
                <div id="payment" class="tab-content" style="display: none;">
                    <div class="card">
                        <div class="card-content">
                            <h2>Payment Methods</h2>
                            <p style="color: #666; margin-bottom: 2rem;">Manage your saved payment methods for faster checkout.</p>

                            <div id="paymentList">
                                <!-- Payment methods will be populated by JavaScript -->
                            </div>

                            <button onclick="openModal('addPaymentModal')" class="btn btn-primary">Add New Payment Method</button>
                        </div>
                    </div>
                </div>

                <!-- Security Settings Tab -->
                <div id="security" class="tab-content" style="display: none;">
                    <div class="card">
                        <div class="card-content">
                            <h2>Security Settings</h2>

                            <div style="margin: 2rem 0;">
                                <h3>Change Password</h3>
                                <form id="passwordForm">
                                    <div class="form-group">
                                        <label for="currentPassword">Current Password *</label>
                                        <input type="password" id="currentPassword" name="currentPassword" class="form-control" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="newPassword">New Password *</label>
                                        <input type="password" id="newPassword" name="newPassword" class="form-control" required minlength="8">
                                    </div>

                                    <div class="form-group">
                                        <label for="confirmNewPassword">Confirm New Password *</label>
                                        <input type="password" id="confirmNewPassword" name="confirmNewPassword" class="form-control" required>
                                    </div>

                                    <button type="submit" class="btn btn-primary">Change Password</button>
                                </form>
                            </div>

                            <div style="margin: 2rem 0;">
                                <h3>Two-Factor Authentication</h3>
                                <p style="color: #666;">Add an extra layer of security to your account.</p>
                                <button class="btn btn-secondary">Enable 2FA</button>
                            </div>

                            <div style="margin: 2rem 0;">
                                <h3>Account Actions</h3>
                                <button onclick="logout()" class="btn btn-danger">Logout</button>
                                <button onclick="deleteAccount()" class="btn btn-danger" style="margin-left: 1rem;">Delete Account</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Add Address Modal -->
    <div id="addAddressModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addAddressModal')">&times;</span>
            <h2>Add New Address</h2>

            <form id="addAddressForm">
                <div class="form-group">
                    <label for="addressName">Address Name *</label>
                    <input type="text" id="addressName" name="addressName" class="form-control" placeholder="e.g., Home, Work" required>
                </div>

                <div class="form-group">
                    <label for="streetAddress">Street Address *</label>
                    <input type="text" id="streetAddress" name="streetAddress" class="form-control" required>
                </div>

                <div class="grid grid-2">
                    <div class="form-group">
                        <label for="addressCity">City *</label>
                        <input type="text" id="addressCity" name="addressCity" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="addressState">State *</label>
                        <select id="addressState" name="addressState" class="form-control" required>
                            <option value="">Select State</option>
                            <option value="CA">California</option>
                            <option value="NY">New York</option>
                            <option value="TX">Texas</option>
                            <option value="FL">Florida</option>
                            <option value="IL">Illinois</option>
                        </select>
                    </div>
                </div>

                <div class="grid grid-2">
                    <div class="form-group">
                        <label for="addressZip">ZIP Code *</label>
                        <input type="text" id="addressZip" name="addressZip" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="addressCountry">Country *</label>
                        <select id="addressCountry" name="addressCountry" class="form-control" required>
                            <option value="US">United States</option>
                            <option value="CA">Canada</option>
                            <option value="MX">Mexico</option>
                        </select>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Add Address</button>
            </form>
        </div>
    </div>

    <!-- Add Payment Modal -->
    <div id="addPaymentModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addPaymentModal')">&times;</span>
            <h2>Add Payment Method</h2>

            <form id="addPaymentForm">
                <div class="form-group">
                    <label for="paymentType">Payment Type *</label>
                    <select id="paymentType" name="paymentType" class="form-control" required>
                        <option value="">Select Payment Type</option>
                        <option value="credit">Credit Card</option>
                        <option value="debit">Debit Card</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="cardNumber">Card Number *</label>
                    <input type="text" id="cardNumber" name="cardNumber" class="form-control" placeholder="1234 5678 9012 3456" required>
                </div>

                <div class="grid grid-2">
                    <div class="form-group">
                        <label for="expiryDate">Expiry Date *</label>
                        <input type="text" id="expiryDate" name="expiryDate" class="form-control" placeholder="MM/YY" required>
                    </div>
                    <div class="form-group">
                        <label for="cvv">CVV *</label>
                        <input type="text" id="cvv" name="cvv" class="form-control" placeholder="123" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="cardName">Name on Card *</label>
                    <input type="text" id="cardName" name="cardName" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-primary">Add Payment Method</button>
            </form>
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
