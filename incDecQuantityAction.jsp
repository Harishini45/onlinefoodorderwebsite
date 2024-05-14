<%@ page import="java.sql.*" %>
<%@ page import="com.connection.*" %>

<%
    // Get the food item ID and the action (increment or decrement) from the query parameters
    int foodId = Integer.parseInt(request.getParameter("id"));
    String action = request.getParameter("quantity");
    String email = session.getAttribute("email").toString();
    
    try {
        Connection conn = ConnectionProvider.getConn();
        PreparedStatement stmt = null;
        
        // Check if the action is to increment or decrement the quantity
        if (action.equals("inc")) {
            // Increment the quantity
            stmt = conn.prepareStatement("UPDATE cart SET quantity = quantity + 1 WHERE id = ? and email = ?");
        } else if (action.equals("dec")) {
            // Decrement the quantity, ensuring it doesn't go below 0
            stmt = conn.prepareStatement("UPDATE cart SET quantity = GREATEST(quantity - 1, 0) WHERE id = ? and email = ?");
        } 
        else{
        	response.sendRedirect("error.jsp");
        }
        
        // Set the food item ID as a parameter in the prepared statement
        stmt.setInt(1, foodId);
        stmt.setString(2,email);
        
        // Execute the update statement
        stmt.executeUpdate();
        
        // Redirect back to the cart page
        response.sendRedirect("foodAdded.jsp");
        
        conn.close();
    }
    catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    }
%>
