package actions.admin;


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
import domain.Field;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchField;

@ResultPath(value="/")
public class LoadFieldsForAdminAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Collection<Field> fields = new ArrayList<Field>();
	@Action(value="loadFieldsForAdmin", results={
		@Result(name="success", location="result/admin/manage_fields/fields.jsp"),
		@Result(name="error", location="result/admin/manage_fields/fields.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			//Map httpSession = (Map) ActionContext.getContext().get("session");
			fields = DataBase.getAllFields();
			clearErrorsAndMessages();
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch (NoSuchField e) {
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
	public Collection<Field> getFields() {
		return fields;
	}
	public void setFields(Collection<Field> fields) {
		this.fields = fields;
	}
}
