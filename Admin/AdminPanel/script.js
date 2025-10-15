// Global variables
let currentUser = null;
let medicines = [];
let orders = [];
let users = [];
let categories = [];
let prescriptions = [];

// Initialize the application
document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
    loadCharts();
    setupEventListeners();
});

// Initialize application
function initializeApp() {
    // Check if user is logged in
    const token = localStorage.getItem('adminToken');
    if (!token && !window.location.pathname.includes('login.html') && !window.location.pathname.includes('register.html')) {
        window.location.href = 'login.html';
        return;
    }
    
    // Load sample data
    loadSampleData();
    
    // Initialize charts if on dashboard or reports page
    if (window.location.pathname.includes('dashboard.html')) {
        initializeDashboardCharts();
    } else if (window.location.pathname.includes('reports.html')) {
        initializeReportCharts();
    }
}

// Load sample data
function loadSampleData() {
    medicines = [
        { id: 1, name: 'Paracetamol 500mg', category: 'Pain Relief', price: 5.99, stock: 45, status: 'in-stock', image: 'https://via.placeholder.com/50x50' },
        { id: 2, name: 'Amoxicillin 250mg', category: 'Antibiotic', price: 12.99, stock: 3, status: 'low-stock', image: 'https://via.placeholder.com/50x50' },
        { id: 3, name: 'Vitamin D3 1000IU', category: 'Vitamin', price: 8.99, stock: 0, status: 'out-of-stock', image: 'https://via.placeholder.com/50x50' }
    ];
    
    orders = [
        { id: 1, customer: 'John Doe', email: 'john@example.com', date: '2024-01-15', items: 3, total: 125.50, status: 'pending' },
        { id: 2, customer: 'Jane Smith', email: 'jane@example.com', date: '2024-01-14', items: 2, total: 89.25, status: 'processing' },
        { id: 3, customer: 'Mike Johnson', email: 'mike@example.com', date: '2024-01-13', items: 5, total: 156.75, status: 'delivered' }
    ];
    
    users = [
        { id: 1, name: 'John Doe', email: 'john@example.com', phone: '+1 (555) 123-4567', role: 'customer', status: 'active', lastLogin: '2 hours ago' },
        { id: 2, name: 'Jane Smith', email: 'jane@example.com', phone: '+1 (555) 234-5678', role: 'customer', status: 'active', lastLogin: '1 day ago' },
        { id: 3, name: 'Mike Johnson', email: 'mike@example.com', phone: '+1 (555) 345-6789', role: 'staff', status: 'active', lastLogin: '3 hours ago' }
    ];
    
    categories = [
        { id: 1, name: 'Pain Relief', count: 45, icon: 'fas fa-pills', color: '#667eea' },
        { id: 2, name: 'Antibiotic', count: 23, icon: 'fas fa-bug', color: '#f093fb' },
        { id: 3, name: 'Vitamin', count: 67, icon: 'fas fa-heart', color: '#4facfe' },
        { id: 4, name: 'Cold & Flu', count: 34, icon: 'fas fa-thermometer-half', color: '#43e97b' }
    ];
    
    prescriptions = [
        { id: 1, customer: 'John Doe', date: '2024-01-15', status: 'pending', image: 'https://via.placeholder.com/300x200' },
        { id: 2, customer: 'Jane Smith', date: '2024-01-14', status: 'approved', image: 'https://via.placeholder.com/300x200' },
        { id: 3, customer: 'Mike Johnson', date: '2024-01-13', status: 'rejected', image: 'https://via.placeholder.com/300x200' }
    ];
}

// Setup event listeners
function setupEventListeners() {
    // Search functionality
    const searchInputs = document.querySelectorAll('input[type="text"]');
    searchInputs.forEach(input => {
        input.addEventListener('input', handleSearch);
    });
    
    // Filter functionality
    const filterSelects = document.querySelectorAll('select');
    filterSelects.forEach(select => {
        select.addEventListener('change', handleFilter);
    });
    
    // Form submissions
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', handleFormSubmit);
    });
    
    // Modal close on outside click
    window.addEventListener('click', function(event) {
        const modals = document.querySelectorAll('.modal');
        modals.forEach(modal => {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });
    });
}

