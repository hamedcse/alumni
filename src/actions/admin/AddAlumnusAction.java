package actions.admin;


import hibernate.HibernateUtil;

import java.util.HashMap;

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
import domain.Alumnus;
import domain.Skill;
import exceptions.ErrorInSessionException;

@ResultPath(value="/")
public class AddAlumnusAction  extends ActionSupport implements ModelDriven<Alumnus>  {
	private static final long serialVersionUID = 1L;
	private String iBirthDate;
	private Alumnus alumnus = new Alumnus();
	
	@Action(value="addAlumnus", results={
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
			alumnus.setIsActive(true);
			alumnus.setDeleted(false);
			alumnus.setPassword(new SHA1().getSHA1(" "+alumnus.getPassword()+" "));
			alumnus.setSkills(new HashMap<Long,Skill>());
			alumnus.setBirthDate(PersianCalendare.getLongValueOfDate(iBirthDate));
			alumnus.setRegisterDate(PersianCalendare.getCurrentShamsiDateInLong());
			DataBase.saveObject(alumnus);
			addActionMessage("فارغ التحصیل ثبت شد.");
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
	public Alumnus getAlumnus() {
		return alumnus;
	}

	public void setAlumnus(Alumnus alumnus) {
		this.alumnus = alumnus;
	}
	
	@Override
	public Alumnus getModel() {
		return alumnus;
	}
	public String getiBirthDate() {
		return iBirthDate;
	}
	public void setiBirthDate(String iBirthDate) {
		this.iBirthDate = iBirthDate;
	}
}
