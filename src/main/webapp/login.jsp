<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Check if user is already logged in
    if (session.getAttribute("isLoggedIn") != null && (Boolean) session.getAttribute("isLoggedIn")) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
    
    // Handle logout success message
    String message = request.getParameter("message");
    if ("logout_success".equals(message)) {
        request.setAttribute("success", "You have been successfully logged out.");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Faculty Publication Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
            max-width: 450px;
            width: 100%;
        }
        .login-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            text-align: center;
        }
        .login-body {
            padding: 40px;
        }
        .form-control {
            border-radius: 10px;
            border: 2px solid #e9ecef;
            padding: 15px;
            transition: all 0.3s;
            font-size: 16px;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 15px;
            font-weight: bold;
            font-size: 16px;
            transition: all 0.3s;
            width: 100%;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }
        .input-group-text {
            background: transparent;
            border: 2px solid #e9ecef;
            border-right: none;
            color: #6c757d;
        }
        .form-control {
            border-left: none;
        }
        .password-toggle {
            cursor: pointer;
            color: #6c757d;
        }
        .password-toggle:hover {
            color: #667eea;
        }
        .demo-credentials {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
        }
        .error-message {
            color: #dc3545;
            font-size: 14px;
            margin-top: 5px;
        }
        .back-link {
            color: #667eea;
            text-decoration: none;
            transition: all 0.3s;
        }
        .back-link:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        .alert {
            border-radius: 10px;
            border: none;
        }
        .demo-btn {
            margin: 2px;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="login-container">
                    <div class="login-header">
                        <h3><i class="fas fa-university me-2"></i>FPMS</h3>
                        <p class="mb-0">Faculty Publication Management System</p>
                    </div>
                    <div class="login-body">
                        <!-- Error Message Display -->
                        <% if (request.getAttribute("error") != null) { %>
                            <div class="alert alert-danger">
                                <i class="fas fa-exclamation-triangle me-2"></i>
                                <%= request.getAttribute("error") %>
                            </div>
                        <% } %>
                        
                        <!-- Success Message Display -->
                        <% if (request.getAttribute("success") != null) { %>
                            <div class="alert alert-success">
                                <i class="fas fa-check-circle me-2"></i>
                                <%= request.getAttribute("success") %>
                            </div>
                        <% } %>
                        
                        <form action="login" method="post" id="loginForm">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username or Email</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="fas fa-user"></i>
                                    </span>
                                    <input type="text" class="form-control" id="username" name="username" 
                                           value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>"
                                           required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="fas fa-lock"></i>
                                    </span>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                    <span class="input-group-text password-toggle" onclick="togglePassword()">
                                        <i class="fas fa-eye"></i>
                                    </span>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="role" class="form-label">Role</label>
                                <select class="form-select" id="role" name="role" required>
                                    <option value="">Select Role</option>
                                    <option value="Admin" <%= "Admin".equals(request.getAttribute("role")) ? "selected" : "" %>>Admin</option>
                                    <option value="Faculty" <%= "Faculty".equals(request.getAttribute("role")) ? "selected" : "" %>>Faculty</option>
                                    <option value="Reviewer" <%= "Reviewer".equals(request.getAttribute("role")) ? "selected" : "" %>>Reviewer</option>
                                </select>
                            </div>
                            
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="remember-me" name="remember-me">
                                <label class="form-check-label" for="remember-me">
                                    Remember me
                                </label>
                            </div>
                            
                            <button type="submit" class="btn btn-primary btn-login">
                                <i class="fas fa-sign-in-alt me-2"></i>Sign In
                            </button>
                        </form>
                        
                        <div class="text-center mt-3">
                            <a href="dashboard.jsp" class="back-link">
                                <i class="fas fa-home me-1"></i>Back to Dashboard
                            </a>
                        </div>
                        
                        <!-- Demo Credentials -->
                        <div class="demo-credentials">
                            <h6 class="text-muted mb-3">
                                <i class="fas fa-info-circle me-2"></i>Demo Credentials
                            </h6>
                            <div class="text-center mb-2">
                                <button type="button" class="btn btn-sm btn-outline-primary demo-btn" onclick="fillDemoCredentials('admin')">
                                    Admin
                                </button>
                                <button type="button" class="btn btn-sm btn-outline-success demo-btn" onclick="fillDemoCredentials('faculty')">
                                    Faculty
                                </button>
                                <button type="button" class="btn btn-sm btn-outline-warning demo-btn" onclick="fillDemoCredentials('reviewer')">
                                    Reviewer
                                </button>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <strong>Admin:</strong><br>
                                    <small class="text-muted">admin / admin123</small>
                                </div>
                                <div class="col-md-4">
                                    <strong>Faculty:</strong><br>
                                    <small class="text-muted">faculty1 / faculty123</small>
                                </div>
                                <div class="col-md-4">
                                    <strong>Reviewer:</strong><br>
                                    <small class="text-muted">reviewer1 / reviewer123</small>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Database Status -->
                        <div class="mt-3 text-center">
                            <a href="simple_db_test.jsp" class="btn btn-sm btn-outline-info">
                                <i class="fas fa-database me-1"></i>Test Database Connection
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const icon = event.target;
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
        
        // Form validation
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();
            const role = document.getElementById('role').value;
            
            if (!username || !password || !role) {
                e.preventDefault();
                alert('Please fill in all fields.');
                return false;
            }
        });
        
        // Auto-fill demo credentials for testing
        function fillDemoCredentials(type) {
            switch(type) {
                case 'admin':
                    document.getElementById('username').value = 'admin';
                    document.getElementById('password').value = 'admin123';
                    document.getElementById('role').value = 'Admin';
                    break;
                case 'faculty':
                    document.getElementById('username').value = 'faculty1';
                    document.getElementById('password').value = 'faculty123';
                    document.getElementById('role').value = 'Faculty';
                    break;
                case 'reviewer':
                    document.getElementById('username').value = 'reviewer1';
                    document.getElementById('password').value = 'reviewer123';
                    document.getElementById('role').value = 'Reviewer';
                    break;
            }
        }
    </script>
</body>
</html>