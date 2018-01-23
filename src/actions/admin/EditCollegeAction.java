package actions.admin;


import hibernate.HibernateUtil;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;

import util.LoggerUtil;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import database.DataBase;
import domain.College;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchCollege;
import exceptions.TryAgainException;

@ResultPath(value="/")
public class EditCollegeAction  extends ActionSupport implements ModelDriven<College>  {
	private static final long serialVersionUID = 1L;
	private College college = new College();
	private long collegeID = -1;
	@Action(value="editCollege", results={
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
			College tmpCollege = DataBase.getCollegeByID(collegeID);
			tmpCollege.setName(college.getName());
			tmpCollege.setDescription(college.getDescription());
			DataBase.updateObject(tmpCollege);
			addActionMessage("اطلاعات دانشکده  انتخاب شده، به روز شد.");
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch(NoSuchCollege e){
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
	public long getCollegeID() {
		return collegeID;
	}
	public void setCollegeID(long collegeID) {
		this.collegeID = collegeID;
	}
	public College getCollege() {
		return college;
	}
	public void setCollege(College college) {
		this.college = college;
	}
	@Override
	public College getModel() {
		return college;
	}
}
