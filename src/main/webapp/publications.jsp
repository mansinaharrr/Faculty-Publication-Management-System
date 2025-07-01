<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publications - FPMS</title>
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
        .publication-type {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 0.8rem;
            font-weight: bold;
        }
        .type-journal {
            background: #e3f2fd;
            color: #1976d2;
        }
        .type-conference {
            background: #f3e5f5;
            color: #7b1fa2;
        }
        .type-book {
            background: #e8f5e8;
            color: #388e3c;
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
                    <a class="nav-link active" href="publications.jsp">
                        <i class="fas fa-book me-2"></i>Publications
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
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <!-- Top Navigation -->
                <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
                    <div class="container-fluid">
                        <span class="navbar-brand">Publications Management</span>
                        <div class="navbar-nav ms-auto">
                            <a class="nav-link" href="add_publication.jsp" class="btn btn-primary">
                                <i class="fas fa-plus me-1"></i>Add Publication
                            </a>
                        </div>
                    </div>
                </nav>

                <!-- Content -->
                <div class="p-4">
                    <!-- Filters -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="form-label">Publication Type</label>
                                    <select class="form-select" id="typeFilter">
                                        <option value="">All Types</option>
                                        <option value="Journal Article">Journal Article</option>
                                        <option value="Conference Paper">Conference Paper</option>
                                        <option value="Book Chapter">Book Chapter</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">Department</label>
                                    <select class="form-select" id="deptFilter">
                                        <option value="">All Departments</option>
                                        <option value="1">Computer Science</option>
                                        <option value="2">Electrical Engineering</option>
                                        <option value="3">Mechanical Engineering</option>
                                        <option value="4">Mathematics</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">Year</label>
                                    <select class="form-select" id="yearFilter">
                                        <option value="">All Years</option>
                                        <option value="2024">2024</option>
                                        <option value="2023">2023</option>
                                        <option value="2022">2022</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">&nbsp;</label>
                                    <button class="btn btn-primary w-100" onclick="applyFilters()">
                                        <i class="fas fa-filter me-1"></i>Apply Filters
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Publications Table -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-book me-2"></i>Publications List
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Emp ID</th>
                                            <th>Title</th>
                                            <th>Type</th>
                                            <th>Faculty</th>
                                            <th>Department</th>
                                            <th>Publication Date</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Machine Learning in Software Engineering</td>
                                            <td>
                                                <span class="publication-type type-journal">
                                                    Journal Article
                                                </span>
                                            </td>
                                            <td>Dr. John Smith</td>
                                            <td>Computer Science</td>
                                            <td>2024-01-15</td>
                                            <td>
                                                <span class="badge bg-success">Approved</span>
                                            </td>
                                            <td>
                                                <a href="view_publication.jsp?id=1" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a href="edit_publication.jsp?id=1" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="deletePublication(1)">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>User Interface Design Patterns</td>
                                            <td>
                                                <span class="publication-type type-conference">
                                                    Conference Paper
                                                </span>
                                            </td>
                                            <td>Dr. Sarah Johnson</td>
                                            <td>Computer Science</td>
                                            <td>2024-03-20</td>
                                            <td>
                                                <span class="badge bg-warning">Pending</span>
                                            </td>
                                            <td>
                                                <a href="view_publication.jsp?id=2" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a href="edit_publication.jsp?id=2" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="deletePublication(2)">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Robotics in Manufacturing</td>
                                            <td>
                                                <span class="publication-type type-journal">
                                                    Journal Article
                                                </span>
                                            </td>
                                            <td>Dr. Emily Davis</td>
                                            <td>Mechanical Engineering</td>
                                            <td>2024-02-10</td>
                                            <td>
                                                <span class="badge bg-success">Approved</span>
                                            </td>
                                            <td>
                                                <a href="view_publication.jsp?id=3" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a href="edit_publication.jsp?id=3" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="deletePublication(3)">
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
        function applyFilters() {
            // Implement filter functionality
            alert('Filter functionality would be implemented here');
        }
        
        function deletePublication(publicationId) {
            if(confirm('Are you sure you want to delete this publication?')) {
                // You can implement AJAX call here to delete publication
                alert('Delete functionality would be implemented here');
            }
        }
    </script>
</body>
</html>