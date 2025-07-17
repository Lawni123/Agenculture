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
    <title>Rashtriya Krishi Vikas Yojana (RKVY)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
          font-family: 'Arial', sans-serif;
          margin: 10;
          padding: 10;
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
        .image-section {
          margin: 40px 0;
        }
        .image-section img {
          width: 100%;
          max-width: 500px;
          margin: 20px 0;
          border-radius: 8px;
        }
    </style>
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
  </head>
  <body>
   

    <div class="container">
      <div class="hero-section">
        <h1>Rashtriya Krishi Vikas Yojana (RKVY)</h1>
        <p> Rashtriya Krishi Vikas Yojana (RKVY) is a flagship initiative of the Government of India aimed at promoting agricultural development by providing funding support to state governments for the implementation of projects in agriculture and allied sectors. 
</p>
        <br><a href="https://www.myscheme.gov.in/schemes/rkvy" class="btn btn-custom">Know More</a>
      </div>

      
      <p>
      </p>
      <br><br>
      <h3>Key Features of RKVY:</h3>
      <ul>
        <li><strong>Financial Assistance:</strong> The scheme provides financial assistance to state governments to implement agricultural projects across the country.</li>
        <li><strong>Infrastructure Development:</strong> RKVY promotes the creation of necessary infrastructure for improving agricultural production, like cold storage, irrigation systems, and warehouses.</li>
        <li><strong>Technology Adoption:</strong> The scheme encourages the adoption of modern farming technologies and techniques to increase agricultural productivity.</li>
        <li><strong>Climate-Resilient Farming:</strong> RKVY helps in promoting climate-resilient agricultural practices, such as rainwater harvesting and water conservation technologies.</li>
      </ul>
      
      
      <h3>Objectives of RKVY:</h3>
      <ul>
        <li>To achieve 4% annual growth in agriculture and allied sectors.</li>
        <li>To promote sustainable farming practices and improve the infrastructure for agriculture.</li>
        <li>To increase the productivity of major crops and improve farmers' livelihoods.</li>
        <li>To enhance the income of farmers through the promotion of value-added activities.</li>
      </ul>
      
      <h3>Benefits of RKVY:</h3>
      <ul>
        <li><strong>Improved Agricultural Productivity:</strong> By providing support for modern farming techniques, RKVY helps increase the yield of key crops.</li>
        <li><strong>Infrastructure Development:</strong> The scheme aids in building essential infrastructure for the agricultural sector, which boosts productivity and reduces post-harvest losses.</li>
        <li><strong>Rural Employment:</strong> RKVY contributes to job creation in rural areas by supporting the agricultural value chain, including processing and distribution activities.</li>
        <li><strong>Increased Farmer Income:</strong> By promoting better farming practices and value-added agricultural products, RKVY aims to raise the income of farmers.</li>
      </ul>
    </div>

    <br><br>
    <footer class="bg-success text-white pt-5 pb-4">
      <div class="container text-center text-md-left">
        <div class="row">
          <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
            <h5 class="text-uppercase mb-4 font-weight-bold">About Us</h5>
            <p>We are committed to providing agricultural solutions and promoting sustainable farming practices that enhance the productivity and income of farmers.</p>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>
