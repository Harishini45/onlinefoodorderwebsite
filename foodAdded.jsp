<%@page errorPage="error.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.connection.*" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
<style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            height:200px;
        }
        .card-img {
            border-radius: 8px 0 0 8px;
            object-fit: cover;
            height: 200px;
            width: 100%;
        }
        .card-body {
            padding: 20px;
        }
        .btn-remove {
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 8px 16px;
            font-size: 14px;
        }
        .btn-remove:hover {
            background-color: #c82333;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Food Order</title>
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
    String email = session.getAttribute("email").toString();
    %>
      <div class="page-header" style="background: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url(img/food.jpg); background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Cart</h2>
                    </div>
                    <div class="col-12">
                        <a href="fooditemshow.jsp">Home</a>
                        <a href="#">Cart</a>
                    </div>
                </div>
            </div>
        </div>
       <div class="container">
    <div class="row">
        <div class="col-md-8 mx-auto">
            <h2 class="mb-4">Your Cart</h2>
            <% 
            
            try {
          Connection conn = ConnectionProvider.getConn();
          PreparedStatement stmt = conn.prepareStatement("SELECT c.id, f.food_name, f.food_image, f.food_price, c.quantity FROM cart c INNER JOIN foods f ON c.id = f.food_id WHERE c.email = ?");
          stmt.setString(1, email);
          ResultSet rs = stmt.executeQuery();
 
                while (rs.next()) {
                    int foodId = rs.getInt("id");
                    String foodName = rs.getString("food_name");
                    byte[] imageData = rs.getBytes("food_image");
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    double foodPrice = rs.getDouble("food_price");
                    int quantity = rs.getInt("quantity");
            %>
            <div class="card">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <img src="data:image/jpeg;base64, <%= base64Image %>" class="card-img" alt="<%= foodName %>">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title"><%= foodName %></h5>
                            <p class="card-text">Quantity: <%= quantity %></p>
                            <p class="card-text">Price: $<%= foodPrice * quantity %></p>
                            
                                <a href="incDecQuantityAction.jsp?id=<%=foodId%>&quantity=inc"><i class="bi bi-plus-circle-fill"></i></a> <%= quantity %><a href= "incDecQuantityAction.jsp?id=<%=foodId%>&quantity=dec"><i class="bi bi-dash-circle-fill"></i></a>
                          <a href = "removeAction.jsp?id=<%=foodId%>">  <button class="btn btn-remove"><i class="fas fa-trash"></i> Remove</button></a> 
                        </div>
                    </div>
                </div>
            </div>
            <% 
                }
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
            %>
        </div>
    </div>
</div>
<a href = "checkout.jsp" style = "align-items:center;">proceed to Checkout</a>
                                   
                                  
                                  
                          
        
        
        
        </body>
        </html>