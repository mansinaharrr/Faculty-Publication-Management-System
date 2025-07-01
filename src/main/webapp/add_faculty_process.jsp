<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Added - FPMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .success-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
            max-width: 500px;
            width: 100%;
        }
        .success-header {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }
        .success-body {
            padding: 40px;
        }
        .btn-action {
            border-radius: 10px;
            padding: 12px 25px;
            font-weight: bold;
            transition: all 0.3s;
        }
        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="success-card">
                    <div class="success-header">
                        <i class="fas fa-check-circle fa-3x mb-3"></i>
                        <h3>Faculty Member Added Successfully!</h3>
                        <p class="mb-0">The new faculty member has been added to the system.</p>
                    </div>
                    <div class="success-body">
                        <%
                        // Get form data
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String phone = request.getParameter("phone");
                        String designation = request.getParameter("designation");
                        String department = request.getParameter("department");
                        %>
                        
                        <div class="alert alert-info">
                            <h6><i class="fas fa-info-circle me-2"></i>Faculty Details:</h6>
                            <ul class="mb-0">
                                <li><strong>Name:</strong> <%= name != null ? name : "N/A" %></li>
                                <li><strong>Email:</strong> <%= email != null ? email : "N/A" %></li>
                                <li><strong>Phone:</strong> <%= phone != null && !phone.isEmpty() ? phone : "N/A" %></li>
                                <li><strong>Designation:</strong> <%= designation != null ? designation : "N/A" %></li>
                                <li><strong>Department:</strong> 
                                    <%
                                    if(department != null) {
                                        switch(department) {
                                            case "1": out.print("Computer Science"); break;
                                            case "2": out.print("Electrical Engineering"); break;
                                            case "3": out.print("Mechanical Engineering"); break;
                                            case "4": out.print("Mathematics"); break;
                                            case "5": out.print("Physics"); break;
                                            case "6": out.print("Chemistry"); break;
                                            default: out.print("N/A");
                                        }
                                    } else {
                                        out.print("N/A");
                                    }
                                    %>
                                </li>
                            </ul>
                        </div>
                        
                        <div class="d-grid gap-2">
                            <a href="faculty.jsp" class="btn btn-primary btn-action">
                                <i class="fas fa-users me-2"></i>View All Faculty Members
                            </a>
                            <a href="add_faculty.jsp" class="btn btn-success btn-action">
                                <i class="fas fa-plus me-2"></i>Add Another Faculty Member
                            </a>
                            <a href="dashboard.jsp" class="btn btn-secondary btn-action">
                                <i class="fas fa-home me-2"></i>Back to Dashboard
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Auto-redirect to faculty list after 5 seconds
        setTimeout(function() {
            window.location.href = 'faculty.jsp';
        }, 5000);
    </script>
</body>
</html>