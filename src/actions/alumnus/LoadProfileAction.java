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
import domain.Alumnus;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchUser;

@ResultPath(value="/")
public class LoadProfileAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Alumnus alumnus = new Alumnus();
	
	@SuppressWarnings("rawtypes")
	@Action(value="loadProfile", results={
		@Result(name="success", location="result/alumnus/profile/profile.jsp"),
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
			
			alumnus = DataBase.getAlumnusByID(uid);
			
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

	public Alumnus getAlumnus() {
		return alumnus;
	}

	public void setAlumnus(Alumnus alumnus) {
		this.alumnus = alumnus;
	}
}
