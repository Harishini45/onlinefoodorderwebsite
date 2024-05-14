<%@ page import="java.sql.*" %>
<%@ page import="com.connection.ConnectionProvider" %>

<%
// Retrieve the item ID from the request parameter
int foodId = Integer.parseInt(request.getParameter("id"));

// Retrieve the user's email from the session
String email = session.getAttribute("email").toString();

// Delete the item from the cart
try {
    Connection conn = ConnectionProvider.getConn();
    PreparedStatement stmt = conn.prepareStatement("DELETE FROM cart WHERE id = ? AND email = ?");
    stmt.setInt(1, foodId);
    stmt.setString(2, email);
    int rowsAffected = stmt.executeUpdate();
    conn.close();

    // Check if the item was successfully deleted
    if (rowsAffected > 0) {
        // Redirect back to the cart page or any other page as needed
        response.sendRedirect("foodAdded.jsp");
    } else {
        // Item not found in the cart, handle the error
        response.sendRedirect("error.jsp");
    }
} catch (SQLException e) {
    e.printStackTrace();
    response.sendRedirect("error.jsp");
}
%>
