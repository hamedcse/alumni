package actions.alumnus;


import hibernate.HibernateUtil;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

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
import exceptions.ErrorInSessionException;
import exceptions.NoSuchUser;

@ResultPath(value="/")
public class LoadAlumnusProjectsAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Map<Long, Project> projects= new HashMap<Long, Project>();
	
	@SuppressWarnings("rawtypes")
	@Action(value="loadAlumnusProjects", results={
		@Result(name="success", location="result/alumnus/project/alumnus_projects/alumnus_project_list.jsp"),
		@Result(name="error", location="result/common/result.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			long uid = (Long) httpSession.get("UID");
			Alumnus alumnus = DataBase.getAlumnusByID(uid);
			
			//session = HibernateUtil.getSession();
			//session.beginTransaction();
			//session.lock(alumnus, LockMode.NONE);
			alumnus.getProjects().values().size();
			projects = alumnus.getProjects();
			//session.getTransaction().commit();
			
			//session = HibernateUtil.getSession();
			//session.beginTransaction();
			for (Entry<Long, Project> e : projects.entrySet()) {
			    Long key = e.getKey();
			    Project job = e.getValue();
			    //session.lock(job.getProjectManager(), LockMode.NONE);
			    job.getProjectManager().getName();
			    job.setProjectManagerDetail(job.getProjectManager().getName() + " " + job.getProjectManager().getFamily());
			    projects.put(key, job);
			}

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

	public Map<Long, Project> getProjects() {
		return projects;
	}

	public void setProjects(Map<Long, Project> projects) {
		this.projects = projects;
	}
}
