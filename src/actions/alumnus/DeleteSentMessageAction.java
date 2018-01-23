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
import domain.ArchivedMessage;
import domain.SentMessage;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchUser;

@ResultPath(value="/")
public class DeleteSentMessageAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private long sid = -1;
	@SuppressWarnings("rawtypes")
	@Action(value="deleteSentMessage", results={
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
			
			Alumnus alumnus = DataBase.getAlumnusByID(uid);
			
			//Request request = DataBase.getRequestByID(rid);
			
			//session = HibernateUtil.getSession();
			//session.beginTransaction();
			//session.lock(alumnus, LockMode.NONE);
			SentMessage sentMessage = alumnus.getSentbox().get(sid);
			alumnus.getSentbox().remove(sid);
			//session.getTransaction().commit();
			
			
			
			ArchivedMessage message = new ArchivedMessage();
			message.setBody(sentMessage.getBody());
			message.setDate(sentMessage.getDate());
			message.setIsRead(sentMessage.getIsRead());
			message.setReciverDetail(sentMessage.getReciverDetail());
			message.setReciverID(sentMessage.getReciverID());
			message.setReciverUsername(sentMessage.getReciverUsername());
			message.setSenderDetail(sentMessage.getSenderDetail());
			message.setSenderID(sentMessage.getSenderID());
			message.setSenderUsername(sentMessage.getSenderUsername());
			message.setTime(sentMessage.getTime());
			message.setTitle(sentMessage.getTitle());
			message.setArchiveDate(PersianCalendare.getCurrentShamsiDateInLong());
			DataBase.saveObject(message);
			
			//session = HibernateUtil.getSession();
			//session.beginTransaction();
			//session.lock(alumnus, LockMode.NONE);
			alumnus.getTrash().put(message.getId(), message);
			//session.getTransaction().commit();
			
			
			DataBase.deleteObject(sentMessage);
			
			addActionMessage("پیام ارسالی شما حذف شد.");
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch(NoSuchUser e){
			if (session != null && session.isOpen())
				session.getTransaction().rollback();
			addActionError(e.getMessage());
			return ERROR;
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
	public long getSid() {
		return sid;
	}
	public void setSid(long sid) {
		this.sid = sid;
	}
}
