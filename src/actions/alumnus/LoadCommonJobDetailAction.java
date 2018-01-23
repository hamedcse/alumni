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
import domain.Project;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchProject;

@ResultPath(value="/")
public class LoadCommonJobDetailAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Project job= new Project();
	private long jobID = -1;
	@SuppressWarnings("rawtypes")
	@Action(value="loadCommonJobDetail", results={
		@Result(name="success", location="job_common.jsp"),
		@Result(name="error", location="common_project_search.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			long uid =  (Long) httpSession.get("UID");

			job = DataBase.getProjectByID(jobID);
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch(NoSuchProject e){
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

	public Project getJob() {
		return job;
	}

	public void setJob(Project job) {
		this.job = job;
	}

	public long getJobID() {
		return jobID;
	}

	public void setJobID(long jobID) {
		this.jobID = jobID;
	}

}
