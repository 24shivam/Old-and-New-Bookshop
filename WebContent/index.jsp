<%@page import="in.module.Dao.CategoryDao"%>
<%@page import="in.module.dto.Product"%>
<%@page import="in.module.dto.Category"%>
<%@page import="java.util.List"%>
<%@page import="in.module.Dao.ProductDao"%>
<%@page import="in.module.util.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>myBook-HOME</title>
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
	<%
		System.out.println("running1");
	%>
	<div class="conatiner-fluid">
		<div class="row mt-3 mx-2">
			<%
				ProductDao dao = new ProductDao(HibernateUtil.getSession());
			List<Product> list = dao.getAllProducts();

			//CategoryDao cdao = new CategoryDao(HibernateUtil.getSession());
			//List<Category> clist = cdao.getCategories();
			%>



			<!--show categories  -->
			<div class='col-md-3'>

				<div class="card border-dark mb-3">
					<div class="card-header">Categories</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item "><a href="#" class="card-link">New
								Books</a></li>
						<li class="list-group-item"><a href="#" class="card-link">Old
								Books</a></li>
					</ul>
				</div>
				<%-- <h1><%=clist.size()%></h1>
				<%
					for (Category c : clist) {

					out.println(c.getCategoryTitle() + "<br>");
				}
				%> --%>

			</div>
			<!-- ==================================================================================== -->
			<div class='col-md-8'>

				<div class="row mt-4 ">

					<div class="col-md-12">

						<div class="card-columns">

							<!-- traving product -->

							<%
								for (Product p : list) {
							%>

							<div class="card product-card mb-3">
								<div class="container text-center">
									<img src="image/books/<%=p.getpPhoto()%>"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top m-2">
								</div>
								<div class="card-body">
									<h5 class="card-title"><%=p.getpName()%></h5>
									<p class="card-text">
										Quantity:
										<%=p.getpQuatity()%></p>
									<p class="card-text">
										Category:
										<%=p.getpType()%></p>

								</div>

								<div class="card-footer text-muted">
									<button class="btn custom-bg text-white"
										onclick="add_to_cart('<%=p.getpName()%>','<%=p.getpPrice()%>')">Add
										to Cart</button>
									<button class="btn btn-success ">
										&#8377;<%=p.getpPrice()%></button>

								</div>
							</div>

							<%
								}
							%>

						</div>


					</div>






				</div>
			</div>


		</div>
	</div>

	<%@ include file="components/common_modals.jsp"%>
	<%@ include file="components/footer.jsp"%>
</body>
</html>