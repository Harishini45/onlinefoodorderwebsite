<%@page errorPage="error.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.connection.*" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
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
    <!-- Custom Styles -->
    <style>
        .navbar-nav, a {
            color: white;
        }

        body {
          
           background-color:white;
        }

       .card {
            margin-bottom: 20px; /* Space between cards */
            transition: transform 0.3s, box-shadow 0.3s; /* Smooth transitions */
        }

        .card:hover {
            transform: scale(1.05); /* Zoom effect on hover */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow on hover */
        }

        .card-img-top {
            height: 200px; /* Adjust image height */
            object-fit: cover; /* Ensure images fill the frame */
            border-top-left-radius: calc(0.25rem - 1px); /* Rounded corners */
            border-top-right-radius: calc(0.25rem - 1px);
        }

        .card-body {
            padding: 1rem; /* Adjust padding */
            border-radius:10px;
        }

        .btn-add-to-cart {
            background-color: orange;
            color: black;
            border-color: orange;
            padding-left:30px;
            padding-right:30px;
            width:200px;
        }

        .btn-add-to-cart:hover {
            background-color: #ff7f00; /* Darker color on hover */
            border-color: #ff7f00;
            
        }
    </style>
</head>
<body>

<% 
    String email = session.getAttribute("email").toString();
int totalFoodItems = 0;

// Fetch the total count of food items for the user from the cart table
try {
    Connection conn = ConnectionProvider.getConn();
    PreparedStatement countStmt = conn.prepareStatement("SELECT SUM(quantity) FROM cart WHERE email = ?");
    countStmt.setString(1, email);
    ResultSet countRs = countStmt.executeQuery();
    if (countRs.next()) {
        totalFoodItems = countRs.getInt(1);
    }
    conn.close();
} catch (SQLException e) {
    e.printStackTrace();
}
%>

    


 <div class="navbar navbar-expand-lg  navbar-light">
            <div class="container-fluid">
                <a href="index.html" class="navbar-brand">Online <span>Food Order</span></a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                     <a href="#" class="nav-item nav-link">Welcome <%=email %></a>
                        <a href="#" class="nav-item nav-link">Home</a>
                        <a href="#" class="nav-item nav-link">Menu</a>
                       
                      
         
                   
                  
                          <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                        <a href="foodAdded.jsp" class="nav-item nav-link">Cart<i class="bi bi-cart-plus"></i><span><%= totalFoodItems %></span> </a>
                       
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Nav Bar End -->
        
        
        <!-- Page Header Start -->
        <div class="page-header" style="background: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url(img/food.jpg); background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Menu</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Orders</a>
                    </div>
                </div>
            </div>
        </div>
        
<% 
    String msg = request.getParameter("msg");
    if(msg != null && msg.equals("added")) { 
%>
    <h5 style="color:green;">Food Added Successfully</h5>
<% } %>

<div class="container mt-5">
    <h1>Food Items</h1>
    <div class="row">
        <% 
            Connection conn = ConnectionProvider.getConn();
            PreparedStatement stmt = conn.prepareStatement("SELECT food_id, food_name, food_image, food_price FROM foods");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int foodId = rs.getInt("food_id");
                String foodName = rs.getString("food_name");
                byte[] imageData = rs.getBytes("food_image");
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                double foodPrice = rs.getDouble("food_price");
        %>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="card">
                <img src="data:image/jpeg;base64, <%= base64Image %>" class="card-img-top" alt="Photo">
                <div class="card-body" style="text-align:center;">
                    <h5 class="card-title"><%= foodName %></h5>
                    <p class="card-text">$<%= foodPrice %></p>
                      <form action="cartAction" method="post"> <!-- Use form instead of button -->
                        <input type="hidden" name="email" value="<%= email %>">
                        <input type="hidden" name="id" value="<%= foodId %>">
                        <button type="submit" class="btn btn-primary btn-add-to-cart">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
        <% 
            }
            conn.close();
        %>
    </div>
</div>




<!-- Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
