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
import domain.ArchivedRequest;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchRequest;

@ResultPath(value="/")
public class SearchArchivedRequestsAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Collection<ArchivedRequest> requests = new ArrayList<ArchivedRequest>();
	private String title = "";
	private String sourceDetail = "";
	private String targetDetail = "";
	@SuppressWarnings("rawtypes")
	@Action(value="searchArchivedRequests", results={
		@Result(name="success", location="result/alumnus/requests/search/search_archived_requests.jsp"),
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
				requests = DataBase.getArchivedRequestsOfAlumnusByParameter(uid,title,sourceDetail,targetDetail);
			} catch(NoSuchRequest e){}catch (Exception e) {e.printStackTrace();}
			
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
	public String getSourceDetail() {
		return sourceDetail;
	}
	public void setSourceDetail(String sourceDetail) {
		this.sourceDetail = sourceDetail;
	}
	public String getTargetDetail() {
		return targetDetail;
	}
	public void setTargetDetail(String targetDetail) {
		this.targetDetail = targetDetail;
	}
	public Collection<ArchivedRequest> getRequests() {
		return requests;
	}
	public void setRequests(Collection<ArchivedRequest> requests) {
		this.requests = requests;
	}
}
