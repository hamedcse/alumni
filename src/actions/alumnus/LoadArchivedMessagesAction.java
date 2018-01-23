package actions.alumnus;


import hibernate.HibernateUtil;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;

import util.LoggerUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import database.DataBase;
import domain.Alumnus;
import domain.ArchivedMessage;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchUser;

@ResultPath(value="/")
public class LoadArchivedMessagesAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Collection<ArchivedMessage> messages = new ArrayList<ArchivedMessage>();
	@SuppressWarnings("rawtypes")
	@Action(value="loadArchivedMessages", results={
		@Result(name="success", location="result/alumnus/messages/archived_messages.jsp"),
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
			
			//session = HibernateUtil.getSession();
			//session.beginTransaction();
			//session.lock(alumnus, LockMode.NONE);
			alumnus.getTrash().values().size();
			messages = alumnus.getTrash().values();
			
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
	public Collection<ArchivedMessage> getMessages() {
		return messages;
	}
	public void setMessages(Collection<ArchivedMessage> messages) {
		this.messages = messages;
	}
}
