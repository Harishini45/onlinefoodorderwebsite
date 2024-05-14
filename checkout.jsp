<%@page errorPage="error.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.connection.*" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
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
                        <h2>Checkout</h2>
                    </div>
                    <div class="col-12">
                        <a href="fooditemshow.jsp">Home</a>
                        <a href="#">Checkout</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
  <div class="row">
    <div class="col-md-8 offset-md-2">
      <h2>Shipping Address</h2>
      <form action = "checkoutAction.jsp" method="post">
        <div class="form-group">
          <label for="name">Name</label>
          <input type="text" class="form-control" id="name" name = "name"placeholder="Enter your name">
        </div>
        <div class="form-group">
          <label for="mobile">Mobile Number</label>
          <input type="text" class="form-control" id="mobile"name = "mobile" placeholder="Enter your mobile number">
        </div>
        <div class="form-group">
          <label for="email">Email Address</label>
          <input type="email" class="form-control" id="email" placeholder="Enter your email address">
        </div>
        <div class="form-group">
          <label for="city">Select your city</label>
          <select class="form-control" id="city" name = "city">
        <option value="ariyalur">Ariyalur</option>
  <option value="chengalpattu">Chengalpattu</option>
  <option value="chennai">Chennai</option>
  <option value="coimbatore">Coimbatore</option>
  <option value="cuddalore">Cuddalore</option>
  <option value="dharmapuri">Dharmapuri</option>
  <option value="dindigul">Dindigul</option>
  <option value="erode">Erode</option>
  <option value="kallakurichi">Kallakurichi</option>
  <option value="kanchipuram">Kanchipuram</option>
  <option value="kanyakumari">Kanyakumari</option>
  <option value="karur">Karur</option>
  <option value="krishnagiri">Krishnagiri</option>
  <option value="madurai">Madurai</option>
  <option value="nagapattinam">Nagapattinam</option>
  <option value="namakkal">Namakkal</option>
  <option value="nilgiris">Nilgiris</option>
  <option value="perambalur">Perambalur</option>
  <option value="pudukkottai">Pudukkottai</option>
  <option value="ramanathapuram">Ramanathapuram</option>
  <option value="ranipet">Ranipet</option>
  <option value="salem">Salem</option>
  <option value="sivagangai">Sivagangai</option>
  <option value="tenkasi">Tenkasi</option>
  <option value="thanjavur">Thanjavur</option>
  <option value="theni">Theni</option>
  <option value="thoothukudi">Thoothukudi</option>
  <option value="tiruchirappalli">Tiruchirappalli</option>
  <option value="tirunelveli">Tirunelveli</option>
  <option value="tirupattur">Tirupattur</option>
  <option value="tiruppur">Tiruppur</option>
  <option value="tiruvallur">Tiruvallur</option>
  <option value="tiruvannamalai">Tiruvannamalai</option>
  <option value="tiruvarur">Tiruvarur</option>
           
          </select>
        </div>
        <div class="form-group">
          <label for="address">Address</label>
          <textarea class="form-control" id="address" name = "address" rows="3" placeholder="Enter your address"></textarea>
        </div>
        <div class="form-group">
          <label for="pincode">Pin Code</label>
          <input type="text" class="form-control" id="pincode" name = "pincode" placeholder="Enter your pin code">
        </div>
        <div class="form-group form-check">
          <input type="checkbox" class="form-check-input" id="sameAsBilling">
          <label class="form-check-label" for="sameAsBilling">Shipping address same as billing</label>
        </div>
        <button type="submit" class="btn btn-primary">Continue to Checkout <i class="fas fa-chevron-right"></i></button>
      </form>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        </body>
        </html>