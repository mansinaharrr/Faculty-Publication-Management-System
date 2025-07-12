package com.fpms.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import myPackage.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect GET requests to login page
        response.sendRedirect("dashboard.jsp");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Validate input
        if (username == null || password == null || role == null || 
            username.trim().isEmpty() || password.trim().isEmpty() || role.trim().isEmpty()) {
            request.setAttribute("error", "Please fill in all fields.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // Get database connection
            connection = DatabaseConnection.getConnection();
            
            // Prepare SQL query
            String sql = "SELECT UserID, Username, Role, Email FROM UserAccount WHERE Username = ? AND Password = ? AND Role = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, role);
            
            // Execute query
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                // Login successful
                HttpSession session = request.getSession();
                session.setAttribute("userID", rs.getInt("UserID"));
                session.setAttribute("username", rs.getString("Username"));
                session.setAttribute("userRole", rs.getString("Role"));
                session.setAttribute("email", rs.getString("Email"));
                session.setAttribute("isLoggedIn", true);
                
                // Redirect based on role
                switch (role.toLowerCase()) {
                    case "admin":
                        response.sendRedirect("dashboard.jsp");
                        break;
                    case "faculty":
                        response.sendRedirect("faculty.jsp");
                        break;
                    case "reviewer":
                        response.sendRedirect("reviews.jsp");
                        break;
                    default:
                        response.sendRedirect("dashboard.jsp");
                        break;
                }
            } else {
                // Login failed
                request.setAttribute("error", "Invalid username, password, or role. Please try again.");
                request.setAttribute("username", username); // Preserve username
                request.setAttribute("role", role); // Preserve role
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
        } catch (SQLException e) {
            // Database error - fall back to demo authentication
            if (authenticateDemoUser(username, password, role)) {
                HttpSession session = request.getSession();
                session.setAttribute("userID", 1);
                session.setAttribute("username", username);
                session.setAttribute("role", role);
                session.setAttribute("email", username + "@university.edu");
                session.setAttribute("isLoggedIn", true);
                
                response.sendRedirect("dashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid credentials. Please try again.");
                request.setAttribute("username", username);
                request.setAttribute("role", role);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Any other error
            request.setAttribute("error", "System error. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    /**
     * Demo authentication for testing when database is not available
     */
    private boolean authenticateDemoUser(String username, String password, String role) {
        // Demo users for testing
        if ("admin".equals(username) && "admin123".equals(password) && "Admin".equals(role)) {
            return true;
        }
        if ("faculty1".equals(username) && "faculty123".equals(password) && "Faculty".equals(role)) {
            return true;
        }
        if ("reviewer1".equals(username) && "reviewer123".equals(password) && "Reviewer".equals(role)) {
            return true;
        }
        return false;
    }
}