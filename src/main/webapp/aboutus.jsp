<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>About Us - Agenculture</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
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
    .about-header {
      background: linear-gradient(120deg, #0cab51, #1bc55f);
      color: white;
      padding: 100px 40px;
      text-align: center;
    }
    .about-header h1 {
    
      margin-bottom: 10px;
    }
    .about-header p {
      font-size: 1.2rem;
    }
    .section {
      padding: 50px 20px;
    }
    .section h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    .team-member img {
      border-radius: 50%;
      margin-bottom: 10px;
    }
    .team-member h5 {
      margin: 10px 0 5px;
    }
    .team-member p {
      font-size: 0.9rem;
      color: #555;
    }
    .btn-custom {
      background-color: #28a745;
      color: white;
      border-radius: 20px;
      padding: 5px 20px;
      border: none;
      transition: background-color 0.3s;
    }
  </style>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setHeader("Expires", "0"); // Proxies

if (session.getAttribute("uname") == null) {
    response.sendRedirect("Login.jsp");
}
%>
<body>
    <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="index1.html"><img src="logo2.png" alt="Logo"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="index1.jsp">Home</a>
          </li>
          <%
    if(session.getAttribute("name") != null && session.getAttribute("name").equals("Admin")) {
%>
     
            <li class="nav-item">
              <a class="nav-link" href="GetMessage">Contact</a>
            </li>
<%
    }else{
%>
              <li class="nav-item">
              <a class="nav-link" href="Message.jsp">Contact</a>
            </li>
          <%
    }
%>
          <li class="nav-item">
            <a class="nav-link" href="aboutus.jsp">About Us</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="products.jsp">Shop</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="schemes.jsp">Schemes</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="generalinfo.jsp">General Info</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="servicesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Services</a>
            <ul class="dropdown-menu" aria-labelledby="servicesDropdown">
              <li><a class="dropdown-item" href="consultancy.jsp">Consultation</a></li>
              <li><a class="dropdown-item" href="workshop.jsp">Workshops</a></li>
            
            </ul>
          </li>
     <%
    if(session.getAttribute("name") != null && session.getAttribute("name").equals("Admin")) {
%>
    <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="servicesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin Account</a>
            <ul class="dropdown-menu" aria-labelledby="servicesDropdown">
              <li><a class="dropdown-item" href="ViewAccount"><i class="bi bi-person-circle"></i>&nbsp;View Accounts </a></li>
              
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item btn btn-success" type="button"  href="Logout">&nbsp;<i class="bi bi-box-arrow-right"></i>&nbsp;Logout</a></li>
            </ul>
          </li>
          
<%
    }else{
%>
   
           <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="servicesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">My Account</a>
            <ul class="dropdown-menu" aria-labelledby="servicesDropdown">
              <li><a class="dropdown-item" href="profile.jsp"><i class="bi bi-person-circle"></i>&nbsp;My profile </a></li>
              <li><a class="dropdown-item" href="EditPfl.jsp"><i class="bi bi-pencil-square"></i>&nbsp;Edit Profile</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item btn btn-success" type="button"  href="Logout">&nbsp;<i class="bi bi-box-arrow-right"></i>&nbsp;Logout</a></li>
            </ul>
          </li>
          <li class="nav-item"><a class="nav-link" href="Cart"><i class="bi bi-cart-fill"></i>My Cart</a></li>
          <li class="nav-item"><a class="nav-link" href="FetchOrders"><i class="bi bi-bag-check-fill"></i>My Orders</a></li>
          <%
    }
%>

        </ul>
      </div>
    </div>
  </nav>
 
  <header class="about-header">
    <h1>About Us</h1>
    <p>Your partner in sustainable and organic farming solutions.</p>
  </header>

 
 
  <section class="section bg-light">
    <h2>Our Core Values</h2>
    <div class="row container mx-auto text-center">
      <div class="col-md-4">
        <h5>Integrity</h5>
        <p>We believe in honesty and transparency in all our interactions.</p>
      </div>
      <div class="col-md-4">
        <h5>Innovation</h5>
        <p>We embrace change and strive to develop innovative agricultural solutions.</p>
      </div>
      <div class="col-md-4">
        <h5>Sustainability</h5>
        <p>Our commitment is to nurture the environment while empowering communities.</p>
      </div>
    </div>
  </section>

  
  <section class="section">
    <h2>Meet Our Team</h2>
    <div class="row container mx-auto text-center">
      <div class="col-md-4 team-member">
        <img src="contact.jpg" alt="Team Member 1" class="img-fluid" width="150">
        <h5>Rahul</h5>
        <p>CEO & Founder</p>
      </div>
      <div class="col-md-4 team-member">
        <img src="contact.jpg" alt="Team Member 2" class="img-fluid" width="150">
        <h5>Surender</h5>
        <p>Head of Operations</p>
      </div>
      <div class="col-md-4 team-member">
        <img src="contact.jpg" alt="Team Member 3" class="img-fluid" width="150">
        <h5>Sampath</h5>
        <p>Marketing Lead</p>
      </div>
    </div>
  </section>

  
  <footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 Agenculture. All Rights Reserved.</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <footer class="bg-success text-white pt-5 pb-4">
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
