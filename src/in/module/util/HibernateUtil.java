package in.module.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

	// private static Session session = null;
	private HibernateUtil() {
	}
	private static SessionFactory factory;

	public static SessionFactory getSession() {
		
		try{
			if (factory == null) {
				factory = new Configuration().configure ("hibernate.cfg.xml").buildSessionFactory();
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return factory;
	}

	 
}
