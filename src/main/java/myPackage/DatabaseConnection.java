package myPackage;
import java.sql.*;
import java.util.Scanner;

public class DatabaseConnection {
    
    // Database connection parameters
    private static final String URL = "jdbc:mysql://localhost:3306/faculty_publications_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Nanu$2308";
    
    private static Connection connection;
    
    public static void main(String[] args) {
        try {
            // Initialize database connection
            initializeConnection();
            
            // Insert sample data
            insertSampleData();
            
            // Display menu
            showMenu();
            
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeConnection();
        }
    }
    
    private static void initializeConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        System.out.println("Connected to Faculty Publications Database successfully!");
    }
    
    private static void insertSampleData() {
        try {
            // Insert sample Authors
            insertAuthorData();
            
            // Insert sample Departments
            insertDepartmentData();
            
            // Insert sample Faculty Members
            insertFacultyMemberData();
            
            // Update Department with HOD
            updateDepartmentHOD();
            
            // Insert sample Journals
            insertJournalData();
            
            // Insert sample Conferences
            insertConferenceData();
            
            // Insert sample Publications
            insertPublicationData();
            
            // Insert sample Publication Authors
            insertPublicationAuthorData();
            
            // Insert sample Documents
            insertDocumentData();
            
            // Insert sample Review Status
            insertReviewStatusData();
            
            // Insert sample User Accounts
            insertUserAccountData();
            
            System.out.println("Sample data inserted successfully!");
            
        } catch (SQLException e) {
            System.out.println("Error inserting sample data: " + e.getMessage());
        }
    }
    
    private static void insertAuthorData() throws SQLException {
        String sql = "INSERT IGNORE INTO Author (Name, Affiliation, Email) VALUES (?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        // Sample authors
        String[][] authors = {
            {"Dr. John Smith", "MIT", "john.smith@mit.edu"},
            {"Dr. Sarah Johnson", "Stanford University", "sarah.johnson@stanford.edu"},
            {"Dr. Michael Brown", "Harvard University", "michael.brown@harvard.edu"},
            {"Dr. Emily Davis", "VIT University", "emily.davis@vit.edu"},
            {"Dr. Robert Wilson", "IIT Madras", "robert.wilson@iitm.edu"}
        };
        
        for (String[] author : authors) {
            stmt.setString(1, author[0]);
            stmt.setString(2, author[1]);
            stmt.setString(3, author[2]);
            stmt.executeUpdate();
        }
        stmt.close();
    }
    
    private static void insertDepartmentData() throws SQLException {
        String sql = "INSERT IGNORE INTO Department (Name) VALUES (?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        String[] departments = {
            "Computer Science and Engineering",
            "Electronics and Communication Engineering",
            "Mechanical Engineering",
            "Information Technology",
            "Civil Engineering"
        };
        
        for (String dept : departments) {
            stmt.setString(1, dept);
            stmt.executeUpdate();
        }
        stmt.close();
    }
    
    private static void insertFacultyMemberData() throws SQLException {
        String sql = "INSERT IGNORE INTO FacultyMember (Name, Email, Phone, Designation, DepartmentID) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        Object[][] faculty = {
            {"Dr. Rajesh Kumar", "rajesh.kumar@vit.edu", "9876543210", "Professor", 1},
            {"Dr. Priya Sharma", "priya.sharma@vit.edu", "9876543211", "Associate Professor", 1},
            {"Dr. Amit Patel", "amit.patel@vit.edu", "9876543212", "Assistant Professor", 2},
            {"Dr. Sunita Gupta", "sunita.gupta@vit.edu", "9876543213", "Professor", 3},
            {"Dr. Vikram Singh", "vikram.singh@vit.edu", "9876543214", "Associate Professor", 4}
        };
        
        for (Object[] member : faculty) {
            stmt.setString(1, (String) member[0]);
            stmt.setString(2, (String) member[1]);
            stmt.setString(3, (String) member[2]);
            stmt.setString(4, (String) member[3]);
            stmt.setInt(5, (Integer) member[4]);
            stmt.executeUpdate();
        }
        stmt.close();
    }
    
    private static void updateDepartmentHOD() throws SQLException {
        String sql = "UPDATE Department SET HodID = ? WHERE DepartmentID = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        // Assign HODs to departments
        int[][] hodAssignments = {
            {1, 1}, // Dr. Rajesh Kumar as HOD of CSE
            {3, 2}, // Dr. Amit Patel as HOD of ECE
            {4, 3}, // Dr. Sunita Gupta as HOD of ME
            {5, 4}, // Dr. Vikram Singh as HOD of IT
            {2, 5}  // Dr. Priya Sharma as HOD of Civil
        };
        
        for (int[] assignment : hodAssignments) {
            stmt.setInt(1, assignment[0]);
            stmt.setInt(2, assignment[1]);
            stmt.executeUpdate();
        }
        stmt.close();
    }
    
    private static void insertJournalData() throws SQLException {
        String sql = "INSERT IGNORE INTO Journal (Name, ISSN, Publisher, ImpactFactor) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        Object[][] journals = {
            {"IEEE Transactions on Software Engineering", "0098-5589", "IEEE", 6.226},
            {"ACM Computing Surveys", "0360-0300", "ACM", 14.324},
            {"Nature Communications", "2041-1723", "Nature Publishing Group", 17.694},
            {"Journal of Machine Learning Research", "1532-4435", "JMLR", 6.070},
            {"Computer Networks", "1389-1286", "Elsevier", 4.474}
        };
        
        for (Object[] journal : journals) {
            stmt.setString(1, (String) journal[0]);
            stmt.setString(2, (String) journal[1]);
            stmt.setString(3, (String) journal[2]);
            stmt.setDouble(4, (Double) journal[3]);
            stmt.executeUpdate();
        }
        stmt.close();
    }
    
    private static void insertConferenceData() throws SQLException {
        String sql = "INSERT IGNORE INTO Conference (Name, Location, StartDate, EndDate, Organizer) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        Object[][] conferences = {
            {"International Conference on Software Engineering (ICSE)", "Pittsburgh, USA", "2024-04-14", "2024-04-20", "IEEE/ACM"},
            {"Neural Information Processing Systems (NeurIPS)", "New Orleans, USA", "2024-12-10", "2024-12-16", "NeurIPS Foundation"},
            {"International Conference on Machine Learning (ICML)", "Honolulu, USA", "2024-07-21", "2024-07-27", "ICML"},
            {"Conference on Computer Vision and Pattern Recognition (CVPR)", "Seattle, USA", "2024-06-17", "2024-06-21", "IEEE"},
            {"International Conference on Data Mining (ICDM)", "Shanghai, China", "2024-12-01", "2024-12-04", "IEEE"}
        };
        
        for (Object[] conf : conferences) {
            stmt.setString(1, (String) conf[0]);
            stmt.setString(2, (String) conf[1]);
            stmt.setDate(3, Date.valueOf((String) conf[2]));
            stmt.setDate(4, Date.valueOf((String) conf[3]));
            stmt.setString(5, (String) conf[4]);
            stmt.executeUpdate();
        }
        stmt.close();
    }
    
    private static void insertPublicationData() throws SQLException {
        String sql = "INSERT IGNORE INTO Publication (Title, Abstract, Type, PublicationDate, FacultyID, JournalID, ConferenceID) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        Object[][] publications = {
            {"Deep Learning Approaches for Software Bug Detection", "This paper presents novel deep learning techniques for automated bug detection in software systems.", "Journal Article", "2024-03-15", 1, 1, null},
            {"Blockchain-based Secure Data Sharing in IoT Networks", "A comprehensive study on implementing blockchain technology for secure data sharing in Internet of Things networks.", "Conference Paper", "2024-04-18", 2, null, 1},
            {"Machine Learning for Predictive Maintenance in Manufacturing", "This research explores the application of machine learning algorithms for predictive maintenance in industrial manufacturing.", "Journal Article", "2024-05-20", 3, 2, null},
            {"Computer Vision Techniques for Medical Image Analysis", "Advanced computer vision methods for analyzing medical images with improved accuracy and efficiency.", "Conference Paper", "2024-06-19", 4, null, 4},
            {"Natural Language Processing in Educational Technology", "Investigation of NLP techniques to enhance educational technology platforms and learning outcomes.", "Journal Article", "2024-07-10", 5, 4, null}
        };
        
        for (Object[] pub : publications) {
            stmt.setString(1, (String) pub[0]);
            stmt.setString(2, (String) pub[1]);
            stmt.setString(3, (String) pub[2]);
            stmt.setDate(4, Date.valueOf((String) pub[3]));
            stmt.setInt(5, (Integer) pub[4]);
            if (pub[5] != null) stmt.setInt(6, (Integer) pub[5]);
            else stmt.setNull(6, Types.INTEGER);
            if (pub[6] != null) stmt.setInt(7, (Integer) pub[6]);
            else stmt.setNull(7, Types.INTEGER);
            stmt.executeUpdate();
        }
        stmt.close();
    }
    
    private static void insertPublicationAuthorData() throws SQLException {
        String sql = "INSERT IGNORE INTO PublicationAuthor (PublicationID, AuthorID, AuthorOrder, IsCorrespondingAuthor) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        Object[][] pubAuthors = {
            {1, 1, 1, true},
            {1, 2, 2, false},
            {2, 2, 1, true},
            {2, 3, 2, false},
            {3, 3, 1, true},
            {3, 4, 2, false},
            {4, 4, 1, true},
            {4, 5, 2, false},
            {5, 5, 1, true},
            {5, 1, 2, false}
        };
        
        for (Object[] pubAuth : pubAuthors) {
            stmt.setInt(1, (Integer) pubAuth[0]);
            stmt.setInt(2, (Integer) pubAuth[1]);
            stmt.setInt(3, (Integer) pubAuth[2]);
            stmt.setBoolean(4, (Boolean) pubAuth[3]);
            stmt.executeUpdate();
        }
        stmt.close();
    }
    
    private static void insertDocumentData() throws SQLException {
        String sql = "INSERT IGNORE INTO Document (PublicationID, FileType, FilePath) VALUES (?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        Object[][] documents = {
            {1, "pdf", "/documents/pub1_deep_learning_bug_detection.pdf"},
            {2, "pdf", "/documents/pub2_blockchain_iot.pdf"},
            {3, "pdf", "/documents/pub3_ml_predictive_maintenance.pdf"},
            {4, "pdf", "/documents/pub4_cv_medical_imaging.pdf"},
            {5, "pdf", "/documents/pub5_nlp_education.pdf"}
        };
        
        for (Object[] doc : documents) {
            stmt.setInt(1, (Integer) doc[0]);
            stmt.setString(2, (String) doc[1]);
            stmt.setString(3, (String) doc[2]);
            stmt.executeUpdate();
        }
        stmt.close();
    }
    
    private static void insertReviewStatusData() throws SQLException {
        String sql = "INSERT IGNORE INTO ReviewStatus (PublicationID, Status, ReviewerComments, ReviewedOn) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        Object[][] reviews = {
            {1, "Approved", "Excellent research work with significant contributions to the field.", "2024-02-28"},
            {2, "Approved", "Well-written paper with practical applications in IoT security.", "2024-03-15"},
            {3, "Pending", "Under review for technical accuracy and novelty.", null},
            {4, "Approved", "Strong methodology and comprehensive experimental results.", "2024-05-30"},
            {5, "Rejected", "Insufficient experimental validation and limited scope.", "2024-06-25"}
        };
        
        for (Object[] review : reviews) {
            stmt.setInt(1, (Integer) review[0]);
            stmt.setString(2, (String) review[1]);
            stmt.setString(3, (String) review[2]);
            if (review[3] != null) stmt.setDate(4, Date.valueOf((String) review[3]));
            else stmt.setNull(4, Types.DATE);
            stmt.executeUpdate();
        }
        stmt.close();
    }
    
    private static void insertUserAccountData() throws SQLException {
        String sql = "INSERT IGNORE INTO UserAccount (Username, Password, Role, Email) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        String[][] users = {
            {"admin", "admin123", "Admin", "admin@vit.edu"},
            {"rajesh_kumar", "faculty123", "Faculty", "rajesh.kumar@vit.edu"},
            {"priya_sharma", "faculty123", "Faculty", "priya.sharma@vit.edu"},
            {"reviewer1", "reviewer123", "Reviewer", "reviewer1@vit.edu"},
            {"reviewer2", "reviewer123", "Reviewer", "reviewer2@vit.edu"}
        };
        
        for (String[] user : users) {
            stmt.setString(1, user[0]);
            stmt.setString(2, user[1]);
            stmt.setString(3, user[2]);
            stmt.setString(4, user[3]);
            stmt.executeUpdate();
        }
        stmt.close();
    }
    
    private static void showMenu() {
        Scanner scanner = new Scanner(System.in);
        int choice;
        
        do {
            System.out.println("\n=== Faculty Publications Database Menu ===");
            System.out.println("1. View All Authors");
            System.out.println("2. View All Faculty Members");
            System.out.println("3. View All Departments");
            System.out.println("4. View All Publications");
            System.out.println("5. View All Journals");
            System.out.println("6. View All Conferences");
            System.out.println("7. View Publications by Faculty");
            System.out.println("8. View Review Status");
            System.out.println("9. View User Accounts");
            System.out.println("10. Search Publications by Title");
            System.out.println("0. Exit");
            System.out.print("Enter your choice: ");
            
            choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline
            
            switch (choice) {
                case 1: displayAuthors(); break;
                case 2: displayFacultyMembers(); break;
                case 3: displayDepartments(); break;
                case 4: displayPublications(); break;
                case 5: displayJournals(); break;
                case 6: displayConferences(); break;
                case 7: displayPublicationsByFaculty(); break;
                case 8: displayReviewStatus(); break;
                case 9: displayUserAccounts(); break;
                case 10: searchPublicationsByTitle(scanner); break;
                case 0: System.out.println("Exiting..."); break;
                default: System.out.println("Invalid choice!");
            }
        } while (choice != 0);
        
        scanner.close();
    }
    
    private static void displayAuthors() {
        try {
            String sql = "SELECT * FROM Author";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            System.out.println("\n=== AUTHORS ===");
            System.out.printf("%-5s %-25s %-30s %-30s%n", "ID", "Name", "Affiliation", "Email");
            System.out.println("-".repeat(90));
            
            while (rs.next()) {
                System.out.printf("%-5d %-25s %-30s %-30s%n",
                    rs.getInt("AuthorID"),
                    rs.getString("Name"),
                    rs.getString("Affiliation"),
                    rs.getString("Email"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error displaying authors: " + e.getMessage());
        }
    }
    
    private static void displayFacultyMembers() {
        try {
            String sql = "SELECT f.*, d.Name as DepartmentName FROM FacultyMember f " +
                        "LEFT JOIN Department d ON f.DepartmentID = d.DepartmentID";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            System.out.println("\n=== FACULTY MEMBERS ===");
            System.out.printf("%-5s %-25s %-30s %-15s %-20s %-30s%n", 
                "ID", "Name", "Email", "Phone", "Designation", "Department");
            System.out.println("-".repeat(125));
            
            while (rs.next()) {
                System.out.printf("%-5d %-25s %-30s %-15s %-20s %-30s%n",
                    rs.getInt("FacultyID"),
                    rs.getString("Name"),
                    rs.getString("Email"),
                    rs.getString("Phone"),
                    rs.getString("Designation"),
                    rs.getString("DepartmentName"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error displaying faculty members: " + e.getMessage());
        }
    }
    
    private static void displayDepartments() {
        try {
            String sql = "SELECT d.*, f.Name as HodName FROM Department d " +
                        "LEFT JOIN FacultyMember f ON d.HodID = f.FacultyID";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            System.out.println("\n=== DEPARTMENTS ===");
            System.out.printf("%-5s %-40s %-25s%n", "ID", "Department Name", "HOD");
            System.out.println("-".repeat(70));
            
            while (rs.next()) {
                System.out.printf("%-5d %-40s %-25s%n",
                    rs.getInt("DepartmentID"),
                    rs.getString("Name"),
                    rs.getString("HodName"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error displaying departments: " + e.getMessage());
        }
    }
    
    private static void displayPublications() {
        try {
            String sql = "SELECT p.*, f.Name as FacultyName, j.Name as JournalName, c.Name as ConferenceName " +
                        "FROM Publication p " +
                        "LEFT JOIN FacultyMember f ON p.FacultyID = f.FacultyID " +
                        "LEFT JOIN Journal j ON p.JournalID = j.JournalID " +
                        "LEFT JOIN Conference c ON p.ConferenceID = c.ConferenceID";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            System.out.println("\n=== PUBLICATIONS ===");
            System.out.printf("%-5s %-50s %-15s %-12s %-25s%n", 
                "ID", "Title", "Type", "Date", "Faculty");
            System.out.println("-".repeat(107));
            
            while (rs.next()) {
                System.out.printf("%-5d %-50s %-15s %-12s %-25s%n",
                    rs.getInt("PublicationID"),
                    rs.getString("Title").length() > 50 ? 
                        rs.getString("Title").substring(0, 47) + "..." : 
                        rs.getString("Title"),
                    rs.getString("Type"),
                    rs.getDate("PublicationDate"),
                    rs.getString("FacultyName"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error displaying publications: " + e.getMessage());
        }
    }
    
    private static void displayJournals() {
        try {
            String sql = "SELECT * FROM Journal";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            System.out.println("\n=== JOURNALS ===");
            System.out.printf("%-5s %-40s %-15s %-25s %-10s%n", 
                "ID", "Name", "ISSN", "Publisher", "Impact Factor");
            System.out.println("-".repeat(95));
            
            while (rs.next()) {
                System.out.printf("%-5d %-40s %-15s %-25s %-10.3f%n",
                    rs.getInt("JournalID"),
                    rs.getString("Name"),
                    rs.getString("ISSN"),
                    rs.getString("Publisher"),
                    rs.getDouble("ImpactFactor"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error displaying journals: " + e.getMessage());
        }
    }
    
    private static void displayConferences() {
        try {
            String sql = "SELECT * FROM Conference";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            System.out.println("\n=== CONFERENCES ===");
            System.out.printf("%-5s %-50s %-20s %-12s %-12s%n", 
                "ID", "Name", "Location", "Start Date", "End Date");
            System.out.println("-".repeat(99));
            
            while (rs.next()) {
                System.out.printf("%-5d %-50s %-20s %-12s %-12s%n",
                    rs.getInt("ConferenceID"),
                    rs.getString("Name"),
                    rs.getString("Location"),
                    rs.getDate("StartDate"),
                    rs.getDate("EndDate"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error displaying conferences: " + e.getMessage());
        }
    }
    
    private static void displayPublicationsByFaculty() {
        try {
            String sql = "SELECT f.Name as FacultyName, COUNT(p.PublicationID) as PublicationCount " +
                        "FROM FacultyMember f " +
                        "LEFT JOIN Publication p ON f.FacultyID = p.FacultyID " +
                        "GROUP BY f.FacultyID, f.Name " +
                        "ORDER BY PublicationCount DESC";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            System.out.println("\n=== PUBLICATIONS BY FACULTY ===");
            System.out.printf("%-30s %-15s%n", "Faculty Name", "Publication Count");
            System.out.println("-".repeat(45));
            
            while (rs.next()) {
                System.out.printf("%-30s %-15d%n",
                    rs.getString("FacultyName"),
                    rs.getInt("PublicationCount"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error displaying publications by faculty: " + e.getMessage());
        }
    }
    
    private static void displayReviewStatus() {
        try {
            String sql = "SELECT r.*, p.Title FROM ReviewStatus r " +
                        "JOIN Publication p ON r.PublicationID = p.PublicationID";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            System.out.println("\n=== REVIEW STATUS ===");
            System.out.printf("%-5s %-40s %-15s %-12s%n", 
                "ID", "Publication Title", "Status", "Reviewed On");
            System.out.println("-".repeat(72));
            
            while (rs.next()) {
                System.out.printf("%-5d %-40s %-15s %-12s%n",
                    rs.getInt("ReviewID"),
                    rs.getString("Title").length() > 40 ? 
                        rs.getString("Title").substring(0, 37) + "..." : 
                        rs.getString("Title"),
                    rs.getString("Status"),
                    rs.getDate("ReviewedOn"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error displaying review status: " + e.getMessage());
        }
    }
    
    private static void displayUserAccounts() {
        try {
            String sql = "SELECT UserID, Username, Role, Email FROM UserAccount";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            System.out.println("\n=== USER ACCOUNTS ===");
            System.out.printf("%-5s %-20s %-15s %-30s%n", 
                "ID", "Username", "Role", "Email");
            System.out.println("-".repeat(70));
            
            while (rs.next()) {
                System.out.printf("%-5d %-20s %-15s %-30s%n",
                    rs.getInt("UserID"),
                    rs.getString("Username"),
                    rs.getString("Role"),
                    rs.getString("Email"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error displaying user accounts: " + e.getMessage());
        }
    }
    
    private static void searchPublicationsByTitle(Scanner scanner) {
        try {
            System.out.print("Enter search term for publication title: ");
            String searchTerm = scanner.nextLine();
            
            String sql = "SELECT p.*, f.Name as FacultyName FROM Publication p " +
                        "LEFT JOIN FacultyMember f ON p.FacultyID = f.FacultyID " +
                        "WHERE p.Title LIKE ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, "%" + searchTerm + "%");
            ResultSet rs = stmt.executeQuery();
            
            System.out.println("\n=== SEARCH RESULTS ===");
            System.out.printf("%-5s %-50s %-15s %-12s %-25s%n", 
                "ID", "Title", "Type", "Date", "Faculty");
            System.out.println("-".repeat(107));
            
            boolean found = false;
            while (rs.next()) {
                found = true;
                System.out.printf("%-5d %-50s %-15s %-12s %-25s%n",
                    rs.getInt("PublicationID"),
                    rs.getString("Title").length() > 50 ? 
                        rs.getString("Title").substring(0, 47) + "..." : 
                        rs.getString("Title"),
                    rs.getString("Type"),
                    rs.getDate("PublicationDate"),
                    rs.getString("FacultyName"));
            }
            
            if (!found) {
                System.out.println("No publications found matching the search term.");
            }
            
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error searching publications: " + e.getMessage());
        }
    }
    
    private static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Database connection closed.");
            }
        } catch (SQLException e) {
            System.out.println("Error closing connection: " + e.getMessage());
        }
    }
}