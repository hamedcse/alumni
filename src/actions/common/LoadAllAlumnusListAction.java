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
public class LoadAllAlumnusListAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Collection<Alumnus> activeAlumnusList = new ArrayList<Alumnus>();
	private Collection<ArchivedAlumnus> archivedAlumnusList = new ArrayList<ArchivedAlumnus>();
	
	@Action(value="loadAllAlumnusList", results={
		@Result(name="success", location="result/common/search_alumnus_list/all_alumnus_list.jsp"),
		@Result(name="error", location="result/common/search_alumnus_list/result_list.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			activeAlumnusList = DataBase.getAllAlumnusList();
			//archivedAlumnusList = DataBase.getAllArchivedAlumnusList();
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
}