// Handle search
function handleSearch(event) {
    const searchTerm = event.target.value.toLowerCase();
    const tableId = event.target.closest('.filters-section').nextElementSibling.querySelector('table').id;
    
    if (tableId) {
        const table = document.getElementById(tableId);
        const rows = table.querySelectorAll('tbody tr');
        
        rows.forEach(row => {
            const text = row.textContent.toLowerCase();
            if (text.includes(searchTerm)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }
}

// Handle filter
function handleFilter(event) {
    const filterValue = event.target.value;
    const filterType = event.target.id;
    
    // Implement filtering logic based on filter type
    console.log(`Filtering by ${filterType}: ${filterValue}`);
}

// Handle form submission
function handleFormSubmit(event) {
    event.preventDefault();
    const form = event.target;
    const formData = new FormData(form);
    
    // Show success message
    showAlert('Form submitted successfully!', 'success');
    
    // Close modal if it's a modal form
    const modal = form.closest('.modal');
    if (modal) {
        modal.style.display = 'none';
    }
}

// Show alert message
function showAlert(message, type = 'info') {
    const alertDiv = document.createElement('div');
    alertDiv.className = `alert alert-${type}`;
    alertDiv.textContent = message;
    
    const header = document.querySelector('.header');
    if (header) {
        header.insertAdjacentElement('afterend', alertDiv);
        
        // Remove alert after 5 seconds
        setTimeout(() => {
            alertDiv.remove();
        }, 5000);
    }
}

// Medicine Management
function openMedicineModal(medicineId = null) {
    const modal = document.getElementById('medicineModal');
    const title = document.getElementById('modalTitle');
    const form = document.getElementById('medicineForm');
    
    if (medicineId) {
        title.textContent = 'Edit Medicine';
        // Load medicine data
        const medicine = medicines.find(m => m.id === medicineId);
        if (medicine) {
            document.getElementById('medicineName').value = medicine.name;
            document.getElementById('medicineCategory').value = medicine.category.toLowerCase().replace(' ', '-');
            document.getElementById('medicinePrice').value = medicine.price;
            document.getElementById('medicineStock').value = medicine.stock;
        }
    } else {
        title.textContent = 'Add Medicine';
        form.reset();
    }
    
    modal.style.display = 'block';
}

function closeMedicineModal() {
    document.getElementById('medicineModal').style.display = 'none';
}

function editMedicine(id) {
    openMedicineModal(id);
}

function deleteMedicine(id) {
    if (confirm('Are you sure you want to delete this medicine?')) {
        medicines = medicines.filter(m => m.id !== id);
        showAlert('Medicine deleted successfully!', 'success');
        // Refresh table
        location.reload();
    }
}

// Category Management
function openCategoryModal(categoryId = null) {
    const modal = document.getElementById('categoryModal');
    const title = document.getElementById('categoryModalTitle');
    const form = document.getElementById('categoryForm');
    
    if (categoryId) {
        title.textContent = 'Edit Category';
        // Load category data
        const category = categories.find(c => c.id === categoryId);
        if (category) {
            document.getElementById('categoryName').value = category.name;
            document.getElementById('categoryIcon').value = category.icon;
            document.getElementById('categoryColor').value = category.color;
        }
    } else {
        title.textContent = 'Add Category';
        form.reset();
    }
    
    modal.style.display = 'block';
}

function closeCategoryModal() {
    document.getElementById('categoryModal').style.display = 'none';
}

function editCategory(id) {
    openCategoryModal(id);
}

function deleteCategory(id) {
    if (confirm('Are you sure you want to delete this category?')) {
        categories = categories.filter(c => c.id !== id);
        showAlert('Category deleted successfully!', 'success');
        // Refresh page
        location.reload();
    }
}

// Order Management
function viewOrder(orderId) {
    const modal = document.getElementById('orderModal');
    // Load order data
    const order = orders.find(o => o.id === orderId);
    if (order) {
        // Update modal content with order data
        console.log('Viewing order:', order);
    }
    modal.style.display = 'block';
}

function closeOrderModal() {
    document.getElementById('orderModal').style.display = 'none';
}

function updateOrderStatus(orderId) {
    const modal = document.getElementById('statusModal');
    modal.style.display = 'block';
}

function closeStatusModal() {
    document.getElementById('statusModal').style.display = 'none';
}

function printOrder(orderId) {
    window.print();
}

// Prescription Management
function viewPrescription(prescriptionId) {
    const modal = document.getElementById('prescriptionModal');
    // Load prescription data
    const prescription = prescriptions.find(p => p.id === prescriptionId);
    if (prescription) {
        // Update modal content with prescription data
        console.log('Viewing prescription:', prescription);
    }
    modal.style.display = 'block';
}

function closePrescriptionModal() {
    document.getElementById('prescriptionModal').style.display = 'none';
}

function approvePrescription(id) {
    if (confirm('Are you sure you want to approve this prescription?')) {
        prescriptions = prescriptions.map(p => 
            p.id === id ? { ...p, status: 'approved' } : p
        );
        showAlert('Prescription approved successfully!', 'success');
        location.reload();
    }
}

function rejectPrescription(id) {
    const modal = document.getElementById('rejectionModal');
    modal.style.display = 'block';
}

function closeRejectionModal() {
    document.getElementById('rejectionModal').style.display = 'none';
}

function reconsiderPrescription(id) {
    if (confirm('Are you sure you want to reconsider this prescription?')) {
        prescriptions = prescriptions.map(p => 
            p.id === id ? { ...p, status: 'pending' } : p
        );
        showAlert('Prescription moved to pending!', 'success');
        location.reload();
    }
}

function processPrescription(id) {
    if (confirm('Process this prescription into an order?')) {
        showAlert('Prescription processed successfully!', 'success');
        location.reload();
    }
}

function downloadPrescription(id) {
    showAlert('Prescription download started!', 'info');
}

// User Management
function openUserModal(userId = null) {
    const modal = document.getElementById('userModal');
    const title = document.getElementById('userModalTitle');
    const form = document.getElementById('userForm');
    
    if (userId) {
        title.textContent = 'Edit User';
        // Load user data
        const user = users.find(u => u.id === userId);
        if (user) {
            const nameParts = user.name.split(' ');
            document.getElementById('userFirstName').value = nameParts[0] || '';
            document.getElementById('userLastName').value = nameParts.slice(1).join(' ') || '';
            document.getElementById('userEmail').value = user.email;
            document.getElementById('userPhone').value = user.phone;
            document.getElementById('userRole').value = user.role;
            document.getElementById('userStatus').value = user.status;
        }
    } else {
        title.textContent = 'Add User';
        form.reset();
    }
    
    modal.style.display = 'block';
}

function closeUserModal() {
    document.getElementById('userModal').style.display = 'none';
}

function editUser(id) {
    openUserModal(id);
}

function viewUser(id) {
    const modal = document.getElementById('userDetailsModal');
    // Load user data
    const user = users.find(u => u.id === id);
    if (user) {
        // Update modal content with user data
        console.log('Viewing user:', user);
    }
    modal.style.display = 'block';
}

function closeUserDetailsModal() {
    document.getElementById('userDetailsModal').style.display = 'none';
}

function suspendUser(id) {
    if (confirm('Are you sure you want to suspend this user?')) {
        users = users.map(u => 
            u.id === id ? { ...u, status: 'suspended' } : u
        );
        showAlert('User suspended successfully!', 'success');
        location.reload();
    }
}

function activateUser(id) {
    if (confirm('Are you sure you want to activate this user?')) {
        users = users.map(u => 
            u.id === id ? { ...u, status: 'active' } : u
        );
        showAlert('User activated successfully!', 'success');
        location.reload();
    }
}

// Settings Management
function showSettingsTab(tabName) {
    // Hide all settings content
    const contents = document.querySelectorAll('.settings-content');
    contents.forEach(content => {
        content.classList.remove('active');
    });
    
    // Remove active class from all tabs
    const tabs = document.querySelectorAll('.tab-btn');
    tabs.forEach(tab => {
        tab.classList.remove('active');
    });
    
    // Show selected content and activate tab
    document.getElementById(tabName + 'Settings').classList.add('active');
    event.target.classList.add('active');
}

// Report Management
function showTab(tabName) {
    // Hide all report content
    const contents = document.querySelectorAll('.report-content');
    contents.forEach(content => {
        content.classList.remove('active');
    });
    
    // Remove active class from all tabs
    const tabs = document.querySelectorAll('.tab-btn');
    tabs.forEach(tab => {
        tab.classList.remove('active');
    });
    
    // Show selected content and activate tab
    document.getElementById(tabName + 'Report').classList.add('active');
    event.target.classList.add('active');
}

function updateReport() {
    const reportType = document.getElementById('reportType').value;
    const dateRange = document.getElementById('dateRange').value;
    
    if (dateRange === 'custom') {
        document.getElementById('customDateRange').style.display = 'flex';
    } else {
        document.getElementById('customDateRange').style.display = 'none';
    }
    
    console.log('Updating report:', reportType, dateRange);
}

function generateReport() {
    showAlert('Report generated successfully!', 'success');
    // Implement report generation logic
}

function exportReport() {
    showAlert('Report exported successfully!', 'success');
    // Implement export logic
}

// Chart Initialization
function loadCharts() {
    if (typeof Chart === 'undefined') {
        console.log('Chart.js not loaded');
        return;
    }
    
    if (window.location.pathname.includes('dashboard.html')) {
        initializeDashboardCharts();
    } else if (window.location.pathname.includes('reports.html')) {
        initializeReportCharts();
    }
}

function initializeDashboardCharts() {
    const salesChartCtx = document.getElementById('salesChart');
    if (salesChartCtx) {
        new Chart(salesChartCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Sales',
                    data: [12000, 19000, 15000, 25000, 22000, 30000],
                    borderColor: '#667eea',
                    backgroundColor: 'rgba(102, 126, 234, 0.1)',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
}

function initializeReportCharts() {
    // Sales Trend Chart
    const salesTrendCtx = document.getElementById('salesTrendChart');
    if (salesTrendCtx) {
        new Chart(salesTrendCtx, {
            type: 'line',
            data: {
                labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                datasets: [{
                    label: 'Revenue',
                    data: [5000, 7500, 6200, 8900],
                    borderColor: '#667eea',
                    backgroundColor: 'rgba(102, 126, 234, 0.1)',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    }
                }
            }
        });
    }
    
    // Categories Chart
    const categoriesCtx = document.getElementById('categoriesChart');
    if (categoriesCtx) {
        new Chart(categoriesCtx, {
            type: 'doughnut',
            data: {
                labels: ['Pain Relief', 'Antibiotic', 'Vitamin', 'Cold & Flu'],
                datasets: [{
                    data: [45, 23, 67, 34],
                    backgroundColor: ['#667eea', '#f093fb', '#4facfe', '#43e97b']
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });
    }
    
    // Order Status Chart
    const orderStatusCtx = document.getElementById('orderStatusChart');
    if (orderStatusCtx) {
        new Chart(orderStatusCtx, {
            type: 'pie',
            data: {
                labels: ['Delivered', 'Processing', 'Pending', 'Shipped'],
                datasets: [{
                    data: [156, 8, 12, 5],
                    backgroundColor: ['#28a745', '#17a2b8', '#ffc107', '#007bff']
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });
    }
}

// Utility Functions
function clearFilters() {
    const inputs = document.querySelectorAll('input[type="text"], input[type="date"]');
    const selects = document.querySelectorAll('select');
    
    inputs.forEach(input => input.value = '');
    selects.forEach(select => select.selectedIndex = 0);
    
    // Show all table rows
    const tables = document.querySelectorAll('.data-table');
    tables.forEach(table => {
        const rows = table.querySelectorAll('tbody tr');
        rows.forEach(row => row.style.display = '');
    });
}

// Logout function
function logout() {
    if (confirm('Are you sure you want to logout?')) {
        localStorage.removeItem('adminToken');
        window.location.href = 'login.html';
    }
}

// Login and Registration functions
function login() {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    
    if (!email || !password) {
        showAlert('Please fill in all fields', 'error');
        return;
    }
    
    // Simulate login
    if (email === 'admin@pharmacy.com' && password === 'admin123') {
        localStorage.setItem('adminToken', 'fake-token');
        showAlert('Login successful!', 'success');
        setTimeout(() => {
            window.location.href = 'dashboard.html';
        }, 1000);
    } else {
        showAlert('Invalid credentials', 'error');
    }
}

function register() {
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    
    if (!name || !email || !password || !confirmPassword) {
        showAlert('Please fill in all fields', 'error');
        return;
    }
    
    if (password !== confirmPassword) {
        showAlert('Passwords do not match', 'error');
        return;
    }
    
    if (password.length < 6) {
        showAlert('Password must be at least 6 characters', 'error');
        return;
    }
    
    // Simulate registration
    localStorage.setItem('adminToken', 'fake-token');
    showAlert('Registration successful!', 'success');
    setTimeout(() => {
        window.location.href = 'dashboard.html';
    }, 1000);
}

// Initialize charts when Chart.js is loaded
if (typeof Chart !== 'undefined') {
    loadCharts();
}
