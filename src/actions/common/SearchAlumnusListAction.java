package actions.common;


import hibernate.HibernateUtil;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;

import util.LoggerUtil;

import com.opensymphony.xwork2.ActionSupport;

import database.DataBase;
import domain.Alumnus;
import domain.parent.ArchivedAlumnus;
import exceptions.ErrorInSessionException;

@ResultPath(value="/")
public class SearchAlumnusListAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Collection<Alumnus> activeAlumnusList = new ArrayList<Alumnus>();
	private Collection<ArchivedAlumnus> archivedAlumnusList = new ArrayList<ArchivedAlumnus>();
	private String name;
	private String family;
	private String yearOfGraduation;
	private String field;
	private String college;
	private String city;
	private String state;
	private String educationLevel;
	
	@Action(value="searchAlumnusList", results={
		@Result(name="success", location="result/common/search_alumnus_list/result_list.jsp"),
		@Result(name="error", location="result/common/search_alumnus_list/result_list.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			activeAlumnusList = DataBase.getAlumnusListBySearchParam(name, family, yearOfGraduation, field, college, city, state, educationLevel);
			//archivedAlumnusList = DataBase.getArchivedAlumnusListBySearchParam(name, family, yearOfGraduation, field, college, city, state, educationLevel);
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

	public Collection<Alumnus> getActiveAlumnusList() {
		return activeAlumnusList;
	}

	public void setActiveAlumnusList(Collection<Alumnus> activeAlumnusList) {
		this.activeAlumnusList = activeAlumnusList;
	}

	public Collection<ArchivedAlumnus> getArchivedAlumnusList() {
		return archivedAlumnusList;
	}

	public void setArchivedAlumnusList(
			Collection<ArchivedAlumnus> archivedAlumnusList) {
		this.archivedAlumnusList = archivedAlumnusList;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFamily() {
		return family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	public String getYearOfGraduation() {
		return yearOfGraduation;
	}

	public void setYearOfGraduation(String yearOfGraduation) {
		this.yearOfGraduation = yearOfGraduation;
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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getEducationLevel() {
		return educationLevel;
	}

	public void setEducationLevel(String educationLevel) {
		this.educationLevel = educationLevel;
	}
}
