
<%
	User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "You are not looged in !!! Login first to access the checkout page");
	response.sendRedirect("login.jsp");
	return;

}
%>
 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@ include file="components/common_css_js.jsp"%>
<style>
body {
	background-image: url("image/images.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body>
	<%@ include file="components/Navbar.jsp"%>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- card -->
				<div class="card text-black bg-warning mb-3 border-secondary">
					<div class='card-body'>
						<h3 class="text-center mb-5">Your Books</h3>
						<div class='cart-body'></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<!-- customerd details -->
				<div class="card text-black bg-light mb-3 border-secondary">
					<div class='card-body'>
						<h3 class="text-center mb-5">Fill your details for order</h3>
						<form action="#" required>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter  email"
									required>
							</div>
							<div class="form-group">
								<label for="name">Full Name</label> <input type="text"
									class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter your full name" required>
							</div>



							<div class="form-group">
								<label for="inputAddress">Address</label> <input type="text"
									class="form-control" id="inputAddress"
									placeholder="1234 Main St" required>
							</div>

							<div class="form-group">
								<label for="phone">Contact No.</label> <input type="text"
									class="form-control" id="phone" placeholder="+91 767677.."
									required>
							</div>




							<div class="form-group">
								<label class="mr-sm-2" for="Payment">Payment Mode</label> <select
									class="custom-select mr-sm-2" id="payment" required>
									<option selected>Choose mode of payment...</option>
									<option value="1">Cash on delivery</option>
									<option value="2">UPI</option>
									<option value="2">Debit or Credit card</option>
								</select>
							</div>



							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" id="inputCity" required>
								</div>



								<div class="form-group col-md-2">
									<label for="state">State</label> <input type="text"
										class="form-control" id="state" required>
								</div>

								<div class="form-group col-md-2">
									<label for="inputZip">Zip</label> <input type="text"
										class="form-control" id="inputZip" required>
								</div>
							</div>





							<div class="form-group">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="gridCheck"
										required> <label class="form-check-label"
										for="gridCheck"> Check me out </label>
								</div>
							</div>
							<div class='container text-center'>
								<button type="submit" >
									<a href='final.jsp' class="btn btn-success" >Order Now</a>
								</button>
								
								<button type="submit">
									<a href='index.jsp' class="btn btn-primary">Continue
										Shopping</a>
								</button>
							</div>
						</form>

					</div>
				</div>

			</div>
		</div>




	</div>


















	<%@ include file="components/common_modals.jsp"%>
	<%@ include file="components/footer.jsp"%>
</body>
</html>