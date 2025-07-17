
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.Agriculture.OBJ.User"%>
<%@ page import="com.Agriculture.OBJ.Order"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Successful</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

        .success-container {
            text-align: center;
            margin-top: 50px;
        }

        .tick-mark {
            width: 400px;
        }

        .table-responsive {
            margin-top: 30px;
        }

        .track-btn {
            margin-top: 20px;
        }
        .progress {
            height: 30px;
        }
        .progress-bar {
            font-size: 1rem;
            font-weight: bold;
        }
        #countdown1 {
            font-size: 2em;
            font-weight: bold;
            color: red;
        }
    </style>
</head>

<body>

    <!-- ✅ Fixed Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="index1.jsp"><img src="logo2.png" alt="Logo"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="index1.jsp">Home</a></li>

                    <% if (session.getAttribute("name") != null && session.getAttribute("name").equals("Admin")) { %>
                        <li class="nav-item"><a class="nav-link" href="GetMessage">Contact</a></li>
                    <% } else { %>
                        <li class="nav-item"><a class="nav-link" href="Message.jsp">Contact</a></li>
                    <% } %>

                    <li class="nav-item"><a class="nav-link" href="aboutus.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="products.jsp">Shop</a></li>
                    <li class="nav-item"><a class="nav-link" href="schemes.jsp">Schemes</a></li>
                    <li class="nav-item"><a class="nav-link" href="generalinfo.jsp">General Info</a></li>
 <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="servicesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Services</a>
            <ul class="dropdown-menu" aria-labelledby="servicesDropdown">
              <li><a class="dropdown-item" href="consultancy.jsp">Consultation</a></li>
              <li><a class="dropdown-item" href="workshop.jsp">Workshops</a></li>
              
            </ul>
          </li>
                    <% if (session.getAttribute("name") != null && session.getAttribute("name").equals("Admin")) { %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin Account</a>
                            <ul class="dropdown-menu" aria-labelledby="adminDropdown">
                                <li><a class="dropdown-item" href="ViewAccount"><i class="bi bi-person-circle"></i> View Accounts</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item btn btn-success" href="Logout"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="aboutus.jsp"><i class="bi bi-cart-check"></i>Check orders</a></li>
                    <% } else { %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="accountDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">My Account</a>
                            <ul class="dropdown-menu" aria-labelledby="accountDropdown">
                                <li><a class="dropdown-item" href="profile.jsp"><i class="bi bi-person-circle"></i> My Profile</a></li>
                                <li><a class="dropdown-item" href="EditPfl.jsp"><i class="bi bi-pencil-square"></i> Edit Profile</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item btn btn-success" href="Logout"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
                            </ul>
                        </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
	<%User user = (User)session.getAttribute("user");
	ArrayList<Order> orderlist =(ArrayList<Order>)session.getAttribute("orderlist");
	int total=0;
	int width=0;
	String status=orderlist.get(0).getStatus();
	String color=null;
	
	switch(orderlist.get(0).getStatus()){
	case "ordered":width=25;color="info"; break;
	case "shipped":width=50;color="primary"; break;
	case "out for delivery":width=75;color="warning"; break;
	case "complete" :width=100;color="success"; break;
	case "cancelled" :width=100;color="danger"; break;
	case "return" :width=100;color="danger"; break;
	case "restock" :width=100;color="danger";status="Returned"; break;
	}
	%>

 
    <!-- ✅ Order Success Section -->
    <div class="container success-container">
        
        <h2 class="text-success mt-3">Tracking Order</h2><br><br>
        <p id="timer">
            Time Remaining: <span id="countdown1">10:00</span>
        </p>
        <div class="progress" role="progressbar" aria-label="Order Tracking" aria-valuenow="<%=width %>" aria-valuemin="0" aria-valuemax="100">
  <div class="progress-bar bg-<%=color %>" style="width: <%=width %>%"><%= status %></div>

         
            </div><br><br>
	
         <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Discounted Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
            <%for(Order od : orderlist){
            	%>
          
                <tr>
                    <td><%=od.getProdName() %></td>
                    <td><%=od.getProdPrice() %></td>
                    <td><%=(od.getProdPrice() - (od.getProdPrice() * 15 / 100)) %></td>
                    <td><%=od.getProdQty() %></td>
                </tr>
             <% total+=od.getTotalAmt();}  %>
            </tbody>
        </table>

        <!-- Total Amount -->
        <div class="text-end">
            <h5>Total :<%=( total - (total * 15 / 100)) %> </h5>
        </div>
		<%if(orderlist.get(0).getStatus()=="ordered"){ %>
        <div class="text-center mt-4">
            <form method="post" action="CancelOrder">
					<input type="hidden" name = "orderId" value ="<%=orderlist.get(0).getOrderId() %>">
				  <button type="submit" class="btn btn-success">Cancel Order</button>
				 </form>
        </div>
        <% }%>
        <%if(orderlist.get(0).getStatus()=="complete"){ %>
        <form method="post" action="UpdateOrders">
				<input type="hidden" name="orderId" value="<%=orderlist.get(0).getOrderId()%>">
				<input type="hidden" name="status" value="return">
				<button type="submit" class="btn btn-success">Return Order</button>
			</form>
        <%} %>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	 <script>
        document.addEventListener("DOMContentLoaded", function () {
            console.log("Timer script loaded...");  

           
            const status = "<%= orderlist.get(0).getStatus() %>"; 

         
            const totalTime = 600;

       
            let timeLeft;
            switch (status) {
                case "ordered":
                    timeLeft = totalTime*0.9; 
                    break;
                case "shipped":
                    timeLeft = totalTime * 0.8; 
                    break;
                case "out for delivery":
                    timeLeft = totalTime * 0.50; 
                    break;
                case "complete":
                    timeLeft = 0.00; 
                    break;
                default:
                    timeLeft = totalTime;
                    break;
            }

            const countdownElement = document.getElementById("countdown1");

            if (!countdownElement) {
                console.error("Countdown element not found!");
                return;
            }

            function updateTimer() {
                let minutes = Math.floor(timeLeft / 60);
                let seconds = timeLeft % 60;

                
                let timeString = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
                countdownElement.innerText = timeString;

                if (timeLeft <= 0) {
                    clearInterval(timerInterval);
                    switch (status) {
                    case "ordered":
                        timeLeft = totalTime; 
                        break;
                    case "shipped":
                        timeLeft = totalTime * 0.8; 
                        break;
                    case "out for delivery":
                        timeLeft = totalTime * 0.50; 
                        break;
                    case "complete":
                        timeLeft = 0.00;
                        break;
                    default:
                        timeLeft = totalTime; 
                        break;
                }
                } else {
                    timeLeft--;
                }
            }

            let timerInterval = setInterval(updateTimer, 1000);
            updateTimer(); 

            console.log("Timer started successfully!");
        });
    </script>
<br>
	<br><br><br>
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