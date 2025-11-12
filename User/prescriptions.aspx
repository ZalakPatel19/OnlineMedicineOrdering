<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="prescriptions.aspx.cs" Inherits="Online_Medicine_Ordering.User.prescriptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Prescriptions - MediCare</title>
        <link rel="stylesheet" href="../Assets/css/style.css">
        <link rel="icon" href="../Assets/images/favicon.ico" type="image/x-icon">
    </head>
    <body>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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

    <!-- Page Header -->
    <section class="hero" style="height: 200px;">
        <div class="hero-content">
            <h1>My Prescriptions</h1>
            <p>Upload and manage your prescriptions securely</p>
        </div>
    </section>

    <!-- Prescriptions Content -->
    <section class="container">
        <!-- Upload New Prescription -->
        <div class="card" style="margin: 2rem 0;">
            <div class="card-content">
                <h2>Upload New Prescription</h2>
                <p style="color: #666; margin-bottom: 2rem;">Upload your prescription to get your medicines delivered. We accept PDF and image formats.</p>

                <form id="prescriptionForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="prescriptionFile">Select Prescription File *</label>
                        <input type="file" id="prescriptionFile" name="prescriptionFile" class="form-control" accept=".pdf,.jpg,.jpeg,.png" required>
                        <small style="color: #666;">Accepted formats: PDF, JPG, JPEG, PNG (Max 10MB)</small>
                    </div>

                    <div class="form-group">
                        <label for="prescriptionType">Prescription Type *</label>
                        <select id="prescriptionType" name="prescriptionType" class="form-control" required>
                            <option value="">Select Type</option>
                            <option value="new">New Prescription</option>
                            <option value="refill">Refill Prescription</option>
                            <option value="emergency">Emergency Prescription</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="doctorName">Doctor's Name *</label>
                        <input type="text" id="doctorName" name="doctorName" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="doctorPhone">Doctor's Phone Number</label>
                        <input type="tel" id="doctorPhone" name="doctorPhone" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="prescriptionNotes">Additional Notes</label>
                        <textarea id="prescriptionNotes" name="prescriptionNotes" class="form-control" rows="3" placeholder="Any additional information about your prescription"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="urgency">Urgency Level *</label>
                        <select id="urgency" name="urgency" class="form-control" required>
                            <option value="">Select Urgency</option>
                            <option value="normal">Normal (3-5 business days)</option>
                            <option value="urgent">Urgent (1-2 business days)</option>
                            <option value="emergency">Emergency (Same day delivery)</option>
                        </select>
                    </div>

                    <div style="background: #fff3cd; padding: 1rem; border-radius: 5px; margin: 1rem 0;">
                        <strong>⚠️ Important:</strong>
                        <ul style="margin: 0.5rem 0; padding-left: 1.5rem;">
                            <li>Ensure the prescription is clear and readable</li>
                            <li>Include all pages if the prescription is multi-page</li>
                            <li>Prescription must be from a licensed healthcare provider</li>
                            <li>We will verify the prescription before processing</li>
                        </ul>
                    </div>

                    <button type="submit" class="btn btn-primary">Upload Prescription</button>
                </form>
            </div>
        </div>

        <!-- Prescription Guidelines -->
        <div class="card" style="margin: 2rem 0;">
            <div class="card-content">
                <h2>Prescription Guidelines</h2>
                <div class="grid grid-2">
                    <div>
                        <h3>✅ What We Accept</h3>
                        <ul>
                            <li>Clear, high-quality images or PDFs</li>
                            <li>Prescriptions from licensed doctors</li>
                            <li>Valid, non-expired prescriptions</li>
                            <li>Prescriptions with clear dosage instructions</li>
                            <li>Prescriptions with doctor's signature</li>
                        </ul>
                    </div>
                    <div>
                        <h3>❌ What We Don't Accept</h3>
                        <ul>
                            <li>Blurry or unclear images</li>
                            <li>Expired prescriptions</li>
                            <li>Handwritten prescriptions (unless very clear)</li>
                            <li>Prescriptions without doctor's details</li>
                            <li>Prescriptions for controlled substances</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- My Prescriptions -->
        <div class="card" style="margin: 2rem 0;">
            <div class="card-content">
                <h2>My Prescriptions</h2>
                <div id="prescriptionsList">
                    <!-- Prescriptions will be populated by JavaScript -->
                </div>

                <div id="emptyPrescriptions" style="display: none; text-align: center; padding: 3rem;">
                    <h3>No Prescriptions Uploaded</h3>
                    <p style="color: #666; margin: 1rem 0;">Upload your first prescription to get started.</p>
                </div>
            </div>
        </div>

        <!-- Prescription Status Legend -->
        <div class="card" style="margin: 2rem 0;">
            <div class="card-content">
                <h3>Prescription Status</h3>
                <div style="display: flex; flex-wrap: wrap; gap: 2rem; margin: 1rem 0;">
                    <div style="display: flex; align-items: center; gap: 0.5rem;">
                        <div style="width: 20px; height: 20px; background: #ffc107; border-radius: 50%;"></div>
                        <span>Pending Review</span>
                    </div>
                    <div style="display: flex; align-items: center; gap: 0.5rem;">
                        <div style="width: 20px; height: 20px; background: #17a2b8; border-radius: 50%;"></div>
                        <span>Under Review</span>
                    </div>
                    <div style="display: flex; align-items: center; gap: 0.5rem;">
                        <div style="width: 20px; height: 20px; background: #28a745; border-radius: 50%;"></div>
                        <span>Approved</span>
                    </div>
                    <div style="display: flex; align-items: center; gap: 0.5rem;">
                        <div style="width: 20px; height: 20px; background: #dc3545; border-radius: 50%;"></div>
                        <span>Rejected</span>
                    </div>
                    <div style="display: flex; align-items: center; gap: 0.5rem;">
                        <div style="width: 20px; height: 20px; background: #6c757d; border-radius: 50%;"></div>
                        <span>Expired</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Prescription Details Modal -->
    <div id="prescriptionDetailsModal" class="modal">
        <div class="modal-content" style="max-width: 800px;">
            <span class="close" onclick="closeModal('prescriptionDetailsModal')">&times;</span>
            <h2>Prescription Details</h2>
            <div id="prescriptionDetailsContent">
                <!-- Prescription details will be populated by JavaScript -->
            </div>
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
