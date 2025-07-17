<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Status</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
.card {
	transition: transform 0.3s ease-in-out;
	cursor: pointer;
}

.card:hover {
	transform: scale(1.05);
}

.card img {
	height: 150px;
	object-fit: contain;
}

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

				<%
				}
				%>

			</ul>
		</div>
	</div>
</nav>
</head>
 <script>
        // Function to fetch notifications from the server
      function fetchNumber() {
    fetch('numberOfOrders') // URL to fetch data
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok: ' + response.statusText);
            }
            return response.json(); // Parse the response as JSON
        })
        .then(data => {
            document.getElementById('ordered').innerText = "Number Of Orders : " + data.ordered;
            document.getElementById('shipped').innerText = "Number Of Orders : " + data.shipped;
            document.getElementById('out').innerText = "Number Of Orders : " + data.out;
            document.getElementById('complete').innerText = "Number Of Orders : " + data.complete;
            document.getElementById('cancelled').innerText = "Number Of Orders : " + data.cancelled;
            document.getElementById('returned').innerText = "Number Of Orders : " + data.returned;
        })
        .catch(error => {
            console.error("Error fetching data: ", error);
        });
}

// Fetch data every 5 seconds
setInterval(fetchNumber, 5000);

// Fetch data when the page loads
window.onload = fetchNumber;

    </script>
<body>
	<section class="hero-section">
		<h1>Admin Dashboard</h1>
		<p class= "h4">Tracking customer orders</p>
	
	</section>
	<div class="container mt-5">
		<div class="row g-4">

			<div class="col-md-4">
				<div class="card text-center"
					onclick="window.location.href='FetchAOrders?status=ordered'">
					<img src="ordered.png" class="card-img-top" alt="Ordered">
					
					<div class="card-body">
						<h5 id="ordered"></h5>
						<h5 class="card-title">Ordered</h5>
					</div>
				</div>
			</div>
			</a>

			<div class="col-md-4">
				<div class="card text-center"
					onclick="window.location.href='FetchAOrders?status=shipped'">
					<img src="shipped2.jpg" class="card-img-top" alt="Shipped">
					<div class="card-body">
					<h5 id="shipped"></h5>
						<h5 class="card-title">Shipped</h5>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card text-center"
					onclick="window.location.href='FetchAOrders?status=out%20for%20delivery'">
					<img src="out for delivery.png" class="card-img-top"
						alt="Out for Delivery">
					<div class="card-body">
					<h5 id="out"></h5>
						<h5 class="card-title">Out for Delivery</h5>
					</div>
				</div>
			</div>

			<!-- Completed -->
			<div class="col-md-4">
				<div class="card text-center"
					onclick="window.location.href='FetchAOrders?status=complete'">
					<img src="complete.jpg" class="card-img-top" alt="Complete">
					<div class="card-body">
					<h5 id="complete"></h5>
						<h5 class="card-title">Complete</h5>
					</div>
				</div>
			</div>

			<!-- Cancelled -->
			<div class="col-md-4">
				<div class="card text-center"
					onclick="window.location.href='FetchAOrders?status=cancelled'">
					<img src="cancelled.jpg" class="card-img-top" alt="Cancelled">
					<div class="card-body">
					<h5 id="cancelled"></h5>
						<h5 class="card-title">Cancelled</h5>
					</div>
				</div>
			</div>

			<!-- Return -->
			<div class="col-md-4">
				<div class="card text-center"
					onclick="window.location.href='FetchAOrders?status=return'">
					<img src="return.jpg" class="card-img-top" alt="Return">
					<div class="card-body">
					<h5 id="returned"></h5>
					
					<h5 class="card-title">Return</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
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
						
</body>
</html>