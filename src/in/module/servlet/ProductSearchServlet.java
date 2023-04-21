package in.module.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.module.Dao.ProductDao;
import in.module.dto.Product;
import in.module.util.HibernateUtil;

/**
 * Servlet implementation class ProductSearchServlet
 */
@WebServlet("/ProductSearchServlet")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");

		ProductDao p = new ProductDao(HibernateUtil.getSession());

		List<Product> products = p.searchProductsByName(name);
		System.out.println("eeeeeeeeeeeeeeeeeeeeeee111111111111111");
		products.forEach(System.out::println);

		System.out.println("eeeee222222222222222222222222222222222222");

		request.setAttribute("name", name);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/search.jsp");
		dispatcher.forward(request, response);
		response.sendRedirect("search.jsp");
	}

}
