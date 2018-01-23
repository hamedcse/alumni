package actions.common;


import hibernate.HibernateUtil;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;

import util.LoggerUtil;

import com.opensymphony.xwork2.ActionSupport;

import domain.Alumnus;
import exceptions.ErrorInSessionException;

@ResultPath(value="/")
public class LoadAlumnusListForSendMessageAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private Map<Long, Alumnus> alumnusList = new HashMap<Long, Alumnus>();
	@Action(value="loadAlumnusListForSendMessage", results={
		@Result(name="success", location="result/common/alumnus_list/for_sent_message/alumnus_list.jsp"),
		@Result(name="error", location="result/common/result.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			/*Map httpSession = (Map) ActionContext.getContext().get("session");
			long uid =  (Long) httpSession.get("UID");
			
			Alumnus alumnus = DataBase.getAlumnusByID(uid);
			
			alumnusList = DataBase.getAlumnusListForSentMessage();
			alumnusList.remove(alumnus.getId());
			
			*/
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

	public Map<Long, Alumnus> getAlumnusList() {
		return alumnusList;
	}

	public void setAlumnusList(Map<Long, Alumnus> alumnusList) {
		this.alumnusList = alumnusList;
	}

}
