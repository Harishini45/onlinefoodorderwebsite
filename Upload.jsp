<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
    String email = session.getAttribute("email").toString();
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
                        <a href="#">Home</a>
                        <a href="#">Add fooditems</a>
                    </div>
                </div>
            </div>
        </div>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h1 class="text-center">Add items</h1>
                    </div>
                    <div class="card-body">
                        <form method="post" action="uploadServlets" enctype="multipart/form-data">
                            <div class="form-group row">
                                <label for="firstName" class="col-sm-3 col-form-label">food name</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="firstName" name="name" placeholder="Enter first name">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="lastName" class="col-sm-3 col-form-label">food price</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" id="lastName" name="price" placeholder="Enter last name">
                                </div>
                            </div>
                             <div class="form-group row">
                               select category:
                               <select category name = "type">
                               
                              <option value = "breakfast">breakfast</option>
                              <option value = "lunch">lunch</option>
                              <option value = "dinner">dinner</option>
                              <option value = "special">special</option>
                               </select>
                            </div>
                            <div class="form-group row">
                                <label for="photo" class="col-sm-3 col-form-label">Portrait Photo:</label>
                                <div class="col-sm-9">
                                    <input type="file" class="form-control-file" id="photo" name="photo">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <button type="submit" class="btn btn-primary btn-block">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
