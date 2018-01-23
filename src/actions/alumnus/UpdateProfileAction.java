package actions.alumnus;


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
import domain.Alumnus;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchUser;

@ResultPath(value="/")
public class UpdateProfileAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private String city;
	private String state;
	private String educationLevel;
	private String average;
	private String cellNumber;
	private String married;
	private String aboutMe;
	private String birthDateStr = "";
	private String yearOfGraduationStr = "";
	
	@SuppressWarnings("rawtypes")
	@Action(value="updateProfile", results={
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
			Alumnus tmpAlumnus = DataBase.getAlumnusByID(uid);
			tmpAlumnus.setCity(city);
			tmpAlumnus.setState(state);
			tmpAlumnus.setEducationLevel(educationLevel);
			tmpAlumnus.setAverage(average);
			tmpAlumnus.setMarried(married);
			tmpAlumnus.setAboutMe(aboutMe);
			tmpAlumnus.setBirthDate(PersianCalendare.getLongValueOfDate(birthDateStr));
			tmpAlumnus.setYearOfGraduation(PersianCalendare.getLongValueOfDate(yearOfGraduationStr));
			DataBase.updateObject(tmpAlumnus);
			
			addActionMessage("پروفایل به روز شد.");
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch (NoSuchUser e) {
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

	public String getBirthDateStr() {
		return birthDateStr;
	}

	public void setBirthDateStr(String birthDateStr) {
		this.birthDateStr = birthDateStr;
	}

	public String getYearOfGraduationStr() {
		return yearOfGraduationStr;
	}

	public void setYearOfGraduationStr(String yearOfGraduationStr) {
		this.yearOfGraduationStr = yearOfGraduationStr;
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

	public String getAverage() {
		return average;
	}

	public void setAverage(String average) {
		this.average = average;
	}

	public String getCellNumber() {
		return cellNumber;
	}

	public void setCellNumber(String cellNumber) {
		this.cellNumber = cellNumber;
	}

	public String getMarried() {
		return married;
	}

	public void setMarried(String married) {
		this.married = married;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}
}
