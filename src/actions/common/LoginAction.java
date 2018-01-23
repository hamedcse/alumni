package actions.common;

import hibernate.HibernateUtil;

import java.util.Map;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;

import session.SessionManager;
import util.LoggerUtil;
import util.SHA1;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import database.DataBase;
import domain.Admin;
import domain.Alumnus;
import domain.OnlineUser;
import domain.ProjectManager;
import exceptions.BanedUser;
import exceptions.ErrorInSessionException;
import exceptions.LoginException;
import exceptions.NoSuchUser;
import exceptions.TryAgainException;

@ResultPath(value="/")
public class LoginAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private String type;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Action(value="login", results={
		@Result(name="success", location="result/common/result.jsp"),
		@Result(name="alumnus", location="result/alumnus/login/redirect.jsp"),
		@Result(name="admin", location="result/admin/login/redirect.jsp"),
		@Result(name="projectManager", location="result/projectManager/login/redirect.jsp"),
		@Result(name="error", location="result/common/result.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			
			if(type.equalsIgnoreCase("alumnus")){
				Alumnus alumnus = DataBase.getAlumnusByUsername(username);
				if (!alumnus.getIsActive()) {
					throw new BanedUser();
				}
				password = new SHA1().getSHA1(" "+password+" ");
				if(password.equalsIgnoreCase(alumnus.getPassword())){
					httpSession.put("UID", alumnus.getId());
					httpSession.put("TYPE", "Alumnus");
					httpSession.put("UserDetail", alumnus.getName() + " " + alumnus.getFamily());
					SessionManager.add(new OnlineUser(alumnus.getId(), alumnus.getUsername()));
					session.getTransaction().commit();
					LoggerUtil.info("Action suceeded.", this.getClass().getName());
					return "alumnus";
				}
				else {
					throw new LoginException();
				}
			}else if (type.equalsIgnoreCase("admin")) {
				Admin admin = DataBase.getAdminByUsername(username);
				if (!admin.getIsActive()) {
					throw new BanedUser();
				}
				password = new SHA1().getSHA1(" "+password+" ");
				if(password.equalsIgnoreCase(admin.getPassword())){
					httpSession.put("UID", admin.getId());
					httpSession.put("TYPE", "Admin");
					httpSession.put("UserDetail", admin.getName() + " " + admin.getFamily());
					SessionManager.add(new OnlineUser(admin.getId(), admin.getUsername()));
					session.getTransaction().commit();
					LoggerUtil.info("Action suceeded.", this.getClass().getName());
					return "admin";
				}
				else {
					throw new LoginException();
				}
			}else if (type.equalsIgnoreCase("projectManager")) {
				ProjectManager projectManager = DataBase.getProjectManagerByUsername(username);
				if (!projectManager.getIsActive()) {
					throw new BanedUser();
				}
				password = new SHA1().getSHA1(" "+password+" ");
				if(password.equalsIgnoreCase(projectManager.getPassword())){
					httpSession.put("UID", projectManager.getId());
					httpSession.put("TYPE", "ProjectManager");
					httpSession.put("UserDetail", projectManager.getName() + " " + projectManager.getFamily());
					SessionManager.add(new OnlineUser(projectManager.getId(), projectManager.getUsername()));
					session.getTransaction().commit();
					LoggerUtil.info("Action suceeded.", this.getClass().getName());
					return "projectManager";
				}
				else {
					throw new LoginException();
				}
			}else{
				session.getTransaction().rollback();
				addActionError(new TryAgainException().getMessage());
				return ERROR;
			}
		}catch (BanedUser e){
			if (session != null && session.isOpen())
				session.getTransaction().rollback();
			addActionError(e.getMessage());
			return ERROR;
		}catch (NoSuchUser e){
			if (session != null && session.isOpen())
				session.getTransaction().rollback();
			addActionError(e.getMessage());
			return ERROR;
		}catch (LoginException e){
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
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
