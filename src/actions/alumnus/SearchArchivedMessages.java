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
import domain.ArchivedMessage;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchMessage;

@ResultPath(value="/")
public class SearchArchivedMessages  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Collection<ArchivedMessage> trash = new ArrayList<ArchivedMessage>();
	private String titleAndBoby = "";
	private String sender = "";
	private String reciver = "";
	@Action(value="searchArchiveMessages", results={
		@Result(name="success", location="result/alumnus/messages/search_archive/archived_messages.jsp"),
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
			
			try {
				trash = DataBase.getArchivedMessagesOfAlumnusByParameter(uid, titleAndBoby, sender, reciver);
			} catch(NoSuchMessage e){} catch (Exception e) {}
			
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
	public String getTitleAndBoby() {
		return titleAndBoby;
	}
	public void setTitleAndBoby(String titleAndBoby) {
		this.titleAndBoby = titleAndBoby;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReciver() {
		return reciver;
	}
	public void setReciver(String reciver) {
		this.reciver = reciver;
	}
	public Collection<ArchivedMessage> getTrash() {
		return trash;
	}
	public void setTrash(Collection<ArchivedMessage> trash) {
		this.trash = trash;
	}
}
