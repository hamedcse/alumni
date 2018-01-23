package Initializing;

import hibernate.HibernateUtil;

import org.hibernate.Session;

import domain.Category;
import domain.Field;



public class CatsAndFields {

	public static void main(String[] args) {
		Session session = null;
		try{
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Category category1 = new Category();
			category1.setDescription("موضوعات عمومی");
			category1.setName("عمومی");
			session.save(category1);
			Field field1 = new Field();
			field1.setName("مهندسی کامپیوتر");
			field1.setOrientation("نرم افزار");
			session.save(field1);
			session.getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			if (session != null)
				if (session.isOpen())
					session.getTransaction().rollback();
		}
	}

}
