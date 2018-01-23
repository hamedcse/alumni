package Initializing;

import hibernate.HibernateUtil;

import org.hibernate.Session;

import util.PersianCalendare;
import database.DataBase;
import domain.Alumnus;
import domain.InboxMessage;
import domain.SentMessage;



public class Messages {

	public static void main(String[] args) {
		Session session = null;
		try{
			session = HibernateUtil.getSession();
			session.beginTransaction();
			InboxMessage recievedMsg = new InboxMessage();
			recievedMsg.setBody("متن نامه");
			recievedMsg.setDate(PersianCalendare.getCurrentShamsiDateInLong());
			recievedMsg.setIsRead(false);
			recievedMsg.setReciverDetail("حامد قزلباش");
			recievedMsg.setReciverID(1);
			recievedMsg.setReciverUsername("hamed");
			recievedMsg.setSenderDetail("من");
			recievedMsg.setSenderID(2);
			recievedMsg.setSenderUsername("hamed");
			recievedMsg.setTime(PersianCalendare.getCurrentTime());
			recievedMsg.setTitle("عنوان");
			session.save(recievedMsg);
			SentMessage sentMsg = new SentMessage();
			sentMsg.setBody("متن نامه");
			sentMsg.setDate(PersianCalendare.getCurrentShamsiDateInLong());
			sentMsg.setIsRead(false);
			sentMsg.setReciverDetail("حامد قزلباش");
			sentMsg.setReciverID(1);
			sentMsg.setReciverUsername("hamed");
			sentMsg.setSenderDetail("من");
			sentMsg.setSenderID(2);
			sentMsg.setSenderUsername("hamed");
			sentMsg.setTime(PersianCalendare.getCurrentTime());
			sentMsg.setTitle("عنوان");
			session.save(sentMsg);
			Alumnus hamed = DataBase.getAlumnusByUsername("hamed");
			hamed.getInbox().put(recievedMsg.getId(), recievedMsg);
			hamed.getSentbox().put(sentMsg.getId(), sentMsg);
			session.update(hamed);
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
