<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Journals - FPMS</title>
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
        .impact-factor {
            font-weight: bold;
            color: #28a745;
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
                    <a class="nav-link active" href="journals.jsp">
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
                        <span class="navbar-brand">Journals Management</span>
                        <div class="navbar-nav ms-auto">
                            <a class="nav-link" href="add_journal.jsp" class="btn btn-primary">
                                <i class="fas fa-plus me-1"></i>Add Journal
                            </a>
                        </div>
                    </div>
                </nav>

                <!-- Content -->
                <div class="p-4">
                    <!-- Statistics Cards -->
                    <div class="row mb-4">
                        <div class="col-md-6 mb-4">
                            <div class="card bg-primary text-white">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title">Total Journals</h5>
                                            <h2 class="mb-0">3</h2>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-newspaper fa-2x"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6 mb-4">
                            <div class="card bg-success text-white">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title">Average Impact Factor</h5>
                                            <h2 class="mb-0">23.021</h2>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-chart-line fa-2x"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Journals Table -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="fas fa-newspaper me-2"></i>Journals List
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Emp ID</th>
                                            <th>Name</th>
                                            <th>ISSN</th>
                                            <th>Publisher</th>
                                            <th>Impact Factor</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>IEEE Transactions on Software Engineering</td>
                                            <td>0098-5589</td>
                                            <td>IEEE</td>
                                            <td>
                                                <span class="impact-factor">4.778</span>
                                            </td>
                                            <td>
                                                <a href="edit_journal.jsp?id=1" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="view_journal_publications.jsp?id=1" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-book"></i>
                                                </a>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="deleteJournal(1)">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>ACM Computing Surveys</td>
                                            <td>0360-0300</td>
                                            <td>ACM</td>
                                            <td>
                                                <span class="impact-factor">14.324</span>
                                            </td>
                                            <td>
                                                <a href="edit_journal.jsp?id=2" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="view_journal_publications.jsp?id=2" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-book"></i>
                                                </a>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="deleteJournal(2)">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Nature</td>
                                            <td>0028-0836</td>
                                            <td>Nature Publishing Group</td>
                                            <td>
                                                <span class="impact-factor">49.962</span>
                                            </td>
                                            <td>
                                                <a href="edit_journal.jsp?id=3" class="btn btn-sm btn-primary btn-action">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="view_journal_publications.jsp?id=3" class="btn btn-sm btn-info btn-action">
                                                    <i class="fas fa-book"></i>
                                                </a>
                                                <button class="btn btn-sm btn-danger btn-action" onclick="deleteJournal(3)">
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
        function deleteJournal(journalId) {
            if(confirm('Are you sure you want to delete this journal?')) {
                // You can implement AJAX call here to delete journal
                alert('Delete functionality would be implemented here');
            }
        }
    </script>
</body>
</html>