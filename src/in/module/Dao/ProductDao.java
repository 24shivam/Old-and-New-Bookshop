package in.module.Dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import in.module.dto.Product;
import in.module.dto.User;

public class ProductDao {
	private SessionFactory session;

	public ProductDao(SessionFactory session) {
		this.session = session;
	}
	
	public boolean saveProduct(Product product) {
		boolean flag=false;
		try {
			Session session= this.session.openSession();
			
			Transaction trans= session.beginTransaction();
			
			session.save(product);
			
			
			trans.commit();
			session.close();
			flag=true;
			
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			flag= false;
		}
		return flag;
		
		
		
	}
	
	
	public List<Product> getAllProducts(){
		Session s= this.session.openSession();
		Query query=s.createQuery("from Product");
		
		List<Product> list=query.list();
		
		return list;
	}

	 

	public List<Product> searchProductsByName(String name) {
		
	//	List<Product> products=null;
			
			Session s= this.session.openSession();
			Query<Product> query=s.createQuery("from Product where pName=:name ");
			query.setParameter("pname",name);
			
			List<Product> products = query.list();		
			
			s.close();
			return products;
		
	}
}
//	public User getUserByEmailAndPassword(String email,String password) {
//		User user= null;
//		
//		try {
//			
//			String query="from User where userEmail=: e and userPassword=: p";
//			Session session= this.factory.openSession();
//			Query q= session.createQuery(query);
//			q.setParameter("e", email);
//			q.setParameter("p",password);
//			
//			user= (User)((org.hibernate.query.Query) q).uniqueResult();
//			
//			session.close();
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return user;
// 
//
// 
//}
