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
import domain.Alumnus;
import domain.Project;
import domain.Request;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchUser;

@ResultPath(value="/")
public class CancelSentRequestAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private long rid = -1;
	@SuppressWarnings("rawtypes")
	@Action(value="cancelSentRequest", results={
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
			Request request = alumnus.getSentRequests().get(rid);
			alumnus.getSentRequests().remove(rid);
			request.setIsCancelledBySource(true);
			request.setStatus(3);
			alumnus.getSentRequests().put(rid, request);
			//session.getTransaction().commit();
			
			if (request.getTargetType().equalsIgnoreCase("Job")) {
				Project job = DataBase.getProjectByID(request.getTargetID());
				//session = HibernateUtil.getSession();
				//session.beginTransaction();
				//session.lock(job, LockMode.NONE);
				job.getRecivedRequests().remove(rid);
				//session.getTransaction().commit();
			}/*else if(request.getTargetType().equalsIgnoreCase("Group")){
				Group group = DataBase.getGroupByID(request.getTargetID());
				session = HibernateUtil.getSession();
				session.beginTransaction();
				session.lock(group, LockMode.NONE);
				group.getRecivedRequests().remove(rid);
				//session.getTransaction().commit();
			}*/else if(request.getTargetType().equalsIgnoreCase("Project")){
				Project project = DataBase.getProjectByID(request.getTargetID());
				//session = HibernateUtil.getSession();
				//session.beginTransaction();
				//session.lock(project, LockMode.NONE);
				project.getRecivedRequests().remove(rid);
				//session.getTransaction().commit();
			}
			
			
			addActionMessage("درخواست شما لغو شد.");
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
	public long getRid() {
		return rid;
	}
	public void setRid(long rid) {
		this.rid = rid;
	}
}
