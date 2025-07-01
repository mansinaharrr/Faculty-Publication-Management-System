<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - FPMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        .stats-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .chart-container {
            position: relative;
            height: 300px;
            margin: 20px 0;
        }
        .report-section {
            margin-bottom: 30px;
        }
        .btn-export {
            margin: 5px;
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
                    <a class="nav-link" href="reviews.jsp">
                        <i class="fas fa-clipboard-check me-2"></i>Reviews
                    </a>
                    <a class="nav-link active" href="reports.jsp">
                        <i class="fas fa-chart-bar me-2"></i>Reports
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <!-- Top Navigation -->
                <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
                    <div class="container-fluid">
                        <span class="navbar-brand">Reports & Analytics</span>
                        <div class="navbar-nav ms-auto">
                            <button class="btn btn-success me-2" onclick="exportReport('pdf')">
                                <i class="fas fa-file-pdf me-1"></i>Export PDF
                            </button>
                            <button class="btn btn-info me-2" onclick="exportReport('excel')">
                                <i class="fas fa-file-excel me-1"></i>Export Excel
                            </button>
                            <button class="btn btn-warning" onclick="printReport()">
                                <i class="fas fa-print me-1"></i>Print
                            </button>
                        </div>
                    </div>
                </nav>

                <!-- Content -->
                <div class="p-4">
                    <!-- Summary Statistics -->
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3 class="mb-0">156</h3>
                                        <p class="mb-0">Total Publications</p>
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
                                        <h3 class="mb-0">45</h3>
                                        <p class="mb-0">Faculty Members</p>
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
                                        <h3 class="mb-0">8.7</h3>
                                        <p class="mb-0">Avg Impact Factor</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-star fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3 class="mb-0">92%</h3>
                                        <p class="mb-0">Approval Rate</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-check-circle fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Publication Trends Chart -->
                    <div class="report-section">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0">
                                    <i class="fas fa-chart-line me-2"></i>Publication Trends (Last 5 Years)
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="chart-container">
                                    <canvas id="publicationTrendsChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Department Performance -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">
                                        <i class="fas fa-chart-pie me-2"></i>Publications by Department
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <canvas id="departmentChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">
                                        <i class="fas fa-chart-bar me-2"></i>Publication Types Distribution
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <canvas id="publicationTypesChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Top Performers -->
                    <div class="report-section">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0">
                                    <i class="fas fa-trophy me-2"></i>Top Performing Faculty Members
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>Rank</th>
                                                <th>Faculty Name</th>
                                                <th>Department</th>
                                                <th>Publications</th>
                                                <th>Total Citations</th>
                                                <th>Avg Impact Factor</th>
                                                <th>H-Index</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><span class="badge bg-warning">1</span></td>
                                                <td>Dr. John Smith</td>
                                                <td>Computer Science</td>
                                                <td>25</td>
                                                <td>1,234</td>
                                                <td>9.2</td>
                                                <td>15</td>
                                            </tr>
                                            <tr>
                                                <td><span class="badge bg-secondary">2</span></td>
                                                <td>Dr. Sarah Johnson</td>
                                                <td>Computer Science</td>
                                                <td>22</td>
                                                <td>987</td>
                                                <td>8.8</td>
                                                <td>12</td>
                                            </tr>
                                            <tr>
                                                <td><span class="badge bg-info">3</span></td>
                                                <td>Dr. Emily Davis</td>
                                                <td>Mechanical Engineering</td>
                                                <td>20</td>
                                                <td>756</td>
                                                <td>8.5</td>
                                                <td>10</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Dr. Michael Brown</td>
                                                <td>Electrical Engineering</td>
                                                <td>18</td>
                                                <td>654</td>
                                                <td>8.1</td>
                                                <td>9</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Dr. Robert Wilson</td>
                                                <td>Mathematics</td>
                                                <td>16</td>
                                                <td>543</td>
                                                <td>7.9</td>
                                                <td>8</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Journal Performance -->
                    <div class="report-section">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0">
                                    <i class="fas fa-newspaper me-2"></i>Top Journals by Publications
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>Journal Name</th>
                                                <th>ISSN</th>
                                                <th>Impact Factor</th>
                                                <th>Publications</th>
                                                <th>Total Citations</th>
                                                <th>Publisher</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>IEEE Transactions on Software Engineering</td>
                                                <td>0098-5589</td>
                                                <td>4.778</td>
                                                <td>12</td>
                                                <td>456</td>
                                                <td>IEEE</td>
                                            </tr>
                                            <tr>
                                                <td>ACM Computing Surveys</td>
                                                <td>0360-0300</td>
                                                <td>14.324</td>
                                                <td>8</td>
                                                <td>234</td>
                                                <td>ACM</td>
                                            </tr>
                                            <tr>
                                                <td>Nature</td>
                                                <td>0028-0836</td>
                                                <td>49.962</td>
                                                <td>3</td>
                                                <td>189</td>
                                                <td>Nature Publishing Group</td>
                                            </tr>
                                            <tr>
                                                <td>Science</td>
                                                <td>0036-8075</td>
                                                <td>47.728</td>
                                                <td>2</td>
                                                <td>156</td>
                                                <td>AAAS</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Review Statistics -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">
                                        <i class="fas fa-clipboard-check me-2"></i>Review Status Distribution
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <canvas id="reviewStatusChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">
                                        <i class="fas fa-clock me-2"></i>Average Review Time (Days)
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <canvas id="reviewTimeChart"></canvas>
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
    <script>
        // Publication Trends Chart
        const trendsCtx = document.getElementById('publicationTrendsChart').getContext('2d');
        new Chart(trendsCtx, {
            type: 'line',
            data: {
                labels: ['2019', '2020', '2021', '2022', '2023'],
                datasets: [{
                    label: 'Publications',
                    data: [25, 32, 28, 35, 36],
                    borderColor: '#667eea',
                    backgroundColor: 'rgba(102, 126, 234, 0.1)',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Department Chart
        const deptCtx = document.getElementById('departmentChart').getContext('2d');
        new Chart(deptCtx, {
            type: 'doughnut',
            data: {
                labels: ['Computer Science', 'Electrical Engineering', 'Mechanical Engineering', 'Mathematics'],
                datasets: [{
                    data: [45, 32, 28, 15],
                    backgroundColor: ['#667eea', '#764ba2', '#f093fb', '#f5576c']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

        // Publication Types Chart
        const typesCtx = document.getElementById('publicationTypesChart').getContext('2d');
        new Chart(typesCtx, {
            type: 'bar',
            data: {
                labels: ['Journal Articles', 'Conference Papers', 'Book Chapters', 'Technical Reports'],
                datasets: [{
                    label: 'Count',
                    data: [65, 45, 25, 21],
                    backgroundColor: ['#667eea', '#764ba2', '#f093fb', '#f5576c']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Review Status Chart
        const reviewCtx = document.getElementById('reviewStatusChart').getContext('2d');
        new Chart(reviewCtx, {
            type: 'pie',
            data: {
                labels: ['Approved', 'Pending', 'Under Review', 'Rejected'],
                datasets: [{
                    data: [65, 20, 10, 5],
                    backgroundColor: ['#28a745', '#ffc107', '#17a2b8', '#dc3545']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

        // Review Time Chart
        const timeCtx = document.getElementById('reviewTimeChart').getContext('2d');
        new Chart(timeCtx, {
            type: 'bar',
            data: {
                labels: ['Computer Science', 'Electrical Engineering', 'Mechanical Engineering', 'Mathematics'],
                datasets: [{
                    label: 'Average Days',
                    data: [12, 15, 18, 10],
                    backgroundColor: ['#667eea', '#764ba2', '#f093fb', '#f5576c']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        function exportReport(format) {
            alert(`Exporting report as ${format.toUpperCase()}...`);
            // Here you would implement the actual export functionality
        }

        function printReport() {
            window.print();
        }
    </script>
</body>
</html>