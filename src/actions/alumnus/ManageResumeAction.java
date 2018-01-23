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
import com.opensymphony.xwork2.ModelDriven;

import database.DataBase;
import domain.Alumnus;
import domain.Resume;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchResume;
import exceptions.NoSuchUser;
import exceptions.TryAgainException;

@ResultPath(value="/")
public class ManageResumeAction  extends ActionSupport implements ModelDriven<Resume>  {
	private static final long serialVersionUID = 1L;
	private Resume resume = new Resume();
	
	@SuppressWarnings("rawtypes")
	@Action(value="manageResume", results={
		@Result(name="success", location="result/common/result.jsp"),
		@Result(name="error", location="result/common/result.jsp"),
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			long UID =  (Long) httpSession.get("UID");
			Alumnus alumnus  = DataBase.getAlumnusByID(UID);
			
			try {
				Resume tmpResume = DataBase.getResumeByAlumnusID(UID);
				resume.setId(tmpResume.getId());
				DataBase.updateObject(resume);
				addActionMessage("رزومه شما به روز رسانی شد.");
			} catch (NoSuchResume e) {
				resume.setAlumnus(alumnus);
				DataBase.saveObject(resume);
				addActionMessage("رزومه شما ثبت شد.");
			} catch (Exception e) {
				if (session != null && session.isOpen())
					session.getTransaction().rollback();
				addActionError(new TryAgainException().getMessage());
				return ERROR;
			}
			
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

	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	@Override
	public Resume getModel() {
		return resume;
	}
}
