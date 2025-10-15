<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="Online_Medicine_Ordering.Shop.categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Medicine Categories - MediCare</title>
        <link rel="stylesheet" href="../Assets/css/style.css">
        <link rel="icon" href="../Assets/images/favicon.ico" type="image/x-icon">
    </head>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <body>
        <!-- Header -->
        <header class="header">
            <nav class="navbar">
                <a href="../Home/index.html" class="logo">MediCare</a>
                <ul class="nav-links">
                    <li><a href="../Home/index.aspx">Home</a></li>
                    <li><a href="medicines.aspx">Medicines</a></li>
                    <li><a href="categories.aspx">Categories</a></li>
                    <li><a href="../Home/about.aspx">About</a></li>
                    <li><a href="../Home/contact.aspx">Contact</a></li>
                </ul>
                <div class="user-actions">
                    <a href="../User/login.html" class="btn btn-secondary" id="loginBtn">Login</a>
                    <a href="../User/register.html" class="btn btn-primary" id="registerBtn">Register</a>
                    <div id="userMenu" style="display: none;"></div>
                    <a href="cart.aspx" class="btn btn-primary">Cart (<span id="cartCount">0</span>)
                    </a>
                </div>
            </nav>
        </header>

        <!-- Page Header -->
        <section class="hero" style="height: 200px;">
            <div class="hero-content">
                <h1>Medicine Categories</h1>
                <p>Browse medicines by category for easy navigation</p>
            </div>
        </section>

        <!-- Categories Grid -->
        <section class="container">
            <div class="grid grid-2" style="margin: 4rem 0;">
                <!-- Tablets & Capsules -->
                <div class="card">
                    <img src="../../images/tablets.jpeg" alt="Tablets & Capsules" class="card-img">
                    <div class="card-content">
                        <h2 class="card-title">Tablets & Capsules</h2>
                        <p class="card-text">Prescription and over-the-counter tablets and capsules for various health conditions.</p>
                        <ul style="margin: 1rem 0; padding-left: 2rem;">
                            <li>Pain Relief Tablets</li>
                            <li>Antibiotics</li>
                            <li>Blood Pressure Medication</li>
                            <li>Diabetes Medication</li>
                            <li>Heart Medication</li>
                            <li>Digestive Health</li>
                        </ul>
                        <div style="margin: 1.5rem 0;">
                            <span style="background: #e9ecef; padding: 0.5rem 1rem; border-radius: 20px; font-size: 0.9rem;">150+ Products</span>
                        </div>
                        <a href="medicines.html?category=tablets" class="btn btn-primary">Browse Tablets</a>
                    </div>
                </div>

                <!-- Syrups & Liquids -->
                <div class="card">
                    <img src="../../images/syrups.jpeg" alt="Syrups & Liquids" class="card-img">
                    <div class="card-content">
                        <h2 class="card-title">Syrups & Liquids</h2>
                        <p class="card-text">Liquid medicines including cough syrups, tonics, and oral solutions.</p>
                        <ul style="margin: 1rem 0; padding-left: 2rem;">
                            <li>Cough Syrups</li>
                            <li>Digestive Tonics</li>
                            <li>Children's Medicine</li>
                            <li>Antacids</li>
                            <li>Vitamins & Supplements</li>
                            <li>Herbal Remedies</li>
                        </ul>
                        <div style="margin: 1.5rem 0;">
                            <span style="background: #e9ecef; padding: 0.5rem 1rem; border-radius: 20px; font-size: 0.9rem;">80+ Products</span>
                        </div>
                        <a href="medicines.html?category=syrups" class="btn btn-primary">Browse Syrups</a>
                    </div>
                </div>

                <!-- Injections -->
                <div class="card">
                    <img src="../../images/injections.jpeg" alt="Injections" class="card-img">
                    <div class="card-content">
                        <h2 class="card-title">Injections & Vaccines</h2>
                        <p class="card-text">Injectable medicines, vaccines, and medical supplies for professional use.</p>
                        <ul style="margin: 1rem 0; padding-left: 2rem;">
                            <li>Insulin Pens</li>
                            <li>Vaccines</li>
                            <li>Antibiotic Injections</li>
                            <li>Pain Relief Injections</li>
                            <li>Hormone Injections</li>
                            <li>Emergency Medications</li>
                        </ul>
                        <div style="margin: 1.5rem 0;">
                            <span style="background: #e9ecef; padding: 0.5rem 1rem; border-radius: 20px; font-size: 0.9rem;">60+ Products</span>
                        </div>
                        <a href="medicines.html?category=injections" class="btn btn-primary">Browse Injections</a>
                    </div>
                </div>

                <!-- OTC Products -->
                <div class="card">
                    <img src="../../images/otc.jpeg" alt="OTC Products" class="card-img">
                    <div class="card-content">
                        <h2 class="card-title">Over-the-Counter Products</h2>
                        <p class="card-text">Non-prescription health products and medical supplies available without a prescription.</p>
                        <ul style="margin: 1rem 0; padding-left: 2rem;">
                            <li>First Aid Supplies</li>
                            <li>Bandages & Dressings</li>
                            <li>Thermometers</li>
                            <li>Blood Pressure Monitors</li>
                            <li>Glucose Meters</li>
                            <li>Health Monitors</li>
                        </ul>
                        <div style="margin: 1.5rem 0;">
                            <span style="background: #e9ecef; padding: 0.5rem 1rem; border-radius: 20px; font-size: 0.9rem;">120+ Products</span>
                        </div>
                        <a href="medicines.html?category=otc" class="btn btn-primary">Browse OTC Products</a>
                    </div>
                </div>

                <!-- Vitamins & Supplements -->
                <div class="card">
                    <img src="../../images/multivitamin.jpeg" alt="Vitamins & Supplements" class="card-img">
                    <div class="card-content">
                        <h2 class="card-title">Vitamins & Supplements</h2>
                        <p class="card-text">Essential vitamins, minerals, and dietary supplements for overall health and wellness.</p>
                        <ul style="margin: 1rem 0; padding-left: 2rem;">
                            <li>Multivitamins</li>
                            <li>Vitamin D3</li>
                            <li>Omega-3 Supplements</li>
                            <li>Probiotics</li>
                            <li>Calcium Supplements</li>
                            <li>Iron Supplements</li>
                        </ul>
                        <div style="margin: 1.5rem 0;">
                            <span style="background: #e9ecef; padding: 0.5rem 1rem; border-radius: 20px; font-size: 0.9rem;">90+ Products</span>
                        </div>
                        <a href="medicines.html?category=vitamins" class="btn btn-primary">Browse Vitamins</a>
                    </div>
                </div>

                <!-- Prescription Medicines -->
                <div class="card">
                    <img src="../../images/paracetamol.jpeg" alt="Prescription Medicines" class="card-img">
                    <div class="card-content">
                        <h2 class="card-title">Prescription Medicines</h2>
                        <p class="card-text">Prescription-only medications that require a valid prescription from a licensed healthcare provider.</p>
                        <ul style="margin: 1rem 0; padding-left: 2rem;">
                            <li>Cardiovascular Drugs</li>
                            <li>Antibiotics</li>
                            <li>Diabetes Medications</li>
                            <li>Mental Health Medications</li>
                            <li>Cancer Treatments</li>
                            <li>Specialty Medications</li>
                        </ul>
                        <div style="margin: 1.5rem 0;">
                            <span style="background: #e9ecef; padding: 0.5rem 1rem; border-radius: 20px; font-size: 0.9rem;">200+ Products</span>
                        </div>
                        <a href="../User/prescriptions.html" class="btn btn-primary">Upload Prescription</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Featured Products by Category -->
        <section class="container">
            <h2 class="text-center mb-4">Featured Products</h2>

            <!-- Tablets Section -->
            <div class="card" style="margin: 2rem 0;">
                <div class="card-content">
                    <h3>Popular Tablets</h3>
                    <div class="grid grid-3">
                        <div class="card product-card" data-category="tablets" data-price="15.99" data-name="Paracetamol 500mg">
                            <img src="../../images/paracetamol.jpeg" alt="Paracetamol" class="card-img">
                            <div class="card-content">
                                <h4 class="card-title">Paracetamol 500mg</h4>
                                <div class="price">$15.99</div>
                                <button class="btn btn-primary add-to-cart"
                                    data-product-id="1"
                                    data-product-name="Paracetamol 500mg"
                                    data-product-price="15.99"
                                    data-product-image="../../images/paracetamol.jpeg">
                                    Add to Cart
                                </button>
                            </div>
                        </div>
                        <div class="card product-card" data-category="tablets" data-price="22.99" data-name="Ibuprofen 400mg">
                            <img src="../../images/ibuprofen.jpeg" alt="Ibuprofen" class="card-img">
                            <div class="card-content">
                                <h4 class="card-title">Ibuprofen 400mg</h4>
                                <div class="price">$22.99</div>
                                <button class="btn btn-primary add-to-cart"
                                    data-product-id="4"
                                    data-product-name="Ibuprofen 400mg"
                                    data-product-price="22.99"
                                    data-product-image="../../images/ibuprofen.jpeg">
                                    Add to Cart
                                </button>
                            </div>
                        </div>
                        <div class="card product-card" data-category="tablets" data-price="35.99" data-name="Blood Pressure Medication">
                            <img src="../../images/bloodpressure.jpeg" alt="Blood Pressure Medication" class="card-img">
                            <div class="card-content">
                                <h4 class="card-title">Blood Pressure Medication</h4>
                                <div class="price">$35.99</div>
                                <button class="btn btn-primary add-to-cart"
                                    data-product-id="9"
                                    data-product-name="Blood Pressure Medication"
                                    data-product-price="35.99"
                                    data-product-image="../../images/bloodpressure.jpeg">
                                    Add to Cart
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="text-center" style="margin-top: 1rem;">
                        <a href="medicines.html?category=tablets" class="btn btn-secondary">View All Tablets</a>
                    </div>
                </div>
            </div>

            <!-- Vitamins Section -->
            <div class="card" style="margin: 2rem 0;">
                <div class="card-content">
                    <h3>Popular Vitamins</h3>
                    <div class="grid grid-3">
                        <div class="card product-card" data-category="vitamins" data-price="8.99" data-name="Vitamin D3">
                            <img src="../../images/vitaminD3.jpeg" alt="Vitamin D3" class="card-img">
                            <div class="card-content">
                                <h4 class="card-title">Vitamin D3</h4>
                                <div class="price">$8.99</div>
                                <button class="btn btn-primary add-to-cart"
                                    data-product-id="3"
                                    data-product-name="Vitamin D3"
                                    data-product-price="8.99"
                                    data-product-image="../../images/vitaminD3.jpeg">
                                    Add to Cart
                                </button>
                            </div>
                        </div>
                        <div class="card product-card" data-category="vitamins" data-price="14.99" data-name="Multivitamin">
                            <img src="../../images/multivitamin.jpeg" alt="Multivitamin" class="card-img">
                            <div class="card-content">
                                <h4 class="card-title">Multivitamin</h4>
                                <div class="price">$14.99</div>
                                <button class="btn btn-primary add-to-cart"
                                    data-product-id="6"
                                    data-product-name="Multivitamin"
                                    data-product-price="14.99"
                                    data-product-image="../../images/multivitamin.jpeg">
                                    Add to Cart
                                </button>
                            </div>
                        </div>
                        <div class="card product-card" data-category="vitamins" data-price="19.99" data-name="Omega-3">
                            <img src="../../images/multivitamin1.jpeg" alt="Omega-3" class="card-img">
                            <div class="card-content">
                                <h4 class="card-title">Omega-3</h4>
                                <div class="price">$19.99</div>
                                <button class="btn btn-primary add-to-cart"
                                    data-product-id="10"
                                    data-product-name="Omega-3"
                                    data-product-price="19.99"
                                    data-product-image="../../images/multivitamin1.jpeg">
                                    Add to Cart
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="text-center" style="margin-top: 1rem;">
                        <a href="medicines.html?category=vitamins" class="btn btn-secondary">View All Vitamins</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Health Information -->
        <section class="container">
            <div class="card" style="background: #f8f9fa; margin: 4rem 0;">
                <div class="card-content">
                    <h2 class="text-center">Health Information & Safety</h2>
                    <div class="grid grid-2">
                        <div>
                            <h3>🔒 Prescription Safety</h3>
                            <p>All prescription medicines require a valid prescription from a licensed healthcare provider. We verify all prescriptions before dispensing.</p>

                            <h3>💊 Medication Guidelines</h3>
                            <p>Always follow your doctor's instructions and read medication labels carefully. Consult your pharmacist for any questions.</p>
                        </div>
                        <div>
                            <h3>📋 Drug Interactions</h3>
                            <p>Inform your healthcare provider about all medications you're taking to avoid potential drug interactions.</p>

                            <h3>🚨 Emergency Information</h3>
                            <p>In case of medication overdose or adverse reactions, contact emergency services immediately.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

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

        <script src="../Assets/js/main.js"></script>
</asp:Content>
