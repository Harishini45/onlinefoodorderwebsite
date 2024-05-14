<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Food Details</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Add Food Details</h1>
        <form action="uploadItems" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="foodName">Food Name:</label>
                <input type="text" class="form-control" id="foodName" name="name" >
            </div>
            
            <div class="form-group">
                <label for="foodPrice">Food Price:</label>
                <input type="text" class="form-control" id="foodPrice" name="price" >
            </div>
            
            
            
                <label for="foodImageUpload">Upload New Image:</label>
                <input type="file" class="form-control-file" id="foodImageUpload" name="image">
            </div>
            
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Bootstrap JS CDN (optional, for some interactive components) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>