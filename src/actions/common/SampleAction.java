package actions.common;

import hibernate.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;

import util.LoggerUtil;

import com.opensymphony.xwork2.ActionSupport;

import database.DataBase;
import domain.shadow.Sample;
import exceptions.ErrorInSessionException;

@ResultPath(value="/")
public class SampleAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private List<Sample> test = new ArrayList<Sample>();
	
	@Action(value="sample", results={
		@Result(name="success", location="result/common/result.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			
			DataBase.saveObject(null);
			
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

	public List<Sample> getTest() {
		return test;
	}

	public void setTest(List<Sample> test) {
		this.test = test;
	}
}
