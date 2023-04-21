package in.module.Dao;

import java.util.List;

//import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import in.module.dto.Category;

public class CategoryDao {

	private SessionFactory session;

	public CategoryDao(SessionFactory session) {
		this.session = session;
	}

	public int saveCategory(Category cat) {

		Session session = this.session.openSession();
		Transaction trans = session.beginTransaction();
		int catId = (int) session.save(cat);

		trans.commit();
		session.close();

		return catId;

	}

	public List<Category> getCategories() {
		Session s = this.session.openSession();
		Query query = s.createQuery("form Category");
		List<Category> list = query.list();

		return list;
	}
	
//	public Category getCategoryById(int cid) {
//		Category cat=null;
//		try {
//			Session session= this.session.openSession();
//			
//			cat = session.get(Category.class, cid);
//			session.close();
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		return cat;
//	}
	
}
