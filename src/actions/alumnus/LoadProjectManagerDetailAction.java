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
import domain.ProjectManager;
import exceptions.ProjectManagerSuspendByAdmin;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchProjectManager;

@ResultPath(value="/")
public class LoadProjectManagerDetailAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private ProjectManager projectManager = new ProjectManager();   
	private String pmid = "-1";
	
	@SuppressWarnings("rawtypes")
	@Action(value="loadProjectManagerDetail", results={
		@Result(name="success", location="common_project_manager_detail.jsp"),
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
			
			long projectManagerID = Long.valueOf(pmid);
			if (projectManagerID < 1) {
				if (session != null && session.isOpen())
					session.getTransaction().rollback();
				addActionError(new NoSuchProjectManager().getMessage());
				return ERROR;
			}
			
			projectManager = DataBase.getProjectManagerByID(projectManagerID);
			if(!projectManager.getIsActive()){
				if (session != null && session.isOpen())
					session.getTransaction().rollback();
				addActionError(new ProjectManagerSuspendByAdmin().getMessage());
				return ERROR;
			}
			
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch(NoSuchProjectManager e){
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

	public String getPmid() {
		return pmid;
	}
	public void setPmid(String pmid) {
		this.pmid = pmid;
	}

	public ProjectManager getProjectManager() {
		return projectManager;
	}

	public void setProjectManager(ProjectManager projectManager) {
		this.projectManager = projectManager;
	}


}
