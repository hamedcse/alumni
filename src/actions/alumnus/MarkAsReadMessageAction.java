package actions.alumnus;


import hibernate.HibernateUtil;

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
import domain.ArchivedMessage;
import domain.InboxMessage;
import domain.SentMessage;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchMessage;

@ResultPath(value="/")
public class MarkAsReadMessageAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private long mid = -1;
	private String type = "";
	@SuppressWarnings("rawtypes")
	@Action(value="markMessageAsRead", results={
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
			
			if (type.equalsIgnoreCase("sentbox")) {
				SentMessage message = DataBase.getSentMessageByID(mid);
				if (!message.getIsRead()) {
					message.setIsRead(true);
					DataBase.updateObject(message);
				}
			}else if(type.equalsIgnoreCase("inbox")) {
				InboxMessage message = DataBase.getInboxMessageByID(mid);
				if (!message.getIsRead()) {
					message.setIsRead(true);
					DataBase.updateObject(message);
				}
			}else if(type.equalsIgnoreCase("trash")){
				ArchivedMessage message = DataBase.getArchivedMessageByID(mid);
				if (!message.getIsRead()) {
					message.setIsRead(true);
					DataBase.updateObject(message);
				}
			}
			
			
			clearErrorsAndMessages();
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch(NoSuchMessage e){
			if (session != null && session.isOpen())
				session.getTransaction().rollback();
			//addActionError(e.getMessage());
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
	public long getMid() {
		return mid;
	}
	public void setMid(long mid) {
		this.mid = mid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
