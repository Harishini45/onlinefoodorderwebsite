<%@ page import="java.sql.*" %>
<%@ page import="com.connection.*" %>

<%
    // Retrieve form data
    String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
    String email = session.getAttribute("email").toString(); // Assuming you want to retrieve email too
    String city = request.getParameter("city");
    String address = request.getParameter("address");
    String pincode = request.getParameter("pincode");
    
    // Database connection
    Connection conn = null;
    PreparedStatement stmt = null;
    PreparedStatement ps = null;
    try {
        conn = ConnectionProvider.getConn();
        // SQL query to insert data into the table
        String query = "INSERT INTO useraddress (name, mobile, city, address, pincode, email) VALUES (?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, name);
        stmt.setString(2, mobile);
        stmt.setString(3, city);
        stmt.setString(4, address);
        stmt.setString(5, pincode);
        stmt.setString(6, email);
        
        // Execute the query
        int rowsAffected = stmt.executeUpdate();
        if (rowsAffected > 0) {
            // Retrieve cart items for the user and insert into orders
            ps = conn.prepareStatement("SELECT id, quantity FROM cart WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Insert each cart item into orders table
                PreparedStatement pstm = conn.prepareStatement("INSERT INTO orders (id, email, quantity) VALUES (?, ?, ?)");
                pstm.setInt(1, rs.getInt("id"));
                pstm.setString(2, email);
                pstm.setInt(3, rs.getInt("quantity"));
                pstm.executeUpdate();
            }
            
            // Clear the cart after placing the order
            PreparedStatement psm = conn.prepareStatement("DELETE FROM cart WHERE email = ?");
            psm.setString(1, email);
            psm.executeUpdate();
            
            // Redirect to a thank you page
            response.sendRedirect("thankyou.jsp");
        } else {
            // Redirect to an error page or show an error message
            response.sendRedirect("error.jsp");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        // Redirect to an error page or show an error message
        response.sendRedirect("error.jsp");
    } finally {
        // Close resources
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
