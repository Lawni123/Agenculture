
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.Agriculture.OBJ.Cart"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cart</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
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

	<!-- Cart Section -->
	<div class="container py-5">
		<h2 class="text-center mb-4">Your Cart</h2>
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead class="bg-success text-white">
					<tr>
						<th>Product Name</th>
						<th>Quantity(in Kg)</th>
						<th>Price</th>
						<th>Total</th>
						<th>Actions</th>
					</tr>
				</thead>
				<%
				int gtotal = 0;
				ArrayList<Cart> cartList = null; // Declare cartList outside the if block
				if (request.getAttribute("cartList") != null) {
					cartList = (ArrayList<Cart>) request.getAttribute("cartList");
				}
				%>

				<tbody>
					<%
					if (cartList != null) {
					%>
					<!-- Check if cartList is not null -->
					<%
					for (Cart cart : cartList) {
						gtotal += cart.getPrice();
					%>
					<tr>
						<td><%=cart.getProductName()%></td>
						<td><%=cart.getQuantity()%></td>
						<td><%=cart.getpPrice()%></td>
						<td><%=cart.getPrice()%></td>
						<td>
							<form action="RemoveCart" method="post">
								<input type="hidden" name="prodId" value="<%=cart.getProdId()%>">
								<input type="hidden" name="cartId" value="<%=cart.getCartId()%>">
								<button class="btn btn-danger">remove</button>
							</form>
						</td>
					</tr>
					
					<%
					}
					%>
					<tr>
						<td></td>
						<td></td>
						<td> <b>Total : </b></td>
						<td><%=gtotal%></td>
						<td>
								<a href="BuyNow.jsp"><button class="btn btn-success">Proceed to Checkout</button></a>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
				<tfoot>

				

				</tfoot>
			</table>
		</div>

	</div>

	<!-- Footer -->
	<footer class="bg-success text-white pt-5 pb-4">
		<div class="container text-center text-md-left">
			<div class="row">
				<div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
					<h5 class="text-uppercase mb-4 font-weight-bold">About Us</h5>
					<p>We are committed to providing organic and sustainable
						agricultural products and services. Our mission is to promote
						healthy living and environmentally friendly farming practices.</p>
				</div>
				<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
					<h5 class="text-uppercase mb-4 font-weight-bold">Products</h5>
					<p>
						<a href="#" class="text-white text-decoration-none">Organic
							Vegetables</a>
					</p>
					<p>
						<a href="#" class="text-white text-decoration-none">Grains</a>
					</p>
					<p>
						<a href="#" class="text-white text-decoration-none">Fertilizers</a>
					</p>
					<p>
						<a href="#" class="text-white text-decoration-none">Farming
							Tools</a>
					</p>
				</div>
				<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
					<h5 class="text-uppercase mb-4 font-weight-bold">Services</h5>
					<p>
						<a href="#" class="text-white text-decoration-none">Consulting</a>
					</p>
					<p>
						<a href="#" class="text-white text-decoration-none">Workshops</a>
					</p>
					<p>
						<a href="#" class="text-white text-decoration-none">Soil
							Testing</a>
					</p>
					<p>
						<a href="#" class="text-white text-decoration-none">Farm Tours</a>
					</p>
				</div>
				<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
					<h5 class="text-uppercase mb-4 font-weight-bold">Contact Us</h5>
					<p>123 Green Lane, Organic Town, USA</p>
					<p>info@agroweb.com</p>
					<p>+1 234 567 890</p>
				</div>
			</div>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
