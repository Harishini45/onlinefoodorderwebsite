<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
  label{
  color:white;}
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url(img/food.jpg);
       background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    }
    .form-control{
    
    padding-left:70px;
    padding-right:70px;
    padding-top:5px;
    background-color:black;
    opacity:0.5;
    color:white;
    padding-bottom:5px;
    }
    .signup-form {
   
    margin-top:100px;
      margin-bottom:100px;
      height:560px;
      padding: 50px;
      border: 1px solid black;
      border-radius: 5px;
    }
  </style>
</head>
<body>

<div class="signup-form">
<%String msg = request.getParameter("msg"); %>
<%if("valid".equals(msg)){ %>
<h4 style="color:green;">Registered Successfully</h4>

<%} %>
  <form action = "signupAction" method = "post">
  <h5 style = "text-align:center;color:orange;">SignUp</h5>
    <div class="form-group">
      <label for="firstName"><i class="fas fa-user"></i> First Name:</label>
      <input type="text" class="form-control" name = "fname" id="firstName" placeholder="Enter your first name" required>
    </div>
    <div class="form-group">
      <label for="lastName"><i class="fas fa-user"></i> Last Name:</label>
      <input type="text" class="form-control" id="lastName" name = "lname" placeholder="Enter your last name" required>
    </div>
    <div class="form-group">
      <label for="email"><i class="fas fa-envelope"></i> Email:</label>
      <input type="email" class="form-control" id="email"name = "email" placeholder="Enter your email address" required>
    </div>
    <div class="form-group">
      <label for="username"><i class="fas fa-user"></i> User Name:</label>
      <input type="text" class="form-control" id="username"name = "uname" placeholder="Enter your username" required>
    </div>
    <div class="form-group">
      <label for="password"><i class="fas fa-lock"></i> Password:</label>
      <input type="password" class="form-control" id="password" name="pwd" placeholder="Enter your password" required>
    </div>
    <button type="submit" class="btn btn-primary btn-block" style="background-color:orange;color:black;opacity:0.5;border-color:orange;">Sign Up</button>
  </form>
  
  <p class="text-center mt-3" style="color:white;">Already have an account? <a href="login.jsp" style="color:orange;">Login</a></p>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
