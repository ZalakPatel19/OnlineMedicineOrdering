// Main JavaScript for Online Medicine Ordering System

// Global variables
let cart = JSON.parse(localStorage.getItem('cart')) || [];
let user = JSON.parse(localStorage.getItem('user')) || null;

// Initialize the application
document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
    updateCartDisplay();
    setupEventListeners();
});

// Initialize application
function initializeApp() {
    // Check if user is logged in
    if (user) {
        updateUserInterface();
    }
    
    // Load cart from localStorage
    loadCart();
}

// Setup event listeners
function setupEventListeners() {
    // Search functionality
    const searchForm = document.getElementById('searchForm');
    if (searchForm) {
        searchForm.addEventListener('submit', handleSearch);
    }
    
    // Add to cart buttons
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('add-to-cart')) {
            e.preventDefault();
            const productId = e.target.dataset.productId;
            const productName = e.target.dataset.productName;
            const productPrice = parseFloat(e.target.dataset.productPrice);
            const productImage = e.target.dataset.productImage;
            
            addToCart(productId, productName, productPrice, productImage);
        }
    });
    
    // Quantity controls
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('quantity-btn')) {
            const action = e.target.dataset.action;
            const productId = e.target.dataset.productId;
            updateQuantity(productId, action);
        }
    });
    
    // Remove from cart
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('remove-item')) {
            const productId = e.target.dataset.productId;
            removeFromCart(productId);
        }
    });
    
    // Form submissions
    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', handleLogin);
    }
    
    const registerForm = document.getElementById('registerForm');
    if (registerForm) {
        registerForm.addEventListener('submit', handleRegister);
    }
    
    const checkoutForm = document.getElementById('checkoutForm');
    if (checkoutForm) {
        checkoutForm.addEventListener('submit', handleCheckout);
    }
    
    const prescriptionForm = document.getElementById('prescriptionForm');
    if (prescriptionForm) {
        prescriptionForm.addEventListener('submit', handlePrescriptionUpload);
    }
}

// Cart Management
function addToCart(id, name, price, image) {
    const existingItem = cart.find(item => item.id === id);
    
    if (existingItem) {
        existingItem.quantity += 1;
    } else {
        cart.push({
            id: id,
            name: name,
            price: price,
            image: image,
            quantity: 1
        });
    }
    
    saveCart();
    updateCartDisplay();
    showAlert('Product added to cart!', 'success');
}

function removeFromCart(id) {
    cart = cart.filter(item => item.id !== id);
    saveCart();
    updateCartDisplay();
    showAlert('Product removed from cart!', 'success');
}

function updateQuantity(id, action) {
    const item = cart.find(item => item.id === id);
    
    if (item) {
        if (action === 'increase') {
            item.quantity += 1;
        } else if (action === 'decrease' && item.quantity > 1) {
            item.quantity -= 1;
        }
        
        saveCart();
        updateCartDisplay();
    }
}

function clearCart() {
    cart = [];
    saveCart();
    updateCartDisplay();
    showAlert('Cart cleared!', 'success');
}

function saveCart() {
    localStorage.setItem('cart', JSON.stringify(cart));
}

function loadCart() {
    cart = JSON.parse(localStorage.getItem('cart')) || [];
}

function updateCartDisplay() {
    const cartCount = document.getElementById('cartCount');
    const cartTotal = document.getElementById('cartTotal');
    const cartItems = document.getElementById('cartItems');
    
    if (cartCount) {
        const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
        cartCount.textContent = totalItems;
    }
    
    if (cartTotal) {
        const total = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
        cartTotal.textContent = `$${total.toFixed(2)}`;
    }
    
    if (cartItems) {
        renderCartItems();
    }
}

