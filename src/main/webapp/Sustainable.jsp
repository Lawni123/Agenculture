<!doctype html>
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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sustainable Farming Practices</title>
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
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        .card-body {
            text-align: center;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
 
   

    <div style="height: 300px; background: linear-gradient(120deg, #0cab51, #1bc55f);">
      <header class="bg text-white text-center py-4">
        <br><br><br><br><h1>Sustainable Farming Practices</h1>
        <p>Learn about practices that promote sustainability in agriculture</p>
      </header>
    </div>

    <div class="container my-5">
        <h3>Sustainable Farming Practices</h3>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card">
                    <img src="croprotation.jpg" class="card-img-top" alt="Crop Rotation">
                    <div class="card-body">
                        <h5 class="card-title">Crop Rotation</h5>
                        <p class="card-text">By rotating crops each season, farmers can improve soil health, reduce pest buildup, and maintain balanced nutrient levels in the soil.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="compost.jpg" class="card-img-top" alt="Composting">
                    <div class="card-body">
                        <h5 class="card-title">Composting</h5>
                        <p class="card-text">Composting organic waste to create nutrient-rich fertilizer for crops can enhance soil structure and promote plant growth naturally.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="water.jpg" class="card-img-top" alt="Water Conservation">
                    <div class="card-body">
                        <h5 class="card-title">Water Conservation</h5>
                        <p class="card-text">Implementing efficient irrigation systems like drip irrigation helps minimize water usage while ensuring crops receive optimal moisture.</p>
                    </div>
                </div>
            </div>
        </div>
        <br>

        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card">
                    <img src="pest.jpg" class="card-img-top" alt="Organic Pest Control">
                    <div class="card-body">
                        <h5 class="card-title">Organic Pest Control</h5>
                        <p class="card-text">Using natural methods to control pests, such as introducing beneficial insects, reduces the need for harmful chemicals in farming.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="agroforestry.jpg" class="card-img-top" alt="Agroforestry">
                    <div class="card-body">
                        <h5 class="card-title">Agroforestry</h5>
                        <p class="card-text">Integrating trees with crops or livestock can provide benefits like improved biodiversity, better water retention, and enhanced carbon sequestration.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="soilcheck.jpg" class="card-img-top" alt="Soil Health">
                    <div class="card-body">
                        <h5 class="card-title">Soil Health Management</h5>
                        <p class="card-text">Maintaining soil fertility through practices like mulching, no-till farming, and cover cropping can prevent erosion and improve soil structure.</p>
                    </div>
                </div>
            </div>
        </div>
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
