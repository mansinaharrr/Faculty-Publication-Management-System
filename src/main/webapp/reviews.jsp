<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reviews - FPMS</title>
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
        .status-badge {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        .status-pending {
            background-color: #ffc107;
            color: #000;
        }
        .status-approved {
            background-color: #28a745;
            color: white;
        }
        .status-rejected {
            background-color: #dc3545;
            color: white;
        }
        .status-under-review {
            background-color: #17a2b8;
            color: white;
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
                    <a class="nav-link" href="departments.jsp">
                        <i class="fas fa-building me-2"></i>Departments
                    </a>
                    <a class="nav-link active" href="reviews.jsp">
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
                        <span class="navbar-brand">Review Management</span>
                        <div class="navbar-nav ms-auto">
                            <a class="nav-link" href="add_review.jsp" class="btn btn-primary">
                                <i class="fas fa-plus me-1"></i>Add Review
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
                                        <h3 class="mb-0">25</h3>
                                        <p class="mb-0">Total Reviews</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-clipboard-check fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3 class="mb-0">8</h3>
                                        <p class="mb-0">Pending Reviews</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-clock fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3 class="mb-0">15</h3>
                                        <p class="mb-0">Approved</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-check-circle fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3 class="mb-0">2</h3>
                                        <p class="mb-0">Rejected</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-times-circle fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Filter Section -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="form-label">Status Filter</label>
                                    <select class="form-select" id="statusFilter">
                                        <option value="">All Status</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Under Review">Under Review</option>
                                        <option value="Approved">Approved</option>
                                        <option value="Rejected">Rejected</option>
                                    </select>
                                </div>
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
                                    <label class="form-label">Date Range</label>
                                    <input type="date" class="form-control" id="dateFilter">
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

                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-clipboard-check me-2"></i>Review Status List
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Review ID</th>
                                            <th>Publication Title</th>
                                            <th>Author</th>
                                            <th>Type</th>
                                            <th>Status</th>
                                            <th>Reviewer</th>
                                            <th>Reviewed On</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Machine Learning in Software Engineering</td>
                                            <td>Dr. John Smith</td>
                                            <td>Journal Article</td>
                                            <td><span class="status-badge status-approved">Approved</span></td>
                                            <td>Dr. Sarah Johnson</td>
                                            <td>2024-01-10</td>
                                            <td>
                                                <a href="view_review.jsp?id=1" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a href="edit_review.jsp?id=1" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <button class="btn btn-sm btn-success btn-action" onclick="approveReview(1)">
                                                    <i class="fas fa-check"></i>
                                                </button>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="rejectReview(1)">
                                                    <i class="fas fa-times"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>User Interface Design Patterns</td>
                                            <td>Dr. Sarah Johnson</td>
                                            <td>Conference Paper</td>
                                            <td><span class="status-badge status-pending">Pending</span></td>
                                            <td>-</td>
                                            <td>-</td>
                                            <td>
                                                <a href="view_review.jsp?id=2" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a href="edit_review.jsp?id=2" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <button class="btn btn-sm btn-success btn-action" onclick="approveReview(2)">
                                                    <i class="fas fa-check"></i>
                                                </button>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="rejectReview(2)">
                                                    <i class="fas fa-times"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Robotics in Manufacturing</td>
                                            <td>Dr. Emily Davis</td>
                                            <td>Journal Article</td>
                                            <td><span class="status-badge status-approved">Approved</span></td>
                                            <td>Dr. Michael Brown</td>
                                            <td>2024-02-05</td>
                                            <td>
                                                <a href="view_review.jsp?id=3" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a href="edit_review.jsp?id=3" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <button class="btn btn-sm btn-success btn-action" onclick="approveReview(3)">
                                                    <i class="fas fa-check"></i>
                                                </button>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="rejectReview(3)">
                                                    <i class="fas fa-times"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>Advanced Algorithms for Data Mining</td>
                                            <td>Dr. Michael Brown</td>
                                            <td>Journal Article</td>
                                            <td><span class="status-badge status-under-review">Under Review</span></td>
                                            <td>Dr. John Smith</td>
                                            <td>2024-03-15</td>
                                            <td>
                                                <a href="view_review.jsp?id=4" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a href="edit_review.jsp?id=4" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <button class="btn btn-sm btn-success btn-action" onclick="approveReview(4)">
                                                    <i class="fas fa-check"></i>
                                                </button>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="rejectReview(4)">
                                                    <i class="fas fa-times"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>Mathematical Modeling in Engineering</td>
                                            <td>Dr. Sarah Johnson</td>
                                            <td>Conference Paper</td>
                                            <td><span class="status-badge status-rejected">Rejected</span></td>
                                            <td>Dr. Emily Davis</td>
                                            <td>2024-02-20</td>
                                            <td>
                                                <a href="view_review.jsp?id=5" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a href="edit_review.jsp?id=5" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <button class="btn btn-sm btn-success btn-action" onclick="approveReview(5)">
                                                    <i class="fas fa-check"></i>
                                                </button>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="rejectReview(5)">
                                                    <i class="fas fa-times"></i>
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
            const statusFilter = document.getElementById('statusFilter').value;
            const typeFilter = document.getElementById('typeFilter').value;
            const dateFilter = document.getElementById('dateFilter').value;
            
            // Here you would typically make an AJAX call to filter the data
            console.log('Applying filters:', { statusFilter, typeFilter, dateFilter });
            alert('Filters applied! (This would filter the data in a real application)');
        }

        function approveReview(id) {
            if (confirm('Are you sure you want to approve this review?')) {
                // Here you would typically make an AJAX call to approve the review
                alert('Review approved successfully!');
                // Reload the page or update the status
            }
        }

        function rejectReview(id) {
            if (confirm('Are you sure you want to reject this review?')) {
                // Here you would typically make an AJAX call to reject the review
                alert('Review rejected successfully!');
                // Reload the page or update the status
            }
        }
    </script>
</body>
</html>