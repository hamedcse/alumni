package actions.project.manager;


import hibernate.HibernateUtil;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Hibernate;
import org.hibernate.Session;

import util.LoggerUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import database.DataBase;
import domain.Alumnus;
import domain.Project;
import domain.ProjectManager;
import exceptions.ErrorInSessionException;
import exceptions.InvalidDate;
import exceptions.NoSuchProject;
import exceptions.NoSuchUser;

@ResultPath(value="/")
public class ManageProjectAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private long pid = -1;
	private Project project = new Project();
	private Map<Long, Alumnus> members = new  HashMap<Long, Alumnus>();
	private ProjectManager projectManager = new ProjectManager();
	
	@SuppressWarnings("rawtypes")
	@Action(value="manageProject", results={
		@Result(name="success", location="project_manager_project_detail.jsp"),
		@Result(name="error", location="project_manager_project_detail.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			long uid =  (Long) httpSession.get("UID");

			if(pid < 1){
				addActionError(new NoSuchProject().getMessage());
				if (session != null && session.isOpen())
					session.getTransaction().rollback();
				return ERROR;
			}
			
			project = DataBase.getProjectByID(pid);
			Hibernate.initialize(project);
			Hibernate.initialize(project.getRecivedRequests());
			Hibernate.initialize(project.getProjectManager());
			Hibernate.initialize(project.getMembers());
			
			if(project.getProjectManager().getId() != uid){
				addActionError(new NoSuchProject().getMessage());
				if (session != null && session.isOpen())
					session.getTransaction().rollback();
				return ERROR;
			}
			
			members = project.getMembers();
			projectManager = project.getProjectManager(); 
			
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch(InvalidDate e){
			if (session != null && session.isOpen())
				session.getTransaction().rollback();
			addActionError(e.getMessage());
			return ERROR;
		} catch(NoSuchProject e){
			if (session != null && session.isOpen())
				session.getTransaction().rollback();
			addActionError(e.getMessage());
			return ERROR;
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
	public long getPid() {
		return pid;
	}
	public void setPid(long pid) {
		this.pid = pid;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public ProjectManager getProjectManager() {
		return projectManager;
	}
	public void setProjectManager(ProjectManager projectManager) {
		this.projectManager = projectManager;
	}
	public Map<Long, Alumnus> getMembers() {
		return members;
	}
	public void setMembers(Map<Long, Alumnus> members) {
		this.members = members;
	}
}
