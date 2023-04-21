<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign-Up</title>

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
	<div class="container-fluid">
	<div class="row mt-5">
		<div class="col-md-4 offset-md-4">
			<div class="card text-white bg-dark mb-3">
			
			<%@include file='components/message.jsp' %>
			
				<div class="card-body  ">
					<div class='card-header custom-bg text-white'>
						<h3>Sign-Up</h3>
					</div>
					<form action="UserRegisterServlet" method="post">
						<div class="form-group">
							<label for="name">User Name</label> <input name="user_name" type="name"
								class="form-control" id="name" aria-describedby="emailHelp"
								placeholder="Enter here">
						</div>
						<div class="form-group">
							<label for="eamil">User Email</label> <input name="user_email" type="email"
								class="form-control" id="email" aria-describedby="emailHelp"
								placeholder="Enter here">
						</div>
						<div class="form-group">
							<label for="password">User Password</label> <input name="user_password"
								type="password" class="form-control" id="password"
								aria-describedby="emailHelp" placeholder="Enter here">
						</div>
						<div class="form-group">
							<label for="phone">User Mobile</label> <input name="user_mobile" type="number"
								class="form-control" id="phone" aria-describedby="emailHelp"
								placeholder="Enter here">
						</div>
						<div class="form-group">
							<label for="address">User Address</label>
							<textarea name="user_address"style="height: 150px" class="form-control"
								placeholder="Enter your address"></textarea>
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Register</button>
							<button class="btn btn-outline-warning">Reset</button>
						</div>
 
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>