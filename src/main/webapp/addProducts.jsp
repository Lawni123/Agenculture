<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setHeader("Expires", "0"); // Proxies

if (session.getAttribute("uname") == null) {
    response.sendRedirect("Login.jsp");
}
%>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>AddProduct</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: white;
      color: #333;
    }
    .navbar {
      background-color: #00ff59;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .navbar-brand img {
      height: 50px;
      width: 50px;
      border-radius: 50%;
    }
    .navbar-nav .nav-link {
      color: white;
      margin: 0 10px;
      transition: color 0.3s;
    }
    .navbar-nav .nav-link:hover {
      color: #c2e9fb;
    }
    .btn-custom {
      background-color: #28a745;
      color: white;
      border-radius: 20px;
      padding: 5px 20px;
      border: none;
      transition: background-color 0.3s;
    }
    .btn-custom:hover {
      background-color: #218838;
    }
    .hero-section {
      text-align: center;
      padding: 100px 20px;
      background: linear-gradient(120deg, #0cab51, #1bc55f);
      color: white;
    }
    .hero-section h1 {
      font-size: 3rem;
      margin-bottom: 20px;
    }
    .hero-section p {
      font-size: 1.2rem;
      margin-bottom: 30px;
    }
    .hero-section .btn {
      font-size: 1rem;
    }
    .form-container{
    	width:60%;
    }
    .out-container{
    	display:flex;
    	justify-content:center;
    	align-items:center;
    }
  </style>
 <script>
        
       	function validateForm() {
         	var price = document.forms["userForm"]["price"].value.trim();
            var qty = document.forms["userForm"]["qty"].value.trim();
            if (!Number.isInteger(Number(price))) {
                alert("The price must be a digit");
                return false;
              }
            if (!Number.isInteger(Number(qty))) {
                alert("The price must be a digit");
                return false;
              }
            return true;
        }
    </script> 
</head>
<body>
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><img src="logo2.png" alt="Logo"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </nav>
  <body>
 <div class="out-container">  
    <div class="form-container">
    <br><br><br><form action="AddProduct" method="post" name="userForm" class="needs-validation container-fluid align-center mx-auto p-2 border border-radius shadow p-3 mb-5 bg-body-primary rounded padding 30px" enctype="multipart/form-data" onsubmit="return validateForm();"novalidate >
    <div class="container-fluid">
        <p class="h1 text-center">Add Product</p>
      </div>
  <div class="mb-3">
    <label for="validationName" class="form-label">Name</label>
    <input type="text" class="form-control" name="name" placeholder="Enter Product Name" required>
  </div>
  <div class="mb-3">
    <label for="validationEmail" class="form-label">Description</label>
    <input type="text" class="form-control" name="info" placeholder="Enter Product Discription" required>
  </div>
  <div class="mb-3">
    <label for="validationPassword" class="form-label">Price</label>
    <input type="text" class="form-control" name="price" placeholder="Enter Price" required>
  </div>
  <div class="mb-3">
    <label for="validationPassword" class="form-label">Select Type</label>
    <select class="form-select" name="type"aria-label="Default select example">
  		<option selected>Select Type</option>
  		<option value="fruit">Fruit</option>
  		<option value="vegetable">Vegetable</option>
  		<option value="grain">Grain</option>
	</select>
    </div>
  <div class="mb-3">
    <label for="validationPassword" class="form-label">Quantity (in Kg)</label>
    <input type="text" class="form-control" name="qty" placeholder="Enter Quantity(in Kg)" required>
  </div>
  <div class="mb-3">
    <label for="validationPassword" class="form-label">Pic</label>
    <input type="file" class="form-control" name="pic" required>
  </div>
  <div>
    <button class="btn btn-success" type="submit">Submit</button>
  </div>
</form>
</div>
</div>

        <br><br><footer class="bg-success text-white pt-5 pb-4">
        <div class="container text-center text-md-left">
          <div class="row">
            
            <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
              <h5 class="text-uppercase mb-4 font-weight-bold">About Us</h5>
              <p>
                We are committed to providing organic and sustainable agricultural products and services. Our mission is to promote healthy living and environmentally friendly farming practices.
              </p>
            </div>
      
          
            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
              <h5 class="text-uppercase mb-4 font-weight-bold">Products</h5>
              <p><a href="#" class="text-white text-decoration-none">Organic Vegetables</a></p>
              <p><a href="#" class="text-white text-decoration-none">Grains</a></p>
              <p><a href="#" class="text-white text-decoration-none">Fertilizers</a></p>
              <p><a href="#" class="text-white text-decoration-none">Farming Tools</a></p>
            </div>
      
            
            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
              <h5 class="text-uppercase mb-4 font-weight-bold">Services</h5>
              <p><a href="#" class="text-white text-decoration-none">Consulting</a></p>
              <p><a href="#" class="text-white text-decoration-none">Workshops</a></p>
              <p><a href="#" class="text-white text-decoration-none">Soil Testing</a></p>
              <p><a href="#" class="text-white text-decoration-none">Farm Tours</a></p>
            </div>
      
            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
              <h5 class="text-uppercase mb-4 font-weight-bold">Contact Us</h5>
              <p><i class="fas fa-home mr-3"></i> 123 Green Lane, Organic Town, USA</p>
              <p><i class="fas fa-envelope mr-3"></i> info@agroweb.com</p>
              <p><i class="fas fa-phone mr-3"></i> +1 234 567 890</p>
              <p><i class="fas fa-print mr-3"></i> +1 234 567
       </body>
</html>