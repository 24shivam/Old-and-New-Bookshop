package in.module.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import in.module.dto.User;
import in.module.util.HibernateUtil;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		try {
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userMobile = request.getParameter("user_mobile");
			String userAddress = request.getParameter("user_address");

			// Validations
			if (userName.isEmpty()) {
				out.println("Name is blank");
			}

			// creating user object to store data
			User user = new User(userName, userEmail, userPassword, userMobile, userAddress,"normal");
			
			Session hibernateSession = HibernateUtil.getSession().openSession();
			Transaction trs = hibernateSession.beginTransaction();
			
			int userId=(int) hibernateSession.save(user);
			
			
			
			
			trs.commit();
			hibernateSession.close();
			 
			
			HttpSession httpSession= request.getSession();
			httpSession.setAttribute("message", "Registration Succesfull !!  " );
			
			response.sendRedirect("register.jsp");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
