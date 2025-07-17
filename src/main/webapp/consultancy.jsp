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
    <h1>"Cultivating Success, Sustainability, and Growth"</h1>
    <p>"Empowering farmers and agribusinesses with expert solutions in organic farming, precision agriculture, and sustainable practices. <br> Transform your agricultural potential with tailored advice, innovative strategies, and cutting-edge technology for a greener, more profitable future."</p>
    
    
  </section>
  <section class="container my-5">
    <h2 class="text-center mb-4">Discover Agriculture Innovations</h2>
    <div id="agricultureCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="org.jpg" class="d-block w-100" alt="Organic Farming">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Organic Farming</h5>
                    <p>Learn how to cultivate healthy crops using sustainable practices.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="precision.jpg" class="d-block w-100" alt="Precision Agriculture">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Precision Agriculture</h5>
                    <p>Leverage cutting-edge technology to maximize productivity.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="sustain.jpg" class="d-block w-100" alt="Sustainable Practices">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Sustainable Practices</h5>
                    <p>Adopt eco-friendly solutions for a greener future.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#agricultureCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#agricultureCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</section>


<section class="container my-5">
    <h2 class="text-center mb-4">Agriculture Topics</h2>
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="crpmanagement.jpg" class="card-img-top" alt="Crop Management" >
                <div class="card-body">
                    <h5 class="card-title">Crop Management</h5>
                    <p class="card-text">Enhance productivity through advanced crop management techniques.</p>
                    <a href="cropmgmt.jsp" class="btn btn-success">Learn More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="agritech.jpg" class="card-img-top" alt="Agri-Tech" style="height: 250px;">
                <div class="card-body">
                    <h5 class="card-title">Agri-Tech</h5>
                    <p class="card-text">Discover the role of IoT, drones, and AI in modern farming.</p>
                    <a href="agritech.jsp" class="btn btn-success">Learn More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="soilhealth.jpg" class="card-img-top" alt="Soil Health">
                <div class="card-body">
                    <h5 class="card-title">Soil Health</h5>
                    <p class="card-text">Understand the importance of maintaining nutrient-rich soil.</p>
                    <a href="#" class="btn btn-success">Learn More</a>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="container my-5">
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="water conservation.jpg" class="card-img-top" alt="Water Conservation">
                <div class="card-body">
                    <h5 class="card-title">Water Conservation</h5>
                    <p class="card-text">Learn methods to conserve water and improve irrigation efficiency.</p>
                    <a href="#" class="btn btn-success">Learn More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="marketaccess.jpg" class="card-img-top" alt="Market Access" style="height: 270px;">
                <div class="card-body">
                    <h5 class="card-title">Market Access</h5>
                    <p class="card-text">Connect with buyers and optimize your supply chain effectively.</p>
                    <a href="#" class="btn btn-success">Learn More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="sustainability.jpg" class="card-img-top" alt="Sustainable Farming">
                <div class="card-body">
                    <h5 class="card-title">Sustainable Farming</h5>
                    <p class="card-text">Adopt practices that ensure long-term agricultural viability.</p>
                    <a href="#" class="btn btn-success">Learn More</a>
                </div>
            </div>
        </div>
    </div>
</section>
  
<section class="container my-5 text-center">
  <h2>Get in Touch</h2>
  <p>Ready to grow your agricultural venture?</p>
  <p><strong>📞 Call us at:</strong> +91-123-456-7890</p>
  <p><strong>📧 Email us at:</strong> Agenculture@2024.com</p>
  <a href="#" class="btn btn-primary">Schedule a Meeting</a>
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
