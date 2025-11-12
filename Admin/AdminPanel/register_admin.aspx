<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register_admin.aspx.cs" Inherits="Online_Medicine_Ordering.Admin.AdminPanel.register_admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Registration - Pharmacy Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        .register-header {
            margin-bottom: 30px;
        }

        .register-header h1 {
            color: #333;
            margin-bottom: 10px;
            font-size: 2rem;
        }

        .register-header p {
            color: #666;
            font-size: 0.9rem;
        }

        .register-icon {
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

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 1rem;
        }

        .register-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
        }

        .register-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
        }

        .register-footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e1e5e9;
        }

        .register-footer a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <div class="register-header">
                <div class="register-icon"><i class="fas fa-user-plus"></i></div>
                <h1>Admin Registration</h1>
                <p>Create your Medicine management account</p>
            </div>

            <div class="form-group">
                <label for="txtfnm">Full Name</label>
                <div class="input-icon">
                    <i class="fas fa-id-card"></i>
                    <asp:TextBox ID="txtfnm" runat="server" CssClass="form-control" placeholder="Full Name" />
                </div>
            </div>

            <div class="form-group">
                <label for="txtem">Email</label>
                <div class="input-icon">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="txtem" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter Email" />
                </div>
            </div>

            <div class="form-group">
                <label for="txtmb">Mobile No</label>
                <div class="input-icon">
                    <i class="fas fa-phone"></i>
                    <asp:TextBox ID="txtmb" runat="server" TextMode="Phone" CssClass="form-control" placeholder="Enter Mobile No" />
                </div>
            </div>

            <div class="form-group">
                <label for="txtpw">Password</label>
                <div class="input-icon">
                    <i class="fas fa-lock"></i>
                     <asp:TextBox ID="txtpw" runat="server" TextMode="Phone" CssClass="form-control" placeholder="Enter Password" />

                </div>
            </div>

            <asp:Button ID="Button1" runat="server" Text="Register" CssClass="register-btn" OnClick="Button1_Click" />

            <div class="register-footer">
                <p>Already have an account? <a href="login_admin.aspx">Sign in here</a></p>
            </div>
        </div>
    </form>
</body>
</html>