function renderCartItems() {
    const cartItems = document.getElementById('cartItems');
    if (!cartItems) return;
    
    if (cart.length === 0) {
        cartItems.innerHTML = '<p class="text-center">Your cart is empty</p>';
        return;
    }
    
    cartItems.innerHTML = cart.map(item => `
        <div class="cart-item">
            <img src="${item.image}" alt="${item.name}">
            <div class="cart-item-info">
                <div class="cart-item-title">${item.name}</div>
                <div class="cart-item-price">$${item.price.toFixed(2)}</div>
            </div>
            <div class="quantity-controls">
                <button class="quantity-btn" data-action="decrease" data-product-id="${item.id}">-</button>
                <input type="number" class="quantity-input" value="${item.quantity}" min="1" readonly>
                <button class="quantity-btn" data-action="increase" data-product-id="${item.id}">+</button>
            </div>
            <button class="btn btn-danger remove-item" data-product-id="${item.id}">Remove</button>
        </div>
    `).join('');
}

// Search functionality
function handleSearch(e) {
    e.preventDefault();
    const searchTerm = document.getElementById('searchInput').value;
    
    if (searchTerm.trim()) {
        // In a real application, this would make an API call
        console.log('Searching for:', searchTerm);
        showAlert(`Searching for: ${searchTerm}`, 'info');
    }
}

// User Authentication
function handleLogin(e) {
    e.preventDefault();
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    
    // Simple validation
    if (!email || !password) {
        showAlert('Please fill in all fields', 'danger');
        return;
    }
    
    // Simulate login (in real app, this would be an API call)
    user = {
        id: 1,
        name: 'John Doe',
        email: email,
        phone: '123-456-7890',
        address: '123 Main St, City, State 12345'
    };
    
    localStorage.setItem('user', JSON.stringify(user));
    updateUserInterface();
    showAlert('Login successful!', 'success');
    
    // Redirect to profile or home
    setTimeout(() => {
        window.location.href = 'profile.html';
    }, 1000);
}

function handleRegister(e) {
    e.preventDefault();
    const formData = new FormData(e.target);
    const userData = Object.fromEntries(formData);
    
    // Simple validation
    if (!userData.name || !userData.email || !userData.password) {
        showAlert('Please fill in all required fields', 'danger');
        return;
    }
    
    if (userData.password !== userData.confirmPassword) {
        showAlert('Passwords do not match', 'danger');
        return;
    }
    
    // Simulate registration
    user = {
        id: Date.now(),
        name: userData.name,
        email: userData.email,
        phone: userData.phone || '',
        address: userData.address || ''
    };
    
    localStorage.setItem('user', JSON.stringify(user));
    updateUserInterface();
    showAlert('Registration successful!', 'success');
    
    setTimeout(() => {
        window.location.href = 'profile.html';
    }, 1000);
}

function logout() {
    user = null;
    localStorage.removeItem('user');
    updateUserInterface();
    showAlert('Logged out successfully', 'success');
    
    setTimeout(() => {
        window.location.href = 'index.html';
    }, 1000);
}

function updateUserInterface() {
    const loginBtn = document.getElementById('loginBtn');
    const registerBtn = document.getElementById('registerBtn');
    const userMenu = document.getElementById('userMenu');
    
    if (user) {
        if (loginBtn) loginBtn.style.display = 'none';
        if (registerBtn) registerBtn.style.display = 'none';
        if (userMenu) {
            userMenu.style.display = 'block';
            userMenu.innerHTML = `
                <span>Welcome, ${user.name}</span>
                <a href="profile.html" class="btn btn-secondary">Profile</a>
                <button onclick="logout()" class="btn btn-danger">Logout</button>
            `;
        }
    } else {
        if (loginBtn) loginBtn.style.display = 'inline-block';
        if (registerBtn) registerBtn.style.display = 'inline-block';
        if (userMenu) userMenu.style.display = 'none';
    }
}

