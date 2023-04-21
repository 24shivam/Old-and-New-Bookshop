package in.module.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.module.Dao.UserDao;
import in.module.dto.User;
import in.module.util.HibernateUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		try {

			
			
			String email=request.getParameter("email");
			String password= request.getParameter("password");
			
			
			//authentication user
			 UserDao userDao= new UserDao(HibernateUtil.getSession());
			 User user = userDao.getUserByEmailAndPassword(email, password);
			//System.out.println(user);
			 
			 
				HttpSession httpSession= request.getSession();
				
			 if(user == null) {
				 
				 httpSession.setAttribute("message", "Invalid details !! Try with another one  " );
				 response.sendRedirect("login.jsp");
				return;
				 
			 }else {
				
				 
				 out.println("<h1>Welcome "+user.getUserName()+"</h1");
				 //we use  session to store login data 
				 
				 httpSession.setAttribute("current-user", user);
				 
				 
				 if(user.getUserType().equals("admin")) 
				 {
					 //admin.jsp
					 response.sendRedirect("admin.jsp");
				 }
				 else if(user.getUserType().equals("normal"))
				 {
					 //normal.jsp
					 response.sendRedirect("normal.jsp");
				 }
				 else 
				 {
					 out.println(" we have not identifies user type");
				 }
				 
			 }
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
