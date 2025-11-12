<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="Online_Medicine_Ordering.Admin.AdminPanel.admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style>
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css');

body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #4e73df, #8e54e9);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-container {
    width: 450px;
    background: #fff;
    padding: 40px 35px;
    border-radius: 20px;
    text-align: center;
    box-shadow: 0px 8px 25px rgba(0,0,0,0.15);
}

.login-header .login-icon {
    width: 85px;
    height: 85px;
    margin: 0 auto 15px;
    background: linear-gradient(135deg, #6a6ff5, #8b52f8);
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-header .login-icon i {
    font-size: 40px;
    color: #fff;
}

.login-header h1 {
    margin: 10px 0 5px;
    font-size: 28px;
    color: #333;
}

.login-header p {
    color: #666;
    font-size: 14px;
}

.form-group {
    text-align: left;
    margin-bottom: 18px;
}

.form-group label {
    font-size: 14px;
    font-weight: 500;
    color: #333;
}

.input-icon {
    position: relative;
}

.input-icon i {
    position: absolute;
    top: 50%;
    left: 15px;
    transform: translateY(-50%);
    color: #7a7a7a;
    font-size: 18px;
}

.form-control {
    width: 100%;
    padding: 12px 15px 12px 45px;
    border-radius: 10px;
    border: 1px solid #ccc;
    font-size: 15px;
    outline: none;
    transition: 0.3s ease;
}

.form-control:focus {
    border-color: #6a6ff5;
    box-shadow: 0 0 5px rgba(106,111,245,0.4);
}

.login-btn {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 10px;
    background: linear-gradient(135deg, #6a6ff5, #8b52f8);
    color: #fff;
    font-size: 18px;
    cursor: pointer;
    transition: 0.3s ease;
    margin-top: 5px;
}

.login-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0px 6px 15px rgba(106,111,245,0.4);
}

.demo-credentials {
    margin-top: 15px;
    padding: 12px;
    background: #f6f6f6;
    border-radius: 10px;
    font-size: 14px;
    color: #555;
}

.login-footer {
    margin-top: 15px;
}

.login-footer a {
    color: #6a6ff5;
    text-decoration: none;
    font-weight: 600;
}

    </style>
</head>
            <body>
    <form id="form2" runat="server">

        <div class="login-container">
            <div class="login-header">
                <div class="login-icon">
                    <i class="fas fa-pills"></i>
                </div>
                <h1>Admin Login</h1>
                <p>Sign in to your Medicine management account</p>
            </div>

            
            <div class="form-group">
                <label for="txtEmail">Email Address</label>
                <div class="input-icon">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="txtem" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email" />
                </div>
            </div>

            
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <div class="input-icon">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtpw" runat="server" CssClass="form-control" placeholder="Enter your password" TextMode="Password" />
                </div>
            </div>

            
            <asp:Button ID="btnlgn" runat="server" CssClass="login-btn" Text="Login" OnClick="btnLogin_Click" />

            <!-- Demo Info -->
            <div class="demo-credentials">
                <strong>Demo Credentials:</strong><br />
                Email: admin@pharmacy.com<br />
                Password: admin123
            </div>

            <!-- Footer -->
            <div class="login-footer">
                <p>Don't have an account? <a href="register_admin.aspx">Register here</a></p>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
