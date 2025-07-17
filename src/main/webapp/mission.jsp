<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setHeader("Expires", "0"); // Proxies

if (session.getAttribute("uname") == null) {
    response.sendRedirect("Login.jsp");
}
%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Our Mission & Vision</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
        .hero-section {
          text-align: center;
          padding: 80px 20px;
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
        .card-body {
            text-align: center;
        }
        .footer {
            background-color: #00ff59;
            color: white;
            padding: 20px 0;
        }
    </style>
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
    <div class="hero-section">
      <h1>Our Mission & Vision</h1>
      <p>We are committed to creating a sustainable and healthier world through organic farming practices.</p>
    </div>

    <div class="container my-5">
      <section>
        <h3>Our Mission</h3>
        <p>Our mission is to promote organic farming and sustainable agricultural practices that benefit both the environment and the health of our communities. We believe that by using natural and eco-friendly farming techniques, we can produce food that is not only nutritious but also safe for our planet.</p>
        
        <p>We strive to provide high-quality organic produce that supports healthy living, encourages biodiversity, and contributes to the long-term health of our soils, water, and ecosystems.</p>
      </section>

      <section class="my-5">
        <h3>Our Vision</h3>
        <p>Our vision is to become a leading advocate for organic farming and sustainability, driving the adoption of eco-friendly practices worldwide. We aim to inspire a global shift towards organic, regenerative agriculture that nourishes people and the planet alike.</p>
        
        <p>We envision a future where organic farming is the norm, not the exception, and where sustainable agriculture practices play a central role in addressing the challenges of climate change, food security, and environmental degradation.</p>
      </section>

      <section class="my-5">
        <h3>Our Values</h3>
        <ul>
          <li><strong>Environmental Stewardship:</strong> We are dedicated to protecting the environment through sustainable farming practices that reduce waste, conserve water, and preserve biodiversity.</li>
          <li><strong>Health and Wellness:</strong> We prioritize the health and well-being of our customers by providing chemical-free, nutrient-rich, and wholesome food.</li>
          <li><strong>Integrity:</strong> We operate with honesty, transparency, and respect for both our customers and the environment.</li>
          <li><strong>Innovation:</strong> We continuously seek innovative ways to improve our farming practices, from implementing new technologies to experimenting with better organic farming methods.</li>
          <li><strong>Community Engagement:</strong> We are committed to supporting local communities, collaborating with farmers, and educating the public about the benefits of organic farming.</li>
        </ul>
      </section>

      <section class="my-5">
        <h3>How We Contribute to a Healthier World</h3>
        <p>Our commitment to organic farming is not just about producing food; it's about creating a positive impact on the world. By growing food in harmony with nature, we reduce the environmental footprint of agriculture, enhance soil health, and promote the use of sustainable farming practices.</p>
        
        <p>Through our efforts, we contribute to a healthier ecosystem by minimizing chemical pesticides and fertilizers, encouraging biodiversity, and reducing the harmful effects of conventional farming methods. Our work supports a more sustainable and just food system for future generations.</p>
      </section>
    </div>

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
                    <p><i class="fas fa-print mr-3"></i> +1 234 567</p>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>
