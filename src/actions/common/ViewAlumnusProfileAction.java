package actions.common;


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
import exceptions.NoSuchAlumnus;
import exceptions.NoSuchUser;

@ResultPath(value="/")
public class ViewAlumnusProfileAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private String aid = "-1";
	private Alumnus alumnus = new Alumnus();
	
	@SuppressWarnings("rawtypes")
	@Action(value="viewAlumnusProfile", results={
		@Result(name="success", location="common_view_alumnus_profile.jsp"),
		@Result(name="error", location="common_view_alumnus_profile.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			long uid = (Long) httpSession.get("UID");
			
			long aidNum = Long.valueOf(aid);
			
			if(aidNum < 1){
				if (session != null && session.isOpen())
					session.getTransaction().rollback();
				addActionError(new NoSuchAlumnus().getMessage());
				return ERROR;
			}
			
			alumnus = DataBase.getAlumnusByID(aidNum);
			
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

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}
}
