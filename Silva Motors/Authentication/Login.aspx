<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Silva Motors Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    <style>
        body {
            background-color: #000;
            color: #fff;
            overflow-x: hidden;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            position: relative;
            width: 150%;
            height: 80%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .car-image {
            position: absolute;
            width: 150%;
            height: 150%;
            object-fit: contain;
            z-index: 0;
            opacity: 0.8;
        }
        .login-form-container {
            position: relative;
            z-index: 1;
            background-color: rgba(0, 0, 0, 0.9);
            border: 1px solid #ff0000;
            border-radius: 5px;
            padding: 40px;
            height: 80%;
            width: 550px; 
            opacity: 0.9;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-title {
            color: #ff0000;
            text-align: center;
            font-size: 36px;
            margin-bottom: 30px;
            font-weight: bold;
        }
        .form-label {
            color: #fff;
            margin-bottom: 8px;
        }
        .form-control {
            background-color: #f8f9fa;
            border: none;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 5px;
            width: 100%; 
        }
        .login-btn {
            background-color: #a90000;
            color: white;
            border: none;
            width: 100%;
            padding: 12px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 25px;
        }
        .login-btn:hover {
            background-color: #cc0000;
        }
        #loginForm {
            width: 100%; 
        }
        .password-container {
            position: relative;
        }
        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #666;
            z-index: 10;
        }
        .password-field {
            padding-right: 40px; 
        }
    </style>
</head>
<body>
    <div class="login-container">
        <img src="<%= ResolveUrl("~/Content/src/login.jpg") %>" alt="Login" class="car-image" />
        <div class="login-form-container">
            <form id="loginForm" runat="server">
                <h2 class="login-title">Login</h2>
                
                <div class="mb-3">
                    <label for="txtUsername" class="form-label">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                </div>
                
                <div class="mb-4">
                    <label for="txtPassword" class="form-label">Password</label>
                    <div class="password-container">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control password-field" placeholder="Enter Password"></asp:TextBox>
                        <span class="password-toggle" id="togglePassword">
                            <i class="bi bi-eye-slash" id="toggleIcon"></i>
                        </span>
                    </div>
                </div>
                
                <div class="mb-3">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-btn" />
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const togglePassword = document.getElementById('togglePassword');
            const passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            const toggleIcon = document.getElementById('toggleIcon');

            togglePassword.addEventListener('click', function () {
                // Toggle the password field type
                const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordField.setAttribute('type', type);
                
                // Toggle the icon
                if (type === 'password') {
                    toggleIcon.classList.remove('bi-eye');
                    toggleIcon.classList.add('bi-eye-slash');
                } else {
                    toggleIcon.classList.remove('bi-eye-slash');
                    toggleIcon.classList.add('bi-eye');
                }
            });
        });
    </script>
</body>
</html>