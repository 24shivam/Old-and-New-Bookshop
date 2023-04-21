<%@page import="java.util.List"%>
<%@page import="in.module.dto.Category"%>
<%@page import="in.module.util.HibernateUtil"%>
<%@page import="in.module.Dao.CategoryDao"%>
<%@page import="in.module.dto.User"%>
<%
	User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "You are not looged in !!! Login first");
	response.sendRedirect("login.jsp");
	return;

} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin. You can't access this page");
		response.sendRedirect("index.jsp");
		return;
	}
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@ include file="components/common_css_js.jsp"%>
<style>
body {
	background-image: url("image/images.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body >
	<%@ include file="components/Navbar.jsp"%>
	<div class="container admin">
		<div class="container-fluid mt-3">
			<%@ include file="components/message.jsp"%>
		</div>
		<div class='row mt-3'>
			<div class='col-md-6'>
			
				<!-- First col -->
				<div class="card text-white bg-dark mb-3 mb-3">
					<div class="card-body  text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid" alt=""
								src="image/userIcon.png">
						</div>
						<h1>10</h1>
						<h1 class="text-uppercase ">Users</h1>
					</div>
				</div>
			</div>
			
			<!-- seconf col -->
			<div class='col-md-6'>
				<div class="card text-white bg-dark mb-3">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid" alt=""
								src="image/offer.png">
						</div>
						<h1>23</h1>
						<h1 class="text-uppercase ">Books</h1>
					</div>
				</div>

			</div>


		</div>


		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card text-white bg-dark mb-3" data-toggle="modal" data-target="#Categories">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid" alt=""
								src="image/menu.png">
						</div>
						<h1>2</h1>
						<h1 class="text-uppercase ">Categories</h1>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card text-white bg-dark mb-3" data-toggle="modal" data-target="#addproduct">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid" alt=""
								src="image/add-to-basket.png">
						</div>
						<h1>23</h1>
						<h1 class="text-uppercase ">Add Book</h1>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++s-->

	<!-- add products model -->
	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="Categories" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Categories</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">

						<div class='form-group'>
							<input type="text" class="form-control" name="carTitle"
								placeholder='Enter the category of book' required />
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Done</button>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!--End  add products model -->
	<!-- add products model -->
	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="addproduct" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Books</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addbook">


						<div class='form-group'>
							<input type="text" class="form-control" name='pName'
								placeholder='Enter the name of book' />
						</div>
						<div class='form-group'>
							<input type="text" class="form-control" name='pPrice'
								placeholder='Enter the price of book' />
						</div>

						<div class='form-group'>
							<input type="text" class="form-control" name='pQuatity'
								placeholder='Enter the quantity of book' />
						</div>

						<div class='form-group'>
							<input type="text" class="form-control" name='pType'
								placeholder='Enter the Type of book' />
						</div>


						<%-- <% System.out.println("running1"); %> 
							<%   CategoryDao cdao = new CategoryDao(HibernateUtil.getSession());
					   			 List<Category> list = cdao.getCategories();
							%>

<% System.out.println("running2"); %> 

						<div class="form-group">
							<select name="catId" class="form-control" id="">

								<%
									for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

								<%
									}
								%>
<% System.out.println("running3"); %> 
							</select>
						</div> 



<% System.out.println("running4"); %> 
 --%>

						<div class='form-group'>
							<lable for="pPhoto"> Upload photo of book</lable>
							<br> <input type="file" id="pPhoto" name='pPhoto' required />
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Books</button>
						</div>
					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!--End  add products model -->
	<%@ include file="components/common_modals.jsp"%>
	<%@ include file="components/footer.jsp"%>
</body>
</html>