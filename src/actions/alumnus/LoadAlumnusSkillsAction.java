package actions.alumnus;

import hibernate.HibernateUtil;

import java.util.ArrayList;
import java.util.Collection;
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
import domain.Skill;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchSkill;

@ResultPath(value="/")
public class LoadAlumnusSkillsAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Collection<Skill> skills = new ArrayList<Skill>();
	
	@SuppressWarnings("rawtypes")
	@Action(value="loadAlumnusSkills", results={
		@Result(name="success", location="result/alumnus/skill/skills.jsp"),
		@Result(name="error", location="result/alumnus/skill/skills.jsp"),
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			long UID =  (Long) httpSession.get("UID");
			skills = DataBase.getSkillsOfAlumnusByAlumnusID(UID);
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch (NoSuchSkill e) {
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

	public Collection<Skill> getSkills() {
		return skills;
	}

	public void setSkills(Collection<Skill> skills) {
		this.skills = skills;
	}
}
