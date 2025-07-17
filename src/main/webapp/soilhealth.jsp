<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <title>Soil Health | Agenculture</title>
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
          <li class="nav-item">
            <a class="nav-link" href="contactpage.jsp">Contact</a>
          </li>
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
              <li><a class="dropdown-item" href="consultancy.jsp"><i class="bi bi-person-circle"></i>&nbsp;View Accounts </a></li>
              <li><a class="dropdown-item" href="workshop.jsp"><i class="bi bi-pencil-square"></i>&nbsp;Edit Accounts</a></li>
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
              <li><a class="dropdown-item" href="consultancy.jsp"><i class="bi bi-person-circle"></i>&nbsp;My profile </a></li>
              <li><a class="dropdown-item" href="workshop.jsp"><i class="bi bi-pencil-square"></i>&nbsp;Edit Profile</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item btn btn-success" type="button"  href="Logout">&nbsp;<i class="bi bi-box-arrow-right"></i>&nbsp;Logout</a></li>
            </ul>
          </li>
          <%
    }
%>
        </ul>
      </div>
    </div>
  </nav>
  <section class="hero-section">
    <h1>Soil Health: The Key to Sustainable Agriculture</h1>
    <p>Soil is the foundation of healthy, thriving crops. Maintaining nutrient-rich soil is crucial for the long-term productivity of your farm. Learn the importance of soil health and the steps to ensure your soil remains fertile and full of vitality for years to come.</p>
  </section>

  <section class="container my-5">
    <h2 class="text-center mb-4">Why Soil Health Matters</h2>
    <div class="row">
      <div class="col-md-4 mb-4">
        <div class="card h-100">
          <img src="soilfertility.jpg" class="card-img-top" alt="Soil Fertility">
          <div class="card-body">
            <h5 class="card-title">Soil Fertility</h5>
            <p class="card-text">Healthy soil supports strong, productive crops. It helps retain moisture, reduces the need for synthetic fertilizers, and promotes beneficial microorganisms.</p>
            <a href="#" class="btn btn-success">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card h-100">
          <img src="organicmatter.jpeg" class="card-img-top" alt="Organic Matter">
          <div class="card-body">
            <h5 class="card-title">Organic Matter</h5>
            <p class="card-text">Incorporating organic matter like compost and cover crops can improve soil structure, enhance water retention, and boost nutrient levels naturally.</p>
            <a href="#" class="btn btn-success">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card h-100">
          <img src="soiltest.jpg" class="card-img-top" alt="Soil Testing">
          <div class="card-body">
            <h5 class="card-title">Soil Testing</h5>
            <p class="card-text">Regular soil testing is key to understanding nutrient levels and pH balance. This helps you make informed decisions on fertilization and amendments.</p>
            <a href="#" class="btn btn-success">Learn More</a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="container my-5">
    <h2 class="text-center mb-4">How to Improve Soil Health</h2>
    <div class="row">
      <div class="col-md-4 mb-4">
        <div class="card h-100">
          <img src="croprotation.jpg" class="card-img-top" alt="Crop Rotation">
          <div class="card-body">
            <h5 class="card-title">Crop Rotation</h5>
            <p class="card-text">Rotating crops helps reduce soil erosion, improve soil structure, and prevent the buildup of pests and diseases.</p>
            <a href="#" class="btn btn-success">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card h-100">
          <img src="cover.jpg" class="card-img-top" alt="Cover Crops">
          <div class="card-body">
            <h5 class="card-title">Cover Crops</h5>
            <p class="card-text">Cover crops like legumes help prevent soil erosion, improve soil structure, and increase organic matter, making the soil healthier for future crops.</p>
            <a href="#" class="btn btn-success">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card h-100">
          <img src="composting.jpg" class="card-img-top" alt="Composting">
          <div class="card-body">
            <h5 class="card-title">Composting</h5>
            <p class="card-text">Adding compost to your soil replenishes vital nutrients, improves soil texture, and encourages beneficial organisms.</p>
            <a href="#" class="btn btn-success">Learn More</a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="container my-5 text-center">
    <h2>Get in Touch</h2>
    <p>Interested in improving your soil health? We can help!</p>
    <p><strong>📞 Call us at:</strong> +91-123-456-7890</p>
    <p><strong>📧 Email us at:</strong> Agenculture@2024.com</p>
    <a href="#" class="btn btn-primary">Schedule a Meeting</a>
  </section>

  <footer class="bg-success text-white pt-5 pb-4">
    <div class="container text-center text-md-left">
      <div class="row">
        <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
          <h5 class="text-uppercase mb-4 font-weight-bold">About Us</h5>
          <p>We are committed to providing organic and sustainable agricultural products and services. Our mission is to promote healthy living and environmentally friendly farming practices.</p>
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
          <p><i class="fas fa-print mr-3"></i> +1 234 567 890</p>
        </div>
      </div>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
