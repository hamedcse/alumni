package actions.alumnus;


import hibernate.HibernateUtil;

import java.util.Map;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;

import util.LoggerUtil;
import util.PersianCalendare;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import database.DataBase;
import domain.Alumnus;
import domain.InboxMessage;
import domain.SentMessage;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchUser;

@ResultPath(value="/")
public class SentMessageAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private String reciversUsername = "";
	private String title;
	private String body;
	@SuppressWarnings("rawtypes")
	@Action(value="sentMessage", results={
		@Result(name="success", location="result/common/result.jsp"),
		@Result(name="error", location="result/common/result.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			long uid =  (Long) httpSession.get("UID");
			
			if (reciversUsername.equalsIgnoreCase("")) {
				if (session != null && session.isOpen())
					session.getTransaction().rollback();
				addActionError(new NoSuchUser().getMessage());
				return ERROR;
			}
			
			String[] recivers = reciversUsername.split(",");
			for (String r : recivers) {
				
				try {
					Alumnus sender = DataBase.getAlumnusByID(uid);
					Alumnus reciver = DataBase.getAlumnusByUsername(r);
					if (sender.getUsername().equalsIgnoreCase(reciver.getUsername())) 
						continue;
					SentMessage sentMessage = new SentMessage();
					InboxMessage inboxMessage = new InboxMessage();
					
					sentMessage.setBody(body);
					sentMessage.setDate(PersianCalendare.getCurrentShamsiDateInLong());
					sentMessage.setIsRead(false);
					sentMessage.setReciverDetail(reciver.getName() + " " + reciver.getFamily());
					sentMessage.setReciverID(reciver.getId());
					sentMessage.setReciverUsername(reciver.getUsername());
					sentMessage.setSenderDetail(sender.getName() + " " +sender.getFamily());
					sentMessage.setSenderID(sender.getId());
					sentMessage.setSenderUsername(sender.getUsername());
					sentMessage.setTime(PersianCalendare.getCurrentTime());
					sentMessage.setTitle(title);
					
					inboxMessage.setBody(body);
					inboxMessage.setDate(PersianCalendare.getCurrentShamsiDateInLong());
					inboxMessage.setIsRead(false);
					inboxMessage.setReciverDetail(reciver.getName() + " " + reciver.getFamily());
					inboxMessage.setReciverID(reciver.getId());
					inboxMessage.setReciverUsername(reciver.getUsername());
					inboxMessage.setSenderDetail(sender.getName() + " " +sender.getFamily());
					inboxMessage.setSenderID(sender.getId());
					inboxMessage.setSenderUsername(sender.getUsername());
					inboxMessage.setTime(PersianCalendare.getCurrentTime());
					inboxMessage.setTitle(title);
					
					DataBase.saveObject(sentMessage);
					DataBase.saveObject(inboxMessage);
					
					//session = HibernateUtil.getSession();
					//session.beginTransaction();
					//session.lock(sender, LockMode.NONE);
					sender.getSentbox().put(sentMessage.getId(), sentMessage);
					//session.getTransaction().commit();
					
					//session = HibernateUtil.getSession();
					//session.beginTransaction();
					//session.lock(reciver, LockMode.NONE);
					reciver.getInbox().put(inboxMessage.getId(), inboxMessage);
					//session.getTransaction().commit();
				} catch(NoSuchUser e){} catch (Exception e) {}
				
			}
			addActionMessage("پیام(های) شما ارسال شد.");
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch (Exception e) {
			if (session != null && session.isOpen())
				session.getTransaction().rollback();
			e.printStackTrace();
			addActionError(e.getMessage());
			LoggerUtil.error(ExceptionUtils.getStackTrace(e), this.getClass().getName());
			return ERROR;
		} finally {
			if (session != null && session.isOpen()){
				session.getTransaction().rollback();
				clearErrorsAndMessages();
				addActionError(new ErrorInSessionException().getMessage());
				return ERROR;
			}
		}
		return SUCCESS;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}

	public String getReciversUsername() {
		return reciversUsername;
	}

	public void setReciversUsername(String reciversUsername) {
		this.reciversUsername = reciversUsername;
	}
}
