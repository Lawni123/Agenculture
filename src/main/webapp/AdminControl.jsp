<%@ page import="java.util.*"%>
<%@ page import="com.Agriculture.OBJ.Order"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Previous Orders</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
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

.order-container {
	max-width: 800px;
	margin: 50px auto;
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.order-card {
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 15px;
	margin-bottom: 20px;
	background-color: #FFF8DC;
	color: black;
	align-items: center;
}

.order-items {
	list-style: none;
	padding: 0;
}

.order-items li {
	padding: 5px 0;
}
</style>
<nav class="navbar navbar-expand-lg">
	<div class="container-fluid">
		<a class="navbar-brand" href="index1.html"><img src="logo2.png"
			alt="Logo"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="index1.jsp">Home</a>
				</li>
				<%
				if (session.getAttribute("name") != null && session.getAttribute("name").equals("Admin")) {
				%>

				<li class="nav-item"><a class="nav-link" href="GetMessage">Contact</a>
				</li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="Message.jsp">Contact</a>
				</li>
				<%
				}
				%>
				<li class="nav-item"><a class="nav-link" href="aboutus.jsp">About
						Us</a></li>
				<li class="nav-item"><a class="nav-link" href="products.jsp">Shop</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="schemes.jsp">Schemes</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="generalinfo.jsp">General
						Info</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="servicesDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">Services</a>
					<ul class="dropdown-menu" aria-labelledby="servicesDropdown">
						<li><a class="dropdown-item" href="consultancy.jsp">Consultation</a></li>
						<li><a class="dropdown-item" href="workshop.jsp">Workshops</a></li>

					</ul></li>
				<%
				if (session.getAttribute("name") != null && session.getAttribute("name").equals("Admin")) {
				%>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="servicesDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin
						Account</a>
					<ul class="dropdown-menu" aria-labelledby="servicesDropdown">
						<li><a class="dropdown-item" href="ViewAccount"><i
								class="bi bi-person-circle"></i>&nbsp;View Accounts </a></li>

						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item btn btn-success" type="button"
							href="Logout">&nbsp;<i class="bi bi-box-arrow-right"></i>&nbsp;Logout
						</a></li>
					</ul></li>

				<%
				} else {
				%>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="servicesDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">My
						Account</a>
					<ul class="dropdown-menu" aria-labelledby="servicesDropdown">
						<li><a class="dropdown-item" href="profile.jsp"><i
								class="bi bi-person-circle"></i>&nbsp;My profile </a></li>
						<li><a class="dropdown-item" href="EditPfl.jsp"><i
								class="bi bi-pencil-square"></i>&nbsp;Edit Profile</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item btn btn-success" type="button"
							href="Logout">&nbsp;<i class="bi bi-box-arrow-right"></i>&nbsp;Logout
						</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="Cart"><i
						class="bi bi-cart-fill"></i>My Cart</a></li>
				<li class="nav-item"><a class="nav-link" href="FetchOrders"><i
						class="bi bi-bag-check-fill"></i>My Orders</a></li>
				<%
				}
				%>

			</ul>
		</div>
	</div>
</nav>
<br>
<br>
<div class="h2 text-center"><%=session.getAttribute("status")%>
	orders
</div>
</head>

<body class="bg-light">
	<%
	ArrayList<Order> orderList = (ArrayList<Order>) session.getAttribute("orderlist");

	// Map to store product name and quantity for each order
	Map<Integer, Map<String, Integer>> orderMap = new LinkedHashMap<>();
	Map<Integer, Order> order1Map = new LinkedHashMap<>();

	for (Order order : orderList) {
		// Create a product map for each order
		orderMap.computeIfAbsent(order.getOrderId(), k -> new LinkedHashMap<>()).merge(order.getProdName(),
		order.getProdQty(), Integer::sum);

		// Store the order details
		order1Map.put(order.getOrderId(), order);
	}
	%>

	<div class="order-container">
		<%
		for (Map.Entry<Integer, Map<String, Integer>> entry : orderMap.entrySet()) {
		%>
		<div class="order-card">
			<h5>
				Order ID:
				<%=entry.getKey()%></h5>
			<ul class="order-items">
				<%
				for (Map.Entry<String, Integer> productEntry : entry.getValue().entrySet()) {
				%>
				<li><%=productEntry.getKey()%>(<%=productEntry.getValue()%>kg)</li>
				<%!int quant;
	String prod;%>
				<%
				quant = productEntry.getValue();
				prod = productEntry.getKey();
				%>
				<%
				}
				%>
			</ul>
			<h5 class="mb-1">
				Name:
				<%=order1Map.get(entry.getKey()).getuName()%></h5>
			<h5 class="mb-1">
				Address:
				<%=order1Map.get(entry.getKey()).getuAddress()%></h5>
			<h5 class="mb-1">
				Total Amount:
				<%=order1Map.get(entry.getKey()).getTotalAmt()%></h5>
			<%
			if (order1Map.get(entry.getKey()).getStatus().equals("return")) {
			%>
			<form id="quantity-form" method="GET" action="IncreaseQty"
				class="mt-3">
				<input type="hidden" name="productName" value=<%=prod %>>
				<input type="hidden" name="quantity" value=<%=quant %>>
				<button type="submit" class="btn btn-primary">Restock</button>
			</form>

			<%
			} else {
			%>
			<form method="post" action="UpdateOrders">
				<input type="hidden" name="sss"
					value="<%=order1Map.get(entry.getKey()).getStatus()%>"> <input
					type="hidden" name="orderId" value="<%=entry.getKey()%>">
				<%!String status = null;%>
				<%
				switch (order1Map.get(entry.getKey()).getStatus()) {
				case "ordered":
					status = "shipped";
					break;
				case "shipped":
					status = "out for delivery";
					break;
				case "out for delivery":
					status = "complete";
					break;
				case "complete":
					status = "return";
					break;
				case "return":
					status = "restock";
					break;
				}
				%>
				<input type="hidden" name="status" value="<%=status%>">
				<button type="submit" id="<%=status%>" class="btn btn-success"><%=status%></button>
			</form>
			<%
			}
			%>
		</div>
		<%
		}
		%>
	</div>

	</div>
	</div>

	<footer class="bg-success text-white pt-5 pb-4 m-0">
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
					<p>
						<i class="fas fa-home mr-3"></i> 123 Green Lane, Organic Town, USA
					</p>
					<p>
						<i class="fas fa-envelope mr-3"></i> info@agroweb.com
					</p>
					<p>
						<i class="fas fa-phone mr-3"></i> +1 234 567 890
					</p>
					<p>
						<i class="fas fa-print mr-3"></i> +1 234 567
					</p>
				</div>
			</div>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>