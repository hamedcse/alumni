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
import domain.College;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchCollege;

@ResultPath(value="/")
public class LoadCollegesAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Collection<College> colleges = new ArrayList<College>();
	@Action(value="loadColleges", results={
		@Result(name="success", location="result/common/load_colleges/colleges.jsp"),
		@Result(name="error", location="result/common/load_colleges/colleges.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			//Map httpSession = (Map) ActionContext.getContext().get("session");
			colleges = DataBase.getAllColleges();
			clearErrorsAndMessages();
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch (NoSuchCollege e) {
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
	public Collection<College> getColleges() {
		return colleges;
	}
	public void setColleges(Collection<College> colleges) {
		this.colleges = colleges;
	}

}
