<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.Agriculture.OBJ.Product"%>
<!doctype html>
<html lang="en">
<head>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setHeader("Expires", "0"); // Proxies

if (session.getAttribute("uname") == null) {
    response.sendRedirect("login.jsp");
}
%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<!-- Corrected Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
	background-color: #28a745;
	color: white;
	border-radius: 20px;
	padding: 5px 20px;
	border: none;
	transition: background-color 0.3s;
}

.btn-custom:hover {
	background-color: #218838;
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

#shopnow {
	width: 200px;
	height: 800px;
}

.carousel-item img {
	max-height: 80vh;
	object-fit: cover;
}

.carousel-caption h1, .carousel-caption p {
	background: rgba(0, 0, 0, 0.5);
	padding: 10px;
	border-radius: 5px;
}

.carousel-caption h1 {
	font-size: calc(1.5rem + 1vw);
}

.carousel-caption p {
	font-size: calc(1rem + 0.5vw);
}

  </style>

	<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="index1.jsp"><img src="logo2.png" alt="Logo"></a>
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
          <%
    }
%>
   
        </ul>
      </div>
    </div>
  </nav>
  

	<!-- Corrected Bootstrap 5 JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script type="text/javascript">
var count = 1;

function showQuantityForm1(button, productName) {
    count++;

    const parentContainer = button.closest('.card-body');

    let existingForm = parentContainer.querySelector('#quantity-form');
    
    if (existingForm) {
        if (count % 2 !== 0) {
            existingForm.remove();
        }
        return; 
    }

    if (count % 2 === 0) {
        const productInput = document.createElement('input');
        productInput.type = 'hidden';
        productInput.name = 'productName';
        productInput.value = productName;

        const form = document.createElement('form');
        form.id = 'quantity-form';
        form.method = 'POST';
        form.action = 'IncreaseQty';
        form.className = 'mt-3';

        const quantityInput = document.createElement('input');
        quantityInput.type = 'number';
        quantityInput.name = 'quantity';
        quantityInput.placeholder = 'Enter quantity';
        quantityInput.className = 'form-control mb-2';
        quantityInput.required = true;
        quantityInput.min = '1';

        const submitButton = document.createElement('button');
        submitButton.type = 'submit';
        submitButton.className = 'btn btn-primary';
        submitButton.textContent = 'Submit';

        form.appendChild(productInput);
        form.appendChild(quantityInput);
        form.appendChild(submitButton);

        parentContainer.appendChild(form);
    }
}

function showQuantityForm(button, productName) {
    var formContainer = button.closest('.card-body').querySelector('.quantity-form-container');
    
    // Toggle visibility of the quantity form
    if (formContainer.style.display === 'none' || formContainer.style.display === '') {
        formContainer.style.display = 'block';
    } else {
        formContainer.style.display = 'none';
    }
}


</script>
</head>
<body>
<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="3" aria-label="Slide 4"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="shopnow3.jpg" class="d-block w-100" alt="Organic Products">
					<div class="carousel-caption d-none d-md-block">
					<h1 style="background-color: black;">"Unlock Better Health
						with Authentic Organic Products"</h1>
					<p style="background-color: rgb(147, 35, 35);">Shop now!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="spnow.jpg" class="d-block w-100" alt="Second Slide">
				
			</div>
			<div class="carousel-item">
				<img src="spnow2.jpeg" class="d-block w-100" alt="Third Slide">
				
			</div>
			<div class="carousel-item">
				<img src="spnow3.jpeg" class="d-block w-100" alt="Fourth Slide">
				
			</div>
		</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<br>
	<br>
	<p class="h1" style="text-align: center;">
		<u>OUR ECO-FRIENDLY PRODUCTS</u>
	</p>
	<br>
	<br>
	<%
	ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("productList");
	%>
	<div class="container p-0">
		<div class="row no-gutters">
			<%!int discount = 20;%>
			<%
			if (productList != null) {
				for (Product product : productList) {
			%>
			<div class="col-md-6 mb-4">
				<div class="card h-100 border-0">
					<div class="row g-0">
						<div class="col-md-6">
							<img src=" pic/products/<%=product.getPic()%>" class="img-fluid rounded-start"
								alt="Organic Jowar" style="height: 300px;">
						</div>
						<div class="col-md-6">
							<div class="card-body p-1 mt-3">
								<h5 class="card-title"><%=product.getName()%></h5>
								<p class="card-text"><%=product.getInfo()%></p>
								<p>
									<span class="a-price-symbol">₹</span><s><%=product.getPrice()%>/-</s>
								</p>
								<p class="h3">
									<span class="a-price-symbol">₹</span><%=(product.getPrice() - (product.getPrice() * discount / 100))%>/-
								</p>
								<%
								 if(session.getAttribute("name") != null && session.getAttribute("name").equals("Admin")) {
								%>
								<p class="card-text">Current Quantity : <%=product.getQty() %></p>
								<button onclick="showQuantityForm1(this, '<%=product.getName()%>')"class="btn btn-info">AddQuantity</button>
								<%
								} else {
								%>
								  <button onclick="showQuantityForm(this, '<%=product.getName()%>')" class="btn btn-info">Add to Cart</button>
                                    
									<a href="#"class="btn btn-success">Buy now</a>
                                <div class="quantity-form-container mt-3" style="display:none;">
                                    <form action="AddToCart" method="POST">
                                        <input type="hidden" name="prodId" value="<%=product.getId()%>">
                                        <input type="hidden" name="price" value="<%=product.getPrice()%>">
                                       <%
                                          int uid = (int) session.getAttribute("uid");
                                          if (uid !=0) {
                                         %>
                                           <input type="hidden" name="uid" value="<%= uid %>">
                                         <%
                                          }
                                          %>
                                        <input type="number" name="qty" class="form-control mb-2" placeholder="Enter Quantity" min="1" required>
                                        <button type="submit" class="btn btn-primary">Add</button>
                                        
                                    </form>
                                </div>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>


<div class="text-center py-5"
		style="background-color: rgb(153, 11, 11);">
		<p class="h1 text-white">"NATURE'S BEST OFFERINGS!"</p>
		<p class="h4 text-white">-Stay healthier and Stay fit.</p>
	</div>
	<br>
<br>
<body>

	<br>
	<br>
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
</body>
</html>

