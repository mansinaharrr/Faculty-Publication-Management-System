<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Check if user is logged in
String userRole = (String) session.getAttribute("userRole");
String username = (String) session.getAttribute("username");

// If not logged in, redirect to login page
if (userRole == null || username == null) {
    response.sendRedirect("login.jsp");
    return;
}

// Get faculty ID for faculty users
String facultyId = (String) session.getAttribute("facultyId");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Publication Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .sidebar {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .sidebar .nav-link {
            color: white;
            padding: 15px 20px;
            margin: 5px 0;
            border-radius: 10px;
            transition: all 0.3s;
        }
        .sidebar .nav-link:hover {
            background: rgba(255,255,255,0.1);
            transform: translateX(5px);
        }
        .sidebar .nav-link.active {
            background: rgba(255,255,255,0.2);
        }
        .main-content {
            background: #f8f9fa;
            min-height: 100vh;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .stat-card-2 {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        .stat-card-3 {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
        }
        .stat-card-4 {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            color: white;
        }
        .stat-card-5 {
            background: linear-gradient(135deg, #f0a379 0%, #ff4400 100%);
            color: white;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
        }
        .logo-img {
            max-height: 50px; /* Adjust as needed */
            margin-bottom: 1rem;
        }
        .user-info {
            color: #667eea;
            font-weight: 500;
        }
        .role-badge {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar p-0">
                <div class="p-3 text-center">
                    <img src="images/srm_logo.png" alt="SRM Logo" class="logo-img">
                    <h4 class="text-white text-center mb-4">
                        FPMS
                    </h4>
                </div>
                <nav class="nav flex-column">
                    <a class="nav-link active" href="dashboard.jsp">
                        <i class="fas fa-tachometer-alt me-2"></i>Dashboard
                    </a>
                    
                    <% if ("Admin".equals(userRole)) { %>
                        <!-- Admin Navigation -->
                        <a class="nav-link" href="faculty.jsp">
                            <i class="fas fa-users me-2"></i>Faculty Members
                        </a>
                        <a class="nav-link" href="publications.jsp">
                            <i class="fas fa-book me-2"></i>All Publications
                        </a>
                        <a class="nav-link" href="journals.jsp">
                            <i class="fas fa-newspaper me-2"></i>Journals
                        </a>
                        <a class="nav-link" href="conferences.jsp">
                            <i class="fas fa-calendar-alt me-2"></i>Conferences
                        </a>
                        <a class="nav-link" href="departments.jsp">
                            <i class="fas fa-building me-2"></i>Departments
                        </a>
                        <a class="nav-link" href="reviews.jsp">
                            <i class="fas fa-clipboard-check me-2"></i>Reviews
                        </a>
                        <a class="nav-link" href="reports.jsp">
                            <i class="fas fa-chart-bar me-2"></i>Reports
                        </a>
                    <% } else if ("Faculty".equals(userRole)) { %>
                        <!-- Faculty Navigation -->
                        <a class="nav-link" href="publications.jsp">
                            <i class="fas fa-book me-2"></i>My Publications
                        </a>
                        <a class="nav-link" href="journals.jsp">
                            <i class="fas fa-newspaper me-2"></i>Journals
                        </a>
                        <a class="nav-link" href="conferences.jsp">
                            <i class="fas fa-calendar-alt me-2"></i>Conferences
                        </a>
                    <% } else if ("Reviewer".equals(userRole)) { %>
                        <!-- Reviewer Navigation -->
                        <a class="nav-link" href="reviews.jsp">
                            <i class="fas fa-clipboard-check me-2"></i>Review Publications
                        </a>
                        <a class="nav-link" href="publications.jsp">
                            <i class="fas fa-book me-2"></i>Publications
                        </a>
                    <% } %>
                    
                    <!-- Logout Button in Sidebar -->
                    <a class="nav-link" href="logout.jsp">
                        <i class="fas fa-sign-out-alt me-2"></i>Logout
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <!-- Top Navigation -->
                <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
                    <div class="container-fluid">
                        <span class="navbar-brand">Faculty Publication Management System</span>
                        <div class="navbar-nav ms-auto">
                            <div class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-user-circle me-1"></i>
                                    <span class="user-info"><%= username %></span>
                                    <span class="role-badge ms-2"><%= userRole %></span>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i>Profile</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Settings</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="logout.jsp"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                                </ul>
                            </div>
                            <!-- Logout Button in Top Navigation -->
                            <a class="nav-link" href="logout.jsp">
                                <i class="fas fa-sign-out-alt me-1"></i>Logout
                            </a>
                        </div>
                    </div>
                </nav>

                <!-- Dashboard Content -->
                <div class="p-4">
                    <h2 class="mb-4">
                        <% if ("Admin".equals(userRole)) { %>
                            Dashboard Overview
                        <% } else if ("Faculty".equals(userRole)) { %>
                            My Dashboard
                        <% } else { %>
                            Reviewer Dashboard
                        <% } %>
                    </h2>
                    
                    <!-- Statistics Cards -->
                    <div class="row mb-4">
                        <% if ("Admin".equals(userRole)) { %>
                            <!-- Admin sees all statistics -->
                            <div class="col-xl-2 col-md-4 col-sm-6 mb-4">
                                <div class="card stat-card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col">
                                                <h5 class="card-title">Faculty Members</h5>
                                                <h2 class="mb-0">4</h2>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-users fa-2x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                        
                        <div class="col-xl-2 col-md-4 col-sm-6 mb-4">
                            <div class="card stat-card-2">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title">
                                                <% if ("Admin".equals(userRole)) { %>
                                                    All Publications
                                                <% } else { %>
                                                    My Publications
                                                <% } %>
                                            </h5>
                                            <h2 class="mb-0">3</h2>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-book fa-2x"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-xl-2 col-md-4 col-sm-6 mb-4">
                            <div class="card stat-card-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title">Journals</h5>
                                            <h2 class="mb-0">3</h2>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-newspaper fa-2x"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-xl-2 col-md-4 col-sm-6 mb-4">
                            <div class="card stat-card-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title">Conferences</h5>
                                            <h2 class="mb-0">3</h2>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar-alt fa-2x"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <% if ("Admin".equals(userRole)) { %>
                            <div class="col-xl-2 col-md-4 col-sm-6 mb-4">
                                <div class="card stat-card-5">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col">
                                                <h5 class="card-title">Departments</h5>
                                                <h2 class="mb-0">4</h2>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-building fa-2x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    </div>

                    <!-- Recent Publications -->
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">
                                        <i class="fas fa-clock me-2"></i>
                                        <% if ("Admin".equals(userRole)) { %>
                                            Recent Publications
                                        <% } else { %>
                                            My Recent Publications
                                        <% } %>
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center border-bottom py-2">
                                        <div>
                                            <h6 class="mb-1">Machine Learning in Software Engineering</h6>
                                            <small class="text-muted">
                                                <i class="fas fa-user me-1"></i>Dr. John Smith | 
                                                <i class="fas fa-tag me-1"></i>Journal Article
                                            </small>
                                        </div>
                                        <small class="text-muted">
                                            <i class="fas fa-calendar me-1"></i>2024-01-15
                                        </small>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center border-bottom py-2">
                                        <div>
                                            <h6 class="mb-1">User Interface Design Patterns</h6>
                                            <small class="text-muted">
                                                <i class="fas fa-user me-1"></i>Dr. Sarah Johnson | 
                                                <i class="fas fa-tag me-1"></i>Conference Paper
                                            </small>
                                        </div>
                                        <small class="text-muted">
                                            <i class="fas fa-calendar me-1"></i>2024-03-20
                                        </small>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center border-bottom py-2">
                                        <div>
                                            <h6 class="mb-1">Robotics in Manufacturing</h6>
                                            <small class="text-muted">
                                                <i class="fas fa-user me-1"></i>Dr. Emily Davis | 
                                                <i class="fas fa-tag me-1"></i>Journal Article
                                            </small>
                                        </div>
                                        <small class="text-muted">
                                            <i class="fas fa-calendar me-1"></i>2024-02-10
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">
                                        <i class="fas fa-tasks me-2"></i>Quick Actions
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="d-grid gap-2">
                                        <% if ("Admin".equals(userRole)) { %>
                                            <!-- Admin Quick Actions -->
                                            <a href="add_publication.jsp" class="btn btn-primary">
                                                <i class="fas fa-plus me-2"></i>Add Publication
                                            </a>
                                            <a href="add_faculty.jsp" class="btn btn-success">
                                                <i class="fas fa-user-plus me-2"></i>Add Faculty
                                            </a>
                                            <a href="departments.jsp" class="btn btn-warning">
                                                <i class="fas fa-building me-2"></i>Manage Departments
                                            </a>
                                            <a href="reports.jsp" class="btn btn-info">
                                                <i class="fas fa-chart-line me-2"></i>Generate Report
                                            </a>
                                            <a href="reviews.jsp" class="btn btn-secondary">
                                                <i class="fas fa-clipboard-check me-2"></i>Review Publications
                                            </a>
                                        <% } else if ("Faculty".equals(userRole)) { %>
                                            <!-- Faculty Quick Actions -->
                                            <a href="add_publication.jsp" class="btn btn-primary">
                                                <i class="fas fa-plus me-2"></i>Add Publication
                                            </a>
                                            <a href="publications.jsp" class="btn btn-info">
                                                <i class="fas fa-book me-2"></i>View My Publications
                                            </a>
                                            <a href="journals.jsp" class="btn btn-success">
                                                <i class="fas fa-newspaper me-2"></i>Browse Journals
                                            </a>
                                            <a href="conferences.jsp" class="btn btn-warning">
                                                <i class="fas fa-calendar-alt me-2"></i>Browse Conferences
                                            </a>
                                        <% } else { %>
                                            <!-- Reviewer Quick Actions -->
                                            <a href="reviews.jsp" class="btn btn-primary">
                                                <i class="fas fa-clipboard-check me-2"></i>Review Publications
                                            </a>
                                            <a href="publications.jsp" class="btn btn-info">
                                                <i class="fas fa-book me-2"></i>View Publications
                                            </a>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>