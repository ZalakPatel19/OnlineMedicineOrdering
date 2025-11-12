<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeFile="medicines.aspx.cs" Inherits="Online_Medicine_Ordering.Shop.medicines" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>All Medicines - MediCare</title>
        <link rel="stylesheet" href="../Assets/css/style.css">
        <link rel="icon" href="../Assets/images/favicon.ico" type="image/x-icon">
        <style>
            /* Center container styling */
            center {
                display: block;
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                text-align: center;
                font-family: Arial, sans-serif;
                background-color: #f4f7fa;
            }

            /* Medicine box styling */
            .medicine-box {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 10px;
                padding: 15px;
                box-shadow: 0 3px 6px rgba(0,0,0,0.1);
                margin-bottom: 30px;
                width: 300px;
                display: inline-block;
                vertical-align: top;
                transition: box-shadow 0.3s ease, transform 0.3s ease;
            }

                .medicine-box:hover {
                    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
                    transform: translateY(-5px);
                }

            /* Medicine image styling */
            .medicine-img {
                width: 100%;
                height: 180px;
                object-fit: cover;
                border-radius: 8px;
                margin-bottom: 12px;
            }

            /* Medicine details */
            .medicine-detail h5 {
                font-size: 20px;
                margin: 0 0 8px 0;
                color: #222;
                font-weight: 700;
            }

                .medicine-detail h5 asp\\:Label {
                    font-weight: 400;
                    font-size: 14px;
                    color: #666;
                    margin-left: 6px;
                }

            .medicine-detail p {
                font-size: 14px;
                color: #555;
                margin: 4px 0;
            }

            /* Buttons styling */
            .btn-action {
                display: inline-block;
                padding: 8px 16px;
                margin: 8px 6px 0 0;
                border-radius: 5px;
                font-size: 14px;
                font-weight: 600;
                text-decoration: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
                color: #fff;
                border: none;
            }

            .btn-edit {
                background-color: #28a745; /* Green */
            }

                .btn-edit:hover {
                    background-color: #218838;
                }

            .btn-delete {
                background-color: #007bff; /* Blue */
            }

                .btn-delete:hover {
                    background-color: #0056b3;
                }

            /* View Cart button styling */
            #Button1 {
                padding: 12px 25px;
                font-size: 16px;
                border-radius: 6px;
                background-color: #ff5722;
                color: #fff;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-bottom: 15px;
            }

                #Button1:hover {
                    background-color: #e64a19;
                }

            /* Pagination buttons styling */
            #LinkButton1, #LinkButton2 {
                display: inline-block;
                padding: 10px 18px;
                margin: 0 15px;
                font-size: 16px;
                background-color: #007bff;
                color: white !important;
                border-radius: 6px;
                cursor: pointer;
                user-select: none;
                transition: background-color 0.3s ease;
                border: none;
                text-decoration: none;
            }

                #LinkButton1:hover, #LinkButton2:hover {
                    background-color: #0056b3;
                }

            /* Label general styling */
            asp\\:Label {
                display: block;
                margin: 4px 0;
                color: #555;
                font-size: 14px;
            }

            /* Responsive: stack medicine boxes on smaller screens */
            @media (max-width: 960px) {
                .medicine-box {
                    width: 45%;
                    margin: 1.5%;
                }
            }

            @media (max-width: 600px) {
                .medicine-box {
                    width: 90%;
                    margin: 10px auto;
                }

                #LinkButton1, #LinkButton2 {
                    display: block;
                    width: 120px;
                    margin: 10px auto;
                }
            }
        </style>
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

        <!-- Page Header -->
        <section class="hero" style="height: 200px;">
            <div class="hero-content">
                <h1>All Medicines</h1>
                Browse our complete collection of pharmaceutical products
                </p>
            </div>
        </section>

        <!-- Filters and Search -->
        <%-- <section class="container">
            <div class="card" style="margin: 2rem 0;">
                <div class="card-content">
                    <div class="grid grid-2">
                        <div>
                            <h3>Search & Filter</h3>
                            <form class="search-bar" id="searchForm">
                                <input type="text" id="searchInput" placeholder="Search medicines...">
                                <button type="submit" class="btn btn-primary">Search</button>
                            </form>
                        </div>
                        <div>
                            <h3>Sort By</h3>
                            <select id="sortSelect" class="form-control" onchange="sortProducts(this.value)">
                                <option value="name">Name A-Z</option>
                                <option value="price-low">Price: Low to High</option>
                                <option value="price-high">Price: High to Low</option>
                                <option value="newest">Newest First</option>
                            </select>
                        </div>
                    </div>

                    <div style="margin-top: 1rem;">
                        <h3>Filter by Category</h3>
                        <div style="display: flex; gap: 1rem; flex-wrap: wrap; margin-top: 0.5rem;">
                            <button class="btn btn-secondary" onclick="filterProducts('all')">All</button>
                            <button class="btn btn-secondary" onclick="filterProducts('tablets')">Tablets</button>
                            <button class="btn btn-secondary" onclick="filterProducts('syrups')">Syrups</button>
                            <button class="btn btn-secondary" onclick="filterProducts('injections')">Injections</button>
                            <button class="btn btn-secondary" onclick="filterProducts('otc')">OTC Products</button>
                            <button class="btn btn-secondary" onclick="filterProducts('vitamins')">Vitamins</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Products Grid -->
        <section class="container">
            <div class="products-grid grid grid-3">
                <!-- Product 1 -->
                <div class="card product-card" data-category="tablets" data-price="15.99" data-name="Paracetamol 500mg">
                    <img src="../../images/paracetamol1.jpeg" alt="Paracetamol 500mg" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Paracetamol 500mg</h3>
                        <p class="card-text">Pain relief and fever reducer. 100 tablets per bottle.</p>
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

                <!-- Product 2 -->
                <div class="card product-card" data-category="syrups" data-price="12.50" data-name="Cough Syrup">
                    <img src="../../images/cough1.jpeg" alt="Cough Syrup" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Cough Syrup</h3>
                        <p class="card-text">Relieves cough and throat irritation. 100ml bottle.</p>
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

                <!-- Product 3 -->
                <div class="card product-card" data-category="otc" data-price="8.99" data-name="Vitamin D3">
                    <img src="../../images/vitaminD3(1).jpeg" alt="Vitamin D3" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Vitamin D3</h3>
                        <p class="card-text">Essential vitamin for bone health. 60 capsules.</p>
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

                <!-- Product 4 -->
                <div class="card product-card" data-category="tablets" data-price="22.99" data-name="Ibuprofen 400mg">
                    <img src="../../images/ibuprofen.jpeg" alt="Ibuprofen 400mg" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Ibuprofen 400mg</h3>
                        <p class="card-text">Anti-inflammatory pain relief. 50 tablets.</p>
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

                <!-- Product 5 -->
                <div class="card product-card" data-category="syrups" data-price="18.75" data-name="Antacid Syrup">
                    <img src="../../images/antacidsyrup.jpeg" alt="Antacid Syrup" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Antacid Syrup</h3>
                        <p class="card-text">Relieves heartburn and indigestion. 200ml bottle.</p>
                        <div class="price">$18.75</div>
                        <button class="btn btn-primary add-to-cart"
                            data-product-id="5"
                            data-product-name="Antacid Syrup"
                            data-product-price="18.75"
                            data-product-image="../../images/antacidsyrup.jpeg">
                            Add to Cart
                        </button>
                    </div>
                </div>

                <!-- Product 6 -->
                <div class="card product-card" data-category="vitamins" data-price="14.99" data-name="Multivitamin">
                    <img src="../../images/multivitamin1.jpeg" alt="Multivitamin" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Multivitamin</h3>
                        <p class="card-text">Complete daily vitamin supplement. 90 tablets.</p>
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

                <!-- Product 7 -->
                <div class="card product-card" data-category="injections" data-price="45.99" data-name="Insulin Pen">
                    <img src="../../images/insulinpen.jpeg" alt="Insulin Pen" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Insulin Pen</h3>
                        <p class="card-text">Pre-filled insulin pen for diabetes management.</p>
                        <div class="price">$45.99</div>
                        <button class="btn btn-primary add-to-cart"
                            data-product-id="7"
                            data-product-name="Insulin Pen"
                            data-product-price="45.99"
                            data-product-image="../../images/insulinpen.jpeg">
                            Add to Cart
                        </button>
                    </div>
                </div>

                <!-- Product 8 -->
                <div class="card product-card" data-category="otc" data-price="6.99" data-name="Band-Aids">
                    <img src="../../images/bandaids.jpeg" alt="Band-Aids" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Band-Aids</h3>
                        <p class="card-text">Waterproof adhesive bandages. 100 count box.</p>
                        <div class="price">$6.99</div>
                        <button class="btn btn-primary add-to-cart"
                            data-product-id="8"
                            data-product-name="Band-Aids"
                            data-product-price="6.99"
                            data-product-image="../../images/bandaids.jpeg">
                            Add to Cart
                        </button>
                    </div>
                </div>

                <!-- Product 9 -->
                <div class="card product-card" data-category="tablets" data-price="35.99" data-name="Blood Pressure Medication">
                    <img src="../../images/bloodpressure.jpeg" alt="Blood Pressure Medication" class="card-img">
                    <div class="card-content">
                        <h3 class="card-title">Blood Pressure Medication</h3>
                        <p class="card-text">Prescription medication for hypertension. 30 tablets.</p>
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

            <!-- Pagination -->
            <div class="text-center" style="margin: 3rem 0;">
                <div style="display: inline-flex; gap: 0.5rem;">
                    <button class="btn btn-secondary">Previous</button>
                    <button class="btn btn-primary">1</button>
                    <button class="btn btn-secondary">2</button>
                    <button class="btn btn-secondary">3</button>
                    <button class="btn btn-secondary">Next</button>
                </div>
            </div>
        </section>

        <!-- Prescription Upload CTA -->
        <section class="container">
            <div class="card" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; margin: 4rem 0;">
                <div class="card-content text-center">
                    <h2>Need Prescription Medicines?</h2>
                    <p>Upload your prescription and get your medicines delivered safely to your doorstep.</p>
                    <div style="margin-top: 2rem;">
                        <a href="../User/prescriptions.html" class="btn btn-primary">Upload Prescription</a>
                        <a href="../User/login.html" class="btn btn-secondary">Login to Continue</a>
                    </div>
                </div>
            </div>
        </section>--%>
        <center>
            <p>
