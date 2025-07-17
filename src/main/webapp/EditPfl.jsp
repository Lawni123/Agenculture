<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Agriculture.OBJ.User" %>
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
  <title>My Profile - Agenculture</title>
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
    .profile-header {
      background: linear-gradient(120deg, #0cab51, #1bc55f);
      color: white;
      padding: 80px 40px;
      text-align: center;
    }
    .profile-header h1 {
      margin-bottom: 10px;
    }
    .profile-header p {
      font-size: 1.2rem;
    }
    .section {
      padding: 50px 20px;
    }
    .section h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    .profile-details {
      max-width: 800px;
      margin: 0 auto;
      text-align: left;
      padding: 20px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .profile-details img {
      border-radius: 50%;
      margin-bottom: 15px;
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
  <script type="text/javascript">
  function editProfileImage() {
	  document.getElementById('imageUpload').click();
	}

	function uploadImage(event) {
	  const file = event.target.files[0];
	  if (file) {
	    const reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('profileImage').src = e.target.result;
	    };
	    reader.readAsDataURL(file);
	  }
	}
	  </script>
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

  <header class="profile-header">
    <h1>Edit Profile</h1>
    <p>Manage your personal information and preferences</p>
  </header>

  <section class="section">
    <div class="profile-details">
      <div class="text-center">
          <%User user = (User)session.getAttribute("user");%> 
       <!-- Profile Image and Edit Icon -->
<div class="profile-image-container" style="position: relative; display: inline-block;">
  <img id="profileImage" src="pic/profile/<%=user.getImg() %>" alt="Profile Picture" class="img-fluid" width="150">
  <div class="edit-icon position-absolute bottom-0 end-0 p-2" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#editModal">
    <i class="bi bi-pencil-square text-black" style="font-size: 1.8rem;"></i>
  </div>
</div>

<!-- Modal for Image Upload -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editModalLabel">Upload New Profile Picture</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Form to upload new image -->
        <form id="uploadForm" action="EditImg" method="post" enctype="multipart/form-data" >
          <div class="mb-3">
            <label for="imageUpload" class="form-label">Choose Image</label>
            <input type="file" class="form-control" id="imageUpload" name="image" accept="image/*" required>
          </div>
       
      </div>
      <div class="modal-footer">
        
        <button type="submit" form="uploadForm" class="btn btn-success">Upload</button>
      </div>
       </form>
    </div>
  </div>
</div>


      </div>
     <div class="text-center">
    <br>
    <h1> 
        <%= user.getName() %> 
        <i class="bi bi-pencil-square text-black" style="font-size: 1.8rem;" data-bs-toggle="modal" data-bs-target="#editNameModal"></i>
    </h1>
    <br>
    <h3> 
        <%= user.getEmail() %> 
        <i class="bi bi-pencil-square text-black" style="font-size: 1.8rem;" data-bs-toggle="modal" data-bs-target="#editEmailModal"></i>
    </h3>
    <h3> 
        <%= user.getPhone() %> 
        <i class="bi bi-pencil-square text-black" style="font-size: 1.8rem;" data-bs-toggle="modal" data-bs-target="#editPhoneModal"></i>
    </h3>
    <h3> 
        <%= user.getAddress() %> 
        <i class="bi bi-pencil-square text-black" style="font-size: 1.8rem;" data-bs-toggle="modal" data-bs-target="#editAddressModal"></i>
    </h3>
</div>

<!-- Edit Name Modal -->
<div class="modal fade" id="editNameModal" tabindex="-1" aria-labelledby="editNameModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editNameModalLabel">Edit Name</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form method="post" action="EditProfile">
      <div class="modal-body">
        
          <div class="mb-3">
            <label for="nameInput" class="form-label">Name</label>
            <input type="hidden" name="edit" value="name">
            <input type="text" class="form-control" id="nameInput" name="value" value="<%=user.getName() %>">
          </div>
        
      </div>
      <div class="modal-footer">
        
        <button type="submit" class="btn btn-success" id="saveNameBtn">Save Changes</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- Edit Email Modal -->
<div class="modal fade" id="editEmailModal" tabindex="-1" aria-labelledby="editEmailModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editEmailModalLabel">Edit Email</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <form method="post" action="EditProfile">
      <div class="modal-body">
        
          <div class="mb-3">
            <label for="emailInput" class="form-label">Email</label>
             <input type="hidden" name="edit" value="email">
            <input type="email" class="form-control" id="emailInput" name="value" value="<%= user.getEmail() %>">
          </div>
        </div>
      
      <div class="modal-footer">
        
        <button type="submit" class="btn btn-success" id="saveEmailBtn">Save Changes</button>
      
      </div>
    </form>
    
    </div>
  </div>
</div>

<!-- Edit Phone Modal -->
<div class="modal fade" id="editPhoneModal" tabindex="-1" aria-labelledby="editPhoneModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editPhoneModalLabel">Edit Phone</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <form method="post" action="EditProfile">
      <div class="modal-body">
        
          <div class="mb-3">
            <label for="phoneInput" class="form-label">Phone</label>
             <input type="hidden" name="edit" value="phone_number">
            <input type="text" class="form-control" id="phoneInput" name="value" value="<%=user.getPhone() %>">
          </div>
       
      </div>
      <div class="modal-footer">
        
        <button type="submit" class="btn btn-success" id="savePhoneBtn">Save Changes</button>
     
     </div>
   </form>
    </div>
  </div>
</div>

<!-- Edit Address Modal -->
<div class="modal fade" id="editAddressModal" tabindex="-1" aria-labelledby="editAddressModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editAddressModalLabel">Edit Address</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <form method="post" action="EditProfile">
      <div class="modal-body">
     
          <div class="mb-3">
            <label for="addressInput" class="form-label">Address</label>
             <input type="hidden" name="edit" value="address">
            <input type="text" class="form-control" id="addressInput" name="value" value="<%=user.getAddress()%>">
          </div>
        
      </div>
      <div class="modal-footer">
        
        <button type="submit" class="btn btn-success" id="saveAddressBtn">Save Changes</button>
      </div>
    </form>
    </div>
  </div>
</div>


    </div>
  </section>

 
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
        </div>
      </div>
    </div>
  </footer>
</body>
</html>