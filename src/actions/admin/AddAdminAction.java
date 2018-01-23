package actions.admin;


import hibernate.HibernateUtil;

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
import domain.Admin;
import exceptions.ErrorInSessionException;

@ResultPath(value="/")
public class AddAdminAction  extends ActionSupport implements ModelDriven<Admin>  {
	private static final long serialVersionUID = 1L;
	private Admin admin = new Admin();
	
	@Action(value="addAdmin", results={
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
			admin.setIsActive(true);
			admin.setDeleted(false);
			admin.setPassword(new SHA1().getSHA1(" "+admin.getPassword()+" "));
			admin.setRegisterDate(PersianCalendare.getCurrentShamsiDateInLong());
			DataBase.saveObject(admin);
			addActionMessage("مدیر ثبت شد.");
			
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

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	@Override
	public Admin getModel() {
		return admin;
	}

}
