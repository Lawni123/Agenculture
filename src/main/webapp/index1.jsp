<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.Agriculture.OBJ.User" %>
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
  <title>Agenculture</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
      background-color: #19cb45;
      color: white;
      border-radius: 20px;
      padding: 5px 20px;
      border: none;
      transition: background-color 0.3s;
    }
    .btn-custom:hover {
      background-color: #12ae31;
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
    h2{
    background-color:
    }
 

  </style>
  

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
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
 


  <section class="hero-section">
   <h1 style="color:white"> <% 
        if (session.getAttribute("name") != null) {
          out.print("Welcome to Agenculture <br><h2>"+ session.getAttribute("name")+"</h2");
        }
      %></h1>
  <%
    if(session.getAttribute("name") != null && session.getAttribute("name").equals("Admin")) {
%>
    <br><br><a class="nav-link" href="AdminDashboard.jsp"><i class="bi bi-cart-check"></i>Check orders</a>
    <%} %>
  </section><br>
  <div class="d-grid gap-2 col-2 mx-auto" style="font-size:20px">
  <a href="http://127.0.0.1:5000/index"><button class="btn btn-primary" type="button" style="background-color:green">Plant disease detector</button></a>
  
</div>
  <section class="py-5">
    <div class="container">
      <h2 class="text-center mb-4">Why Choose Us?</h2>
      <div class="row g-4">
        
        <div class="col-md-4">
          <div class="card h-100">
            <img src="vegetables.jpg" class="card-img-top" alt="Fresh Farm Produce">
            <div class="card-body">
              <h5 class="card-title">Fresh Farm Produce</h5>
              <p class="card-text">
                Enjoy fresh, organic produce harvested directly from sustainable farms. Quality you can trust.
              </p>
            
            </div>
          </div>
        </div>
        
        <div class="col-md-4">
          <div class="card h-100">
            <img src="ecofriendly.jpg" class="card-img-top" alt="Eco-Friendly Practices">
            <div class="card-body">
              <h5 class="card-title">Eco-Friendly Practices</h5>
              <p class="card-text">
                We prioritize the environment by employing organic and sustainable farming techniques.
              </p>
              
            </div>
          </div>
        </div>
        
        <div class="col-md-4">
          <div class="card h-100">
            <img src="dining.jpeg" class="card-img-top" alt="Organic Dining Experience">
            <div class="card-body">
              <h5 class="card-title">Organic Dining Experience</h5>
              <p class="card-text">
                Dine at our organic hotels and experience meals made from farm-fresh, organic ingredients.
              </p>
             
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="py-5">
    <div class="container">
      <h2 class="text-center mb-4">Latest from Our Blog</h2>
      <div class="row g-4">
        
        <div class="col-md-4">
          <div class="card">
            <img src="practice7.jpg" class="card-img-top" alt="Blog Post">
            <div class="card-body">
              <h5 class="card-title">Benefits of Eating Organic</h5>
              <p class="card-text">Discover how organic food can enhance your health and lifestyle.</p>
              <a href="Benefits.jsp" class="btn btn-success">Read More</a>
            </div>
          </div>
        </div>
       
        <div class="col-md-4">
          <div class="card">
            <img src="practce2.jpg" class="card-img-top" alt="Blog Post">
            <div class="card-body">
              <h5 class="card-title">Sustainable Farming Practices</h5>
              <p class="card-text">Learn about innovative farming techniques that protect the environment.</p>
              <a href="Sustainable.jsp" class="btn btn-success">Read More</a>
            </div>
          </div>
        </div>
      
        <div class="col-md-4">
          <div class="card">
            <img src="practice6.jpg" class="card-img-top" alt="Blog Post">
            <div class="card-body">
              <h5 class="card-title">Our Vision and Mission</h5>
              <p class="card-text">We are committed to creating a sustainable and healthier world through organic farming practices.</p>
              <a href="mission.jsp" class="btn btn-success">Read More</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="py-5 text-white" style="background-color: #4caf50;">
    <div class="container">
      <h2 class="text-center mb-4">Organic Farming by the Numbers</h2>
      <div class="row text-center">
        <div class="col-md-3">
          <h1 class="display-4">80%</h1>
          <p>Less soil erosion compared to conventional farming.</p>
        </div>
        <div class="col-md-3">
          <h1 class="display-4">50%</h1>
          <p>Lower energy usage in organic farming systems.</p>
        </div>
        <div class="col-md-3">
          <h1 class="display-4">30%</h1>
          <p>Higher biodiversity in organic farms.</p>
        </div>
        <div class="col-md-3">
          <h1 class="display-4">100%</h1>
          <p>Natural, chemical-free food for a healthier lifestyle.</p>
        </div>
      </div>
    </div>
  </section>

  <section class="py-5 bg-light text-center">
    <div class="container">
      <h2 class="mb-3">Our Commitment to Sustainability</h2>
      <p class="lead">We are dedicated to providing organic, chemical-free products while preserving the planet for future generations. Every purchase you make supports a healthier, greener world.</p>
      <img src="ancient2.jpg" alt="Sustainability Commitment" class="img-fluid mt-4">
    </div>
  </section>
  
  <section class="py-5">
    <div class="container">
      <h2 class="text-center mb-4">Stories from Our Farmers</h2>
      <div class="row">
        <div class="col-md-6">
          <blockquote class="blockquote">
            <p>"Switching to organic farming has been life-changing. Not only do I feel connected to the soil, but I also see how my practices are making a difference for the environment."</p>
            <footer class="blockquote-footer">Ramesh Patel, Farmer</footer>
          </blockquote>
        </div>
        <div class="col-md-6">
          <blockquote class="blockquote">
            <p>"Thanks to organic farming, my family and I enjoy healthy, pesticide-free food, and I've noticed a positive impact on my farm's ecosystem."</p>
            <footer class="blockquote-footer">Anita Sharma, Farmer</footer>
          </blockquote>
        </div>
      </div>
    </div>
  </section>
  
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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
