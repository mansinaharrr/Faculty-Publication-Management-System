<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Publication - FPMS</title>
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
        .form-control {
            border-radius: 10px;
            border: 2px solid #e9ecef;
            padding: 12px 15px;
            transition: all 0.3s;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-submit {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: bold;
            transition: all 0.3s;
        }
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar p-0">
                <div class="p-3">
                    <h4 class="text-white text-center mb-4">
                        <i class="fas fa-university me-2"></i>FPMS
                    </h4>
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
                        <span class="navbar-brand">Add New Publication</span>
                        <div class="navbar-nav ms-auto">
                            <a class="nav-link" href="publications.jsp">
                                <i class="fas fa-arrow-left me-1"></i>Back to Publications
                            </a>
                        </div>
                    </div>
                </nav>

                <!-- Content -->
                <div class="p-4">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">
                                        <i class="fas fa-plus me-2"></i>Publication Information
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <form action="add_publication_process.jsp" method="post" id="publicationForm">
                                        <!-- Unique Publication ID -->
                                        <div class="mb-3">
                                            <label for="publicationId" class="form-label">Publication ID *</label>
                                            <input type="text" class="form-control" id="publicationId" name="publicationId" readonly required>
                                            <small class="text-muted">This ID is auto-generated to ensure uniqueness.</small>
                                        </div>

                                        <!-- Author Roles Section -->
                                        <div class="mb-4">
                                            <div class="card shadow-sm border-0 mb-3">
                                                <div class="card-header bg-gradient text-white" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 10px 10px 0 0;">
                                                    <h6 class="mb-0"><i class="fas fa-user-edit me-2"></i>Authors</h6>
                                                </div>
                                                <div class="card-body bg-light">
                                                    <div class="row g-3 mb-3 align-items-end">
                                                        <div class="col-md-3">
                                                            <label class="form-label">1st Author *</label>
                                                            <select class="form-select author-type" name="author1_type" required>
                                                                <option value="">Select Type</option>
                                                                <option value="Faculty">Faculty</option>
                                                                <option value="Research Scholar">Research Scholar</option>
                                                                <option value="SRM Student">SRM Student</option>
                                                                <option value="Other College">Other College</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-9 author-details" id="author1_details"></div>
                                                    </div>
                                                    <div class="row g-3 mb-3 align-items-end">
                                                        <div class="col-md-3">
                                                            <label class="form-label">2nd Author</label>
                                                            <select class="form-select author-type" name="author2_type">
                                                                <option value="">Select Type</option>
                                                                <option value="Faculty">Faculty</option>
                                                                <option value="Research Scholar">Research Scholar</option>
                                                                <option value="SRM Student">SRM Student</option>
                                                                <option value="Other College">Other College</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-9 author-details" id="author2_details"></div>
                                                    </div>
                                                    <div class="row g-3 mb-3 align-items-end">
                                                        <div class="col-md-3">
                                                            <label class="form-label">3rd Author</label>
                                                            <select class="form-select author-type" name="author3_type">
                                                                <option value="">Select Type</option>
                                                                <option value="Faculty">Faculty</option>
                                                                <option value="Research Scholar">Research Scholar</option>
                                                                <option value="SRM Student">SRM Student</option>
                                                                <option value="Other College">Other College</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-9 author-details" id="author3_details"></div>
                                                    </div>
                                                    <div class="row g-3 mb-3 align-items-end">
                                                        <div class="col-md-3">
                                                            <label class="form-label">Corresponding Author *</label>
                                                            <select class="form-select author-type" name="corresponding_author_type" required>
                                                                <option value="">Select Type</option>
                                                                <option value="Faculty">Faculty</option>
                                                                <option value="Research Scholar">Research Scholar</option>
                                                                <option value="SRM Student">SRM Student</option>
                                                                <option value="Other College">Other College</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-9 author-details" id="corresponding_author_details"></div>
                                                    </div>
                                                    <div class="text-muted small mt-2">Name is required for all authors. For Faculty, Research Scholar, and SRM Student, enter both Name and ID. For Other College, enter Name and College Name.</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-8 mb-3">
                                                <label for="title" class="form-label">Publication Title *</label>
                                                <input type="text" class="form-control" id="title" name="title" required>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label for="type" class="form-label">Publication Type *</label>
                                                <select class="form-select" id="type" name="type" required>
                                                    <option value="">Select Type</option>
                                                    <option value="Journal Article">Journal Article</option>
                                                    <option value="Conference Paper">Conference Paper</option>
                                                    <option value="Book Chapter">Book Chapter</option>
                                                    <option value="Book">Book</option>
                                                    <option value="Technical Report">Technical Report</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="publicationDate" class="form-label">Publication Date *</label>
                                                <input type="date" class="form-control" id="publicationDate" name="publicationDate" required>
                                            </div>
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label for="abstract" class="form-label">Abstract</label>
                                            <textarea class="form-control" id="abstract" name="abstract" rows="4" placeholder="Enter publication abstract"></textarea>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="journal" class="form-label">Journal (for Journal Articles)</label>
                                                <select class="form-select" id="journal" name="journal">
                                                    <option value="">Select Journal</option>
                                                    <option value="1">IEEE Transactions on Software Engineering</option>
                                                    <option value="2">ACM Computing Surveys</option>
                                                    <option value="3">Nature</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="conference" class="form-label">Conference (for Conference Papers)</label>
                                                <select class="form-select" id="conference" name="conference">
                                                    <option value="">Select Conference</option>
                                                    <option value="1">ICSE 2024</option>
                                                    <option value="2">SIGCHI 2024</option>
                                                    <option value="3">FSE 2024</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="keywords" class="form-label">Keywords</label>
                                                <input type="text" class="form-control" id="keywords" name="keywords" placeholder="e.g., machine learning, software engineering, AI">
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex justify-content-between">
                                            <a href="publications.jsp" class="btn btn-secondary">
                                                <i class="fas fa-times me-2"></i>Cancel
                                            </a>
                                            <button type="submit" class="btn btn-primary btn-submit">
                                                <i class="fas fa-save me-2"></i>Add Publication
                                            </button>
                                        </div>
                                    </form>
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
    // Unique Publication ID generator (client-side, for demo; use server-side for production)
    function generatePublicationId() {
        const now = new Date();
        return 'PUB' + now.getFullYear().toString().slice(-2) +
            (now.getMonth()+1).toString().padStart(2, '0') +
            now.getDate().toString().padStart(2, '0') +
            '-' + Math.random().toString(36).substr(2, 6).toUpperCase();
    }
    document.getElementById('publicationId').value = generatePublicationId();

    // Author type dynamic fields
    function getAuthorFields(type, idx) {
        let nameField = `<input type="text" class="form-control mb-1" name="author${idx}_name" placeholder="Name" required>`;
        if (type === 'Faculty') {
            return nameField + `<input type="text" class="form-control mb-1" name="author${idx}_empid" placeholder="Faculty Emp ID" required>`;
        } else if (type === 'Research Scholar') {
            return nameField + `<input type="text" class="form-control mb-1" name="author${idx}_scholarid" placeholder="Scholar ID" required>`;
        } else if (type === 'SRM Student') {
            return nameField + `<input type="text" class="form-control mb-1" name="author${idx}_regno" placeholder="SRM Register Number" required>`;
        } else if (type === 'Other College') {
            return nameField + `<input type="text" class="form-control mb-1" name="author${idx}_college" placeholder="College Name" required>`;
        } else {
            return '';
        }
    }

    function setupAuthorFields() {
        const authorTypes = [
            {select: 'author1_type', details: 'author1_details', idx: 1},
            {select: 'author2_type', details: 'author2_details', idx: 2},
            {select: 'author3_type', details: 'author3_details', idx: 3},
            {select: 'corresponding_author_type', details: 'corresponding_author_details', idx: 'corresponding'}
        ];
        authorTypes.forEach(({select, details, idx}) => {
            const sel = document.getElementsByName(select)[0];
            const det = document.getElementById(details);
            sel.addEventListener('change', function() {
                det.innerHTML = getAuthorFields(this.value, idx);
            });
        });
    }
    document.addEventListener('DOMContentLoaded', setupAuthorFields);
    </script>
</body>
</html>