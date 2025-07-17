<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SignUp</title>
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
   //      	var name = document.forms["userForm"]["name"].value.trim();
            var mail = document.forms["userForm"]["mail"].value.trim();
         	var phone = document.forms["userForm"]["phone"].value.trim();
            var pass =  document.forms["userForm"]["pass"].value.trim();
            var pass1 =  document.forms["userForm"]["pass2"].value.trim();
            var nick =  document.forms["userForm"]["nick"].value.trim();
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$/;
            console.log(pass);
            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            
			if(!emailRegex.test(mail)){
				alert("Please Enter a Valid Email!");
			}
			if(phone.length<10||phone.length>10){
				alert("Phone Number Must be exact 10 digits");
				return false;
			}
			if(!(/^\d+$/.test(phone))){
				alert("Phone Number must only contain digits");
				return false;
			}
            if(!passwordRegex.test(pass)){
            	alert("Password must contain:\n- At least one uppercase letter\n- At least one lowercase letter\n- At least one number\n- Be more than 5 characters long");
            	return false;
            }
            if(pass !== pass1){
            	alert("Password Missmatch!");
            	return false
            }
            if(nick.length<4){
				alert("NickName Must Contain more than 4 character");
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
    <br><br><br><form action="SignUp" method="post" name="userForm" class="needs-validation container-fluid align-center mx-auto p-2 border border-radius shadow p-3 mb-5 bg-body-primary rounded padding 30px" novalidate onsubmit="return validateForm();">
    <div class="container-fluid">
        <p class="h1 text-center">Sign up</p>
      </div>
  <div class="mb-3">
    <label for="validationName" class="form-label">Full Name</label>
    <input type="text" class="form-control" name="name" placeholder="Enter your full name" required>
    <div class="invalid-feedback">Please provide your name.</div>
  </div>
  <div class="mb-3">
    <label for="validationEmail" class="form-label">Email</label>
    <input type="email" class="form-control" name="mail" placeholder="Enter your email" required>
    <div class="invalid-feedback">Please provide a valid email.</div>
  </div>
  <div class="mb-3">
    <label for="validationPassword" class="form-label">Create Password</label>
    <input type="password" class="form-control" name="pass" placeholder="Enter your password" required>
    <div class="invalid-feedback">Please provide a password.</div>
  </div>
  <div class="mb-3">
    <label for="validationPassword" class="form-label">Confirm Password</label>
    <input type="password" class="form-control" name="pass2" placeholder="Enter your password" required>
    <div class="invalid-feedback">Please provide a password.</div>
  </div>
  <div class="mb-3">
    <label for="validationPhone" class="form-label">Phone Number</label>
    <input type="tel" class="form-control" name="phone" placeholder="Enter your phone number" required>
    <div class="invalid-feedback">Please provide a valid phone number.</div>
  </div>
  <div class="mb-3">
    <label for="validationAddress" class="form-label">Address</label>
    <textarea class="form-control" name="addr" placeholder="Enter your address" rows="3" required></textarea>
    <div class="invalid-feedback">Please provide your address.</div>
  </div>
   <div class="mb-3">
    <label for="validationName" class="form-label">Security question</label>
    <input type="text" class="form-control" name="nick" placeholder="Enter your nickname" required>
    <div class="invalid-feedback">Enter your nickname.</div>
  </div>
  <div>
    <button class="btn btn-success" type="submit">Submit</button>
  </div>
  <div class="mb-3">
    Already Have an account?
    <a href="login.jsp" >Login</a>
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