// Checkout functionality
function handleCheckout(e) {
    e.preventDefault();
    
    if (!user) {
        showAlert('Please login to continue', 'warning');
        setTimeout(() => {
            window.location.href = 'login.html';
        }, 1500);
        return;
    }
    
    if (cart.length === 0) {
        showAlert('Your cart is empty', 'warning');
        return;
    }
    
    const formData = new FormData(e.target);
    const orderData = Object.fromEntries(formData);
    
    // Create order
    const order = {
        id: Date.now(),
        userId: user.id,
        items: [...cart],
        total: cart.reduce((sum, item) => sum + (item.price * item.quantity), 0),
        shippingAddress: orderData.shippingAddress,
        paymentMethod: orderData.paymentMethod,
        status: 'pending',
        date: new Date().toISOString()
    };
    
    // Save order to localStorage (in real app, this would be an API call)
    const orders = JSON.parse(localStorage.getItem('orders')) || [];
    orders.push(order);
    localStorage.setItem('orders', JSON.stringify(orders));
    
    // Clear cart
    clearCart();
    
    showAlert('Order placed successfully!', 'success');
    
    setTimeout(() => {
        window.location.href = 'orders.html';
    }, 2000);
}

// Prescription upload
function handlePrescriptionUpload(e) {
    e.preventDefault();
    
    const fileInput = document.getElementById('prescriptionFile');
    const file = fileInput.files[0];
    
    if (!file) {
        showAlert('Please select a file', 'warning');
        return;
    }
    
    // Simulate file upload
    showAlert('Prescription uploaded successfully!', 'success');
    
    // Reset form
    e.target.reset();
}

// Utility functions
function showAlert(message, type = 'info') {
    const alertDiv = document.createElement('div');
    alertDiv.className = `alert alert-${type}`;
    alertDiv.textContent = message;
    
    // Insert at the top of the page
    const container = document.querySelector('.container') || document.body;
    container.insertBefore(alertDiv, container.firstChild);
    
    // Auto remove after 3 seconds
    setTimeout(() => {
        alertDiv.remove();
    }, 3000);
}

function formatPrice(price) {
    return `$${price.toFixed(2)}`;
}

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
    });
}

// Product filtering and sorting
function filterProducts(category) {
    const products = document.querySelectorAll('.product-card');
    
    products.forEach(product => {
        if (category === 'all' || product.dataset.category === category) {
            product.style.display = 'block';
        } else {
            product.style.display = 'none';
        }
    });
}

function sortProducts(sortBy) {
    const productContainer = document.querySelector('.products-grid');
    if (!productContainer) return;
    
    const products = Array.from(productContainer.children);
    
    products.sort((a, b) => {
        const priceA = parseFloat(a.dataset.price);
        const priceB = parseFloat(b.dataset.price);
        
        switch (sortBy) {
            case 'price-low':
                return priceA - priceB;
            case 'price-high':
                return priceB - priceA;
            case 'name':
                return a.dataset.name.localeCompare(b.dataset.name);
            default:
                return 0;
        }
    });
    
    products.forEach(product => productContainer.appendChild(product));
}

// Modal functionality
function openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.style.display = 'block';
    }
}

function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.style.display = 'none';
    }
}

// Close modal when clicking outside
window.addEventListener('click', function(e) {
    if (e.target.classList.contains('modal')) {
        e.target.style.display = 'none';
    }
});

// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Initialize tooltips and other UI enhancements
function initializeUI() {
    // Add loading states to buttons
    document.querySelectorAll('.btn').forEach(btn => {
        btn.addEventListener('click', function() {
            if (this.type === 'submit') {
                this.innerHTML = '<span class="spinner"></span> Processing...';
                this.disabled = true;
            }
        });
    });
}

// Export functions for global access
window.addToCart = addToCart;
window.removeFromCart = removeFromCart;
window.updateQuantity = updateQuantity;
window.clearCart = clearCart;
window.logout = logout;
window.filterProducts = filterProducts;
window.sortProducts = sortProducts;
window.openModal = openModal;
window.closeModal = closeModal;
