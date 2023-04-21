package in.module.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import in.module.Dao.CategoryDao;
import in.module.Dao.ProductDao;
import in.module.dto.Category;
import in.module.dto.Product;
import in.module.util.HibernateUtil;


@WebServlet("/ProductOperationServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// this servlet acts both operation which is add category and add book
		// fetching category data

		PrintWriter out = response.getWriter();
		String op= request.getParameter("operation");

		if(op.trim().equals("addcategory")) 
		{
			//add category
			
			String title = request.getParameter("catTitle");
			
			Category category=new Category();
			category.setCategoryTitle(title);
			
			//category save to database
			
			CategoryDao categoryDao= new CategoryDao(HibernateUtil.getSession());
			int catId= categoryDao.saveCategory(category);
			 
			
			// message part 
			HttpSession httpSession= request.getSession();
			httpSession.setAttribute("message", "Category Added Succesfully !!  " +catId);
			response.sendRedirect("admin.jsp");
			return;
		}
		else if (op.trim().equals("addbook"))
		{
			//add book
			String pName= request.getParameter("pName");
			String pPrice=request.getParameter("pPrice");
			String pQuatity=request.getParameter("pQuatity");
			String pType= request.getParameter("pType");
			
			//int catId=Integer.parseInt(request.getParameter("catId"));
			
			Part part= request.getPart("pPhoto");
			
			 Product p= new Product();
			p.setpName(pName);
			p.setpPrice(pPrice);
			p.setpQuatity(pQuatity);
			p.setpType(pType);
			p.setpPhoto(part.getSubmittedFileName());
			
			
//			CategoryDao cdao= new CategoryDao(HibernateUtil.getSession());
//			Category category= cdao.getCategoryById(catId);
//			
//			p.setCategory(category);
			
			
			ProductDao pdao=new ProductDao(HibernateUtil.getSession());
			pdao.saveProduct(p);
			
			
			
			String path= request.getRealPath("image")+File.separator+"books"+File.separator+part.getSubmittedFileName();
			System.out.println(path);
			
			
			//uploading code
			
			FileOutputStream fos= new FileOutputStream(path);
			
			InputStream is= part.getInputStream();
			
			byte[] data = new byte[is.available()];
			
			is.read(data);
				
			//writing the data
			fos.write(data);
			fos.close();
			
			
			out.println("book save success");
			
			

			// message part 
			HttpSession httpSession= request.getSession();
			httpSession.setAttribute("message", "Book Added Succesfully !!  " );
			response.sendRedirect("admin.jsp");
			return;
			
		}
		 
	}

}
