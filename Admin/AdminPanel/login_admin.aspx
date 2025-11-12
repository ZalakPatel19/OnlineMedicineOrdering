<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login_admin.aspx.cs" Inherits="Online_Medicine_Ordering.Admin.AdminPanel.login_admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .login-container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-header {
            margin-bottom: 30px;
        }

            .login-header h1 {
                color: #333;
                margin-bottom: 10px;
                font-size: 2rem;
            }

            .login-header p {
                color: #666;
                font-size: 0.9rem;
            }

        .login-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 2rem;
            color: white;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

            .form-group label {
                display: block;
                margin-bottom: 8px;
                color: #333;
                font-weight: 500;
            }

            .form-group input {
                width: 100%;
                padding: 12px 15px;
                border: 2px solid #e1e5e9;
                border-radius: 8px;
                font-size: 1rem;
                transition: border-color 0.3s ease;
            }

                .form-group input:focus {
                    outline: none;
                    border-color: #667eea;
                    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
                }

        .input-icon {
            position: relative;
        }

            .input-icon i {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: #666;
            }

            .input-icon input {
                padding-left: 45px;
            }

        .login-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

            .login-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
            }

        .login-footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e1e5e9;
        }

            .login-footer a {
                color: #667eea;
                text-decoration: none;
                font-weight: 500;
            }

                .login-footer a:hover {
                    text-decoration: underline;
                }

        .demo-credentials {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
            font-size: 0.9rem;
            color: #666;
        }

            .demo-credentials strong {
                color: #333;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">

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
    </form>
</body>
</html>
