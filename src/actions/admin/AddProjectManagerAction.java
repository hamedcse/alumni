package actions.admin;


import hibernate.HibernateUtil;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;

import util.LoggerUtil;
import util.PersianCalendare;
import util.SHA1;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import database.DataBase;
import domain.ProjectManager;
import exceptions.ErrorInSessionException;

@ResultPath(value="/")
public class AddProjectManagerAction  extends ActionSupport implements ModelDriven<ProjectManager>  {
	private static final long serialVersionUID = 1L;
	private ProjectManager projectManager = new ProjectManager();
	@Action(value="addProjectManager", results={
		@Result(name="success", location="result/common/result.jsp"),
		@Result(name="error", location="result/common/result.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			//Map httpSession = (Map) ActionContext.getContext().get("session");
			projectManager.setIsActive(true);
			projectManager.setDeleted(false);
			projectManager.setPassword(new SHA1().getSHA1(" "+projectManager.getPassword()+" "));
			projectManager.setRegisterDate(PersianCalendare.getCurrentShamsiDateInLong());
			DataBase.saveObject(projectManager);
			addActionMessage("مدیرپروژه ثبت شد.");
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
	public ProjectManager getProjectManager() {
		return projectManager;
	}
	public void setProjectManager(ProjectManager projectManager) {
		this.projectManager = projectManager;
	}
	@Override
	public ProjectManager getModel() {
		return projectManager;
	}
}
