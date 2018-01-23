package test;

import hibernate.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;

import domain.Alumnus;
import exceptions.NoSuchUser;



public class TestHibernate {

	public static void main(String[] args) {
		Session session = null;
		try{
			session = HibernateUtil.getSession();
			session.beginTransaction();
				Query query = session.createQuery("FROM Alumnus");
				Alumnus result = 	(Alumnus) query.setMaxResults(1).uniqueResult();
			session.getTransaction().commit();
			if(result == null){
				throw new NoSuchUser();
			}
		}catch(NoSuchUser e){
			
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			if (session != null)
				if (session.isOpen())
					session.getTransaction().rollback();
		}
	}

}
