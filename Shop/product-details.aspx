<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="product-details.aspx.cs" Inherits="Online_Medicine_Ordering.Shop.product_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Details - MediCare</title>
        <link rel="stylesheet" href="../Assets/css/style.css">
        <link rel="icon" href="../Assets/images/favicon.ico" type="image/x-icon">
    </head>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <body>
        <!-- Header -->
        <header class="header">
            <nav class="navbar">
                <a href="../Home/index.aspx" class="logo">MediCare</a>
                <ul class="nav-links">
                    <li><a href="../Home/index.aspx">Home</a></li>
                    <li><a href="medicines.aspx">Medicines</a></li>
                    <li><a href="categories.aspx">Categories</a></li>
                    <li><a href="../Home/about.aspx">About</a></li>
                    <li><a href="../Home/contact.aspx">Contact</a></li>
                </ul>
                <div class="user-actions">
                    <a href="../User/login.aspx" class="btn btn-secondary" id="loginBtn">Login</a>
                    <a href="../User/register.aspx" class="btn btn-primary" id="registerBtn">Register</a>
                    <div id="userMenu" style="display: none;"></div>
                    <a href="cart.aspx" class="btn btn-primary">Cart (<span id="cartCount">0</span>)
                    </a>
                </div>
            </nav>
        </header>

        <!-- Breadcrumb -->
        <section class="container" style="margin-top: 2rem;">
            <nav style="margin-bottom: 1rem;">
                <a href="../Home/index.html">Home</a> > 
            <a href="medicines.html">Medicines</a> > 
            <a href="categories.html">Tablets</a> > 
            <span>Paracetamol 500mg</span>
            </nav>
        </section>

        <!-- Product Details -->
        <section class="container">
            <div class="grid grid-2" style="margin: 2rem 0;">
                <!-- Product Image -->
                <div>
                    <div class="card">
                        <img src="../../images/paracetamol.jpeg" alt="Paracetamol 500mg" class="card-img" style="height: 400px; object-fit: contain;">
                    </div>
                    <div class="grid grid-3" style="margin-top: 1rem;">
                        <img src="../../images/paracetamol.jpeg" alt="Paracetamol 500mg" style="width: 100%; height: 80px; object-fit: cover; border-radius: 5px; cursor: pointer;">
                        <img src="../../images/paracetamol.jpeg" alt="Paracetamol 500mg" style="width: 100%; height: 80px; object-fit: cover; border-radius: 5px; cursor: pointer;">
                        <img src="../../images/paracetamol.jpeg" alt="Paracetamol 500mg" style="width: 100%; height: 80px; object-fit: cover; border-radius: 5px; cursor: pointer;">
                    </div>
                </div>

                <!-- Product Information -->
                <div>
                    <div class="card">
                        <div class="card-content">
                            <h1>Paracetamol 500mg</h1>
                            <p style="color: #666; margin: 1rem 0;">Pain relief and fever reducer</p>

                            <div style="display: flex; align-items: center; gap: 1rem; margin: 1rem 0;">
                                <div class="price" style="font-size: 2rem;">$15.99</div>
                                <div style="background: #28a745; color: white; padding: 0.25rem 0.75rem; border-radius: 15px; font-size: 0.9rem;">
                                    In Stock
                                </div>
                            </div>

                            <div style="margin: 1.5rem 0;">
                                <h3>Product Details</h3>
                                <ul style="margin: 0.5rem 0; padding-left: 2rem;">
                                    <li><strong>Active Ingredient:</strong> Paracetamol 500mg</li>
                                    <li><strong>Pack Size:</strong> 100 tablets</li>
                                    <li><strong>Manufacturer:</strong> PharmaCorp Inc.</li>
                                    <li><strong>Expiry Date:</strong> 12/2025</li>
                                    <li><strong>Storage:</strong> Store below 25°C</li>
                                </ul>
                            </div>

                            <div style="margin: 1.5rem 0;">
                                <h3>Quantity</h3>
                                <div class="quantity-controls" style="justify-content: flex-start;">
                                    <button class="quantity-btn" onclick="updateProductQuantity('decrease')">-</button>
                                    <input type="number" id="productQuantity" class="quantity-input" value="1" min="1" max="10">
                                    <button class="quantity-btn" onclick="updateProductQuantity('increase')">+</button>
                                </div>
                            </div>

                            <div style="margin: 2rem 0;">
                                <button class="btn btn-primary add-to-cart"
                                    data-product-id="1"
                                    data-product-name="Paracetamol 500mg"
                                    data-product-price="15.99"
                                    data-product-image="../../images/paracetamol.jpeg"
                                    style="width: 100%; padding: 1rem; font-size: 1.1rem;">
                                    Add to Cart
                                </button>
                                <button class="btn btn-success" style="width: 100%; margin-top: 0.5rem; padding: 1rem; font-size: 1.1rem;">
                                    Buy Now
                                </button>
                            </div>

                            <div style="margin: 1.5rem 0;">
                                <h3>Delivery Information</h3>
                                <p>✅ Free delivery on orders over $50</p>
                                <p>✅ Same-day delivery available</p>
                                <p>✅ Express delivery in 2-4 hours</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Product Tabs -->
        <section class="container">
            <div class="card">
                <div class="card-content">
                    <div style="display: flex; gap: 1rem; margin-bottom: 2rem; border-bottom: 2px solid #e9ecef;">
                        <button class="btn btn-secondary tab-btn active" onclick="showTab('description')">Description</button>
                        <button class="btn btn-secondary tab-btn" onclick="showTab('ingredients')">Ingredients</button>
                        <button class="btn btn-secondary tab-btn" onclick="showTab('usage')">Usage Instructions</button>
                        <button class="btn btn-secondary tab-btn" onclick="showTab('side-effects')">Side Effects</button>
                        <button class="btn btn-secondary tab-btn" onclick="showTab('reviews')">Reviews</button>
                    </div>

                    <!-- Description Tab -->
                    <div id="description" class="tab-content">
                        <h3>Product Description</h3>
                        <p>Paracetamol 500mg is a widely used over-the-counter pain reliever and fever reducer. It is effective in treating mild to moderate pain and reducing fever in adults and children.</p>

                        <h4>Key Benefits:</h4>
                        <ul>
                            <li>Fast-acting pain relief</li>
                            <li>Effective fever reduction</li>
                            <li>Suitable for adults and children over 12 years</li>
                            <li>Gentle on the stomach</li>
                            <li>Non-addictive formula</li>
                        </ul>

                        <h4>When to Use:</h4>
                        <ul>
                            <li>Headaches and migraines</li>
                            <li>Toothaches</li>
                            <li>Muscle aches and pains</li>
                            <li>Fever reduction</li>
                            <li>Menstrual cramps</li>
                            <li>Arthritis pain</li>
                        </ul>
                    </div>

                    <!-- Ingredients Tab -->
                    <div id="ingredients" class="tab-content" style="display: none;">
                        <h3>Active Ingredients</h3>
                        <table style="width: 100%; border-collapse: collapse; margin: 1rem 0;">
                            <tr style="background: #f8f9fa;">
                                <th style="padding: 1rem; text-align: left; border: 1px solid #dee2e6;">Ingredient</th>
                                <th style="padding: 1rem; text-align: left; border: 1px solid #dee2e6;">Amount</th>
                                <th style="padding: 1rem; text-align: left; border: 1px solid #dee2e6;">Purpose</th>
                            </tr>
                            <tr>
                                <td style="padding: 1rem; border: 1px solid #dee2e6;">Paracetamol</td>
                                <td style="padding: 1rem; border: 1px solid #dee2e6;">500mg</td>
                                <td style="padding: 1rem; border: 1px solid #dee2e6;">Pain relief and fever reduction</td>
                            </tr>
                        </table>

                        <h3>Inactive Ingredients</h3>
                        <ul>
                            <li>Microcrystalline Cellulose</li>
                            <li>Pregelatinized Starch</li>
                            <li>Stearic Acid</li>
                            <li>Magnesium Stearate</li>
                            <li>Opadry White (Film Coating)</li>
                        </ul>
                    </div>

                    <!-- Usage Instructions Tab -->
                    <div id="usage" class="tab-content" style="display: none;">
                        <h3>Dosage Instructions</h3>

                        <h4>Adults and Children 12 years and over:</h4>
                        <ul>
                            <li>Take 1-2 tablets every 4-6 hours as needed</li>
                            <li>Do not exceed 8 tablets in 24 hours</li>
                            <li>Take with or without food</li>
                            <li>Swallow whole with water</li>
                        </ul>

                        <h4>Children 6-11 years:</h4>
                        <ul>
                            <li>Consult a healthcare provider for proper dosage</li>
                            <li>Use children's formulation when available</li>
                        </ul>

                        <h4>Important Notes:</h4>
                        <ul>
                            <li>Do not take for more than 10 days for pain or 3 days for fever</li>
                            <li>Consult a doctor if symptoms persist or worsen</li>
                            <li>Do not exceed the recommended dose</li>
                            <li>Keep out of reach of children</li>
                        </ul>
                    </div>

                    <!-- Side Effects Tab -->
                    <div id="side-effects" class="tab-content" style="display: none;">
                        <h3>Possible Side Effects</h3>

                        <h4>Common Side Effects (usually mild):</h4>
                        <ul>
                            <li>Nausea</li>
                            <li>Stomach upset</li>
                            <li>Allergic skin reactions (rare)</li>
                        </ul>

                        <h4>Serious Side Effects (seek medical attention):</h4>
                        <ul>
                            <li>Severe allergic reactions (hives, difficulty breathing)</li>
                            <li>Liver problems (yellowing of skin/eyes, dark urine)</li>
                            <li>Unusual bleeding or bruising</li>
                        </ul>

                        <h4>Drug Interactions:</h4>
                        <p>Inform your doctor if you are taking:</p>
                        <ul>
                            <li>Warfarin or other blood thinners</li>
                            <li>Other pain medications</li>
                            <li>Alcohol (limit consumption)</li>
                        </ul>

                        <div style="background: #fff3cd; padding: 1rem; border-radius: 5px; margin: 1rem 0;">
                            <strong>⚠️ Warning:</strong> Overdose can cause serious liver damage. Do not exceed the recommended dose.
                        </div>
                    </div>

                    <!-- Reviews Tab -->
                    <div id="reviews" class="tab-content" style="display: none;">
                        <h3>Customer Reviews</h3>

                        <div style="display: flex; align-items: center; gap: 1rem; margin: 1rem 0;">
                            <div style="font-size: 2rem;">⭐⭐⭐⭐⭐</div>
                            <div>
                                <strong>4.8 out of 5</strong>
                                <p style="color: #666; margin: 0;">Based on 1,247 reviews</p>
                            </div>
                        </div>

                        <div style="margin: 2rem 0;">
                            <div style="border-bottom: 1px solid #e9ecef; padding: 1rem 0;">
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.5rem;">
                                    <strong>Sarah M.</strong>
                                    <div>⭐⭐⭐⭐⭐</div>
                                </div>
                                <p>"Fast acting and effective for headaches. Always keep this in my medicine cabinet."</p>
                                <small style="color: #666;">2 days ago</small>
                            </div>

                            <div style="border-bottom: 1px solid #e9ecef; padding: 1rem 0;">
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.5rem;">
                                    <strong>John D.</strong>
                                    <div>⭐⭐⭐⭐⭐</div>
                                </div>
                                <p>"Great for fever reduction. Works quickly and doesn't upset my stomach."</p>
                                <small style="color: #666;">1 week ago</small>
                            </div>

                            <div style="border-bottom: 1px solid #e9ecef; padding: 1rem 0;">
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.5rem;">
                                    <strong>Maria L.</strong>
                                    <div>⭐⭐⭐⭐</div>
                                </div>
                                <p>"Good product, but wish it came in a larger bottle for better value."</p>
                                <small style="color: #666;">2 weeks ago</small>
                            </div>
                        </div>

                        <button class="btn btn-primary">Write a Review</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Related Products -->
        <section class="container">
            <h2 class="text-center mb-4">Related Products</h2>
            <div class="grid grid-3">
                <div class="card product-card" data-category="tablets" data-price="22.99" data-name="Ibuprofen 400mg">
                    <img src="../../images/ibuprofen.jpeg" alt="Ibuprofen 400mg" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Ibuprofen 400mg</h3>
                        <p class="card-text">Anti-inflammatory pain relief</p>
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
                <div class="card product-card" data-category="tablets" data-price="18.50" data-name="Aspirin 325mg">
                    <img src="../../images/paracetamol1.jpeg" alt="Aspirin 325mg" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Aspirin 325mg</h3>
                        <p class="card-text">Pain relief and blood thinner</p>
                        <div class="price">$18.50</div>
                        <button class="btn btn-primary add-to-cart"
                            data-product-id="11"
                            data-product-name="Aspirin 325mg"
                            data-product-price="18.50"
                            data-product-image="../../images/paracetamol1.jpeg">
                            Add to Cart
                        </button>
                    </div>
                </div>
                <div class="card product-card" data-category="syrups" data-price="12.50" data-name="Cough Syrup">
                    <img src="../../images/coughsyrup.jpeg" alt="Cough Syrup" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Cough Syrup</h3>
                        <p class="card-text">Relieves cough and throat irritation</p>
                        <div class="price">$12.50</div>
                        <button class="btn btn-primary add-to-cart"
                            data-product-id="2"
                            data-product-name="Cough Syrup"
                            data-product-price="12.50"
                            data-product-image="../../images/coughsyrup.jpeg">
                            Add to Cart
                        </button>
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
