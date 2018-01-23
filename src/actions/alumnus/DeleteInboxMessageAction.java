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
import domain.InboxMessage;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchUser;

@ResultPath(value="/")
public class DeleteInboxMessageAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private long iid = -1;
	@SuppressWarnings("rawtypes")
	@Action(value="deleteInboxMessage", results={
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
			InboxMessage inboxMessage = alumnus.getInbox().get(iid);
			alumnus.getInbox().remove(iid);
			//session.getTransaction().commit();
			
			
			
			ArchivedMessage message = new ArchivedMessage();
			message.setBody(inboxMessage.getBody());
			message.setDate(inboxMessage.getDate());
			message.setIsRead(inboxMessage.getIsRead());
			message.setReciverDetail(inboxMessage.getReciverDetail());
			message.setReciverID(inboxMessage.getReciverID());
			message.setReciverUsername(inboxMessage.getReciverUsername());
			message.setSenderDetail(inboxMessage.getSenderDetail());
			message.setSenderID(inboxMessage.getSenderID());
			message.setSenderUsername(inboxMessage.getSenderUsername());
			message.setTime(inboxMessage.getTime());
			message.setTitle(inboxMessage.getTitle());
			message.setArchiveDate(PersianCalendare.getCurrentShamsiDateInLong());
			DataBase.saveObject(message);
			
			//session = HibernateUtil.getSession();
			//session.beginTransaction();
			//session.lock(alumnus, LockMode.NONE);
			alumnus.getTrash().put(message.getId(), message);
			//session.getTransaction().commit();
			
			
			DataBase.deleteObject(inboxMessage);
			
			addActionMessage("پیام دریافتی شما حذف شد.");
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
	public long getIid() {
		return iid;
	}
	public void setIid(long iid) {
		this.iid = iid;
	}
}
