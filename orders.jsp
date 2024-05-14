<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*, java.util.Base64" %>
<%@ page import="com.connection.ConnectionProvider" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File Upload to Database Demo</title>
  <link href="img/favicon.ico" rel="icon">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Nunito:600,700" rel="stylesheet"> 
        
        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
                <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    </head>
<body>
<% 
    String mail = session.getAttribute("email").toString();
    %>
 <div class="navbar navbar-expand-lg  navbar-light">
            <div class="container-fluid">
                <a href="index.html" class="navbar-brand">Online <span>Food Order</span></a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                     <a href="#" class="nav-item nav-link">Welcome <%=mail %></a>
                        <a href="Upload.jsp" class="nav-item nav-link">Home</a>
                        <a href="display.jsp" class="nav-item nav-link">showItems</a>
                        <a href="orders.jsp" class="nav-item nav-link">orders</a>
                          <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                        
                        
                    </div>
                </div>
            </div>
        </div>


      <div class="page-header" style="background: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url(img/food.jpg); background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Admin</h2>
                    </div>
                    <div class="col-12">
                        <a href="Upload.jsp">Home</a>
                        <a href="#"> Orders</a>
                    </div>
                </div>
            </div>
        </div>
         <div class="container">
        <h1>Orders Received</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Email</th>
                    <th scope="col">Image</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        Connection conn = ConnectionProvider.getConn();
                        PreparedStatement stmt = conn.prepareStatement("SELECT o.email, f.food_name, f.food_image, f.food_price, o.quantity FROM orders o INNER JOIN foods f ON o.id = f.food_id");
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                            String email = rs.getString("email");
                            String foodName = rs.getString("food_name");
                            byte[] imageData = rs.getBytes("food_image");
                            String base64Image = Base64.getEncoder().encodeToString(imageData);
                            double foodPrice = rs.getDouble("food_price");
                            int quantity = rs.getInt("quantity");
                %>
                <tr>
                    <td><%= email %></td>
                    <td><img src="data:image/jpeg;base64, <%= base64Image %>" alt="Food Image" width="100"></td>
                    <td><%= foodName %></td>
                    <td>$<%= foodPrice %></td>
                    <td><%= quantity %></td>
                </tr>
                <% 
                        }
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                        // Handle SQLException
                    }
                %>
            </tbody>
        </table>
    </div>
        </body>
        </html>