<%--                <asp:Button ID="Button1" runat="server" Text="View Cart" OnClick="Button1_Click1"  />--%>
                <asp:Button ID="btnviewcart" runat="server" Text="View Cart" OnClick="btnviewcart_Click" />
                <asp:Label ID="Label3" runat="server"></asp:Label>
            </p>

            <asp:DataList ID="dlMedicines" runat="server"
                RepeatDirection="Horizontal" RepeatColumns="3"
                CellPadding="10" CellSpacing="20" OnItemCommand="dlMedicines_ItemCommand">
                <ItemTemplate>
                    <div class="medicine-box">
                        <asp:Image ID="imgMedicine" runat="server"
                            CssClass="medicine-img"
                            ImageUrl='<%# Eval("Image") %>' AlternateText="Medicine Image" />

                        <div class="medicine-detail">
                            <h5><%# Eval("Name") %>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryId") %>'></asp:Label>
                            </h5>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("ExpiryDate") %>'></asp:Label>
                            </p>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <asp:LinkButton ID="lnkCart" runat="server"
                        CommandName="cmd_add" CommandArgument='<%# Eval("Id") %>'
                        CssClass="btn-action btn-edit"> Add to Cart</asp:LinkButton>

                    <asp:LinkButton ID="lnkView" runat="server"
                        CommandName="cmd_view" CommandArgument='<%# Eval("Id") %>'
                        CssClass="btn-action btn-delete"> View Details</asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Previous</asp:LinkButton>
            &nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Next</asp:LinkButton>

        </center>
        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="footer-content">
                    <div class="footer-section">
                        <h3>MediCare3>MediCare</h3>
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
