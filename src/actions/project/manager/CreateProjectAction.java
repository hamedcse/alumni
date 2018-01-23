package actions.project.manager;


import hibernate.HibernateUtil;

import java.util.Map;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;

import util.LoggerUtil;
import util.PersianCalendare;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import database.DataBase;
import domain.Project;
import domain.ProjectManager;
import exceptions.ErrorInSessionException;

@ResultPath(value="/")
public class CreateProjectAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private String title;
	private String description;
	private String projectCondition;
	private String genderType;
	private String salary;
	private String duration;
	private String place;
	private String category;
	private String field;
	private String college;
	
	@SuppressWarnings("rawtypes")
	@Action(value="createProject", results={
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
			long uid = (Long) httpSession.get("UID");
			
			ProjectManager projectManager = DataBase.getProjectManagerByID(uid);
			
			Project project = new Project();
			project.setIsDeleted(false);
			project.setIsCompleted(false);
			project.setCreationDate(PersianCalendare.getCurrentShamsiDateInLong());
			project.setTitle(title);
			project.setDescription(description);
			project.setProjectCondition(projectCondition);
			project.setGenderType(genderType);
			project.setSalary(salary);
			project.setDuration(duration);
			project.setPlace(place);
			project.setCategory(category);
			project.setField(field);
			project.setCollege(college);
			project.setProjectManager(projectManager);
			session.save(project);
			
			addActionMessage("پروژه با موفقیت ایجاد شد.");
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProjectCondition() {
		return projectCondition;
	}

	public void setProjectCondition(String projectCondition) {
		this.projectCondition = projectCondition;
	}

	public String getGenderType() {
		return genderType;
	}

	public void setGenderType(String genderType) {
		this.genderType = genderType;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}
}
