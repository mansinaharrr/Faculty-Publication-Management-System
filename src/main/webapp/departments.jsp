<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Departments - FPMS</title>
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
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
        }
        .btn-action {
            margin: 0 2px;
        }
        .stats-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar p-0">
                <div class="p-3 text-center">
                    <img src="https://upload.wikimedia.org/wikipedia/en/c/c5/SRM_Institute_of_Science_and_Technology_Logo.svg" alt="SRM Logo" class="logo-img">
                </div>
                <nav class="nav flex-column">
                    <a class="nav-link" href="dashboard.jsp">
                        <i class="fas fa-tachometer-alt me-2"></i>Dashboard
                    </a>
                    <a class="nav-link" href="faculty.jsp">
                        <i class="fas fa-users me-2"></i>Faculty Members
                    </a>
                    <a class="nav-link" href="publications.jsp">
                        <i class="fas fa-book me-2"></i>Publications
                    </a>
                    <a class="nav-link" href="journals.jsp">
                        <i class="fas fa-newspaper me-2"></i>Journals
                    </a>
                    <a class="nav-link" href="conferences.jsp">
                        <i class="fas fa-calendar-alt me-2"></i>Conferences
                    </a>
                    <a class="nav-link active" href="departments.jsp">
                        <i class="fas fa-building me-2"></i>Departments
                    </a>
                    <a class="nav-link" href="reviews.jsp">
                        <i class="fas fa-clipboard-check me-2"></i>Reviews
                    </a>
                    <a class="nav-link" href="reports.jsp">
                        <i class="fas fa-chart-bar me-2"></i>Reports
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <!-- Top Navigation -->
                <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
                    <div class="container-fluid">
                        <span class="navbar-brand">Department Management</span>
                        <div class="navbar-nav ms-auto">
                            <a class="nav-link" href="add_department.jsp" class="btn btn-primary">
                                <i class="fas fa-plus me-1"></i>Add Department
                            </a>
                        </div>
                    </div>
                </nav>

                <!-- Content -->
                <div class="p-4">
                    <!-- Statistics Cards -->
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3 class="mb-0">4</h3>
                                        <p class="mb-0">Total Departments</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-building fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3 class="mb-0">12</h3>
                                        <p class="mb-0">Total Faculty</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-users fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3 class="mb-0">45</h3>
                                        <p class="mb-0">Publications</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-book fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3 class="mb-0">8.5</h3>
                                        <p class="mb-0">Avg. Impact Factor</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-star fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-building me-2"></i>Departments List
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Emp ID</th>
                                            <th>Department Name</th>
                                            <th>Head of Department</th>
                                            <th>Faculty Count</th>
                                            <th>Publications</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Computer Science</td>
                                            <td>Dr. John Smith</td>
                                            <td>4</td>
                                            <td>18</td>
                                            <td>
                                                <a href="edit_department.jsp?id=1" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="view_department_faculty.jsp?id=1" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-users"></i>
                                                </a>
                                                <a href="view_department_publications.jsp?id=1" class="btn btn-sm btn-success btn-action">
                                                    <i class="fas fa-book"></i>
                                                </a>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="deleteDepartment(1)">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Electrical Engineering</td>
                                            <td>Dr. Michael Brown</td>
                                            <td>3</td>
                                            <td>12</td>
                                            <td>
                                                <a href="edit_department.jsp?id=2" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="view_department_faculty.jsp?id=2" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-users"></i>
                                                </a>
                                                <a href="view_department_publications.jsp?id=2" class="btn btn-sm btn-success btn-action">
                                                    <i class="fas fa-book"></i>
                                                </a>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="deleteDepartment(2)">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Mechanical Engineering</td>
                                            <td>Dr. Emily Davis</td>
                                            <td>3</td>
                                            <td>10</td>
                                            <td>
                                                <a href="edit_department.jsp?id=3" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="view_department_faculty.jsp?id=3" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-users"></i>
                                                </a>
                                                <a href="view_department_publications.jsp?id=3" class="btn btn-sm btn-success btn-action">
                                                    <i class="fas fa-book"></i>
                                                </a>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="deleteDepartment(3)">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>Mathematics</td>
                                            <td>Dr. Sarah Johnson</td>
                                            <td>2</td>
                                            <td>5</td>
                                            <td>
                                                <a href="edit_department.jsp?id=4" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="view_department_faculty.jsp?id=4" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-users"></i>
                                                </a>
                                                <a href="view_department_publications.jsp?id=4" class="btn btn-sm btn-success btn-action">
                                                    <i class="fas fa-book"></i>
                                                </a>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="deleteDepartment(4)">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function deleteDepartment(id) {
            if (confirm('Are you sure you want to delete this department?')) {
                // Here you would typically make an AJAX call to delete the department
                alert('Department deleted successfully!');
                // Reload the page or remove the row from the table
            }
        }
    </script>
</body>
</html>