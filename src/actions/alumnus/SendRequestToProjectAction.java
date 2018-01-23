package actions.alumnus;


import hibernate.HibernateUtil;

import java.util.Map;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;

import util.LoggerUtil;
import util.PersianCalendare;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import database.DataBase;
import domain.Alumnus;
import domain.Project;
import domain.Request;
import exceptions.ErrorInSessionException;
import exceptions.InvalidDate;
import exceptions.NoSuchProject;
import exceptions.NoSuchUser;

@ResultPath(value="/")
public class SendRequestToProjectAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private long pid = -1;
	@SuppressWarnings("rawtypes")
	@Action(value="sendRequestToProject", results={
		@Result(name="success", location="result/common/result.jsp"),
		@Result(name="error", location="result/common/result.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			long uid =  (Long) httpSession.get("UID");

			if(pid < 1){
				if (session != null && session.isOpen())
					session.getTransaction().rollback();
				addActionError(new NoSuchProject().getMessage());
				return ERROR;
			}
			
			Alumnus alumnus = DataBase.getAlumnusByID(uid);
			
			Project project = DataBase.getProjectByID(pid);
			
			Request requestForChecking = DataBase.getRequestIfExist(alumnus.getId(), project.getId(),"درخواست عضویت در پروژه");
			
			if(requestForChecking == null){
				Request joinRequestToProject = new Request();
				joinRequestToProject.setTitle("درخواست عضویت در پروژه");
				joinRequestToProject.setSourceID(alumnus.getId());
				joinRequestToProject.setSourceType(Alumnus.class.getSimpleName());
				joinRequestToProject.setSourceStatus("درخواست ارسال شد");
				joinRequestToProject.setSourceDetail(alumnus.getName() + " " + alumnus.getFamily());
				joinRequestToProject.setTargetID(project.getId());
				joinRequestToProject.setTargetType(Project.class.getSimpleName());
				joinRequestToProject.setTargetStatus("بررسی نشده");
				joinRequestToProject.setTargetDetail(project.getTitle());
				joinRequestToProject.setStatus(0);
				joinRequestToProject.setCreationDate(PersianCalendare.getCurrentShamsiDateInLong());
				joinRequestToProject.setIsCancelledBySource(false);
				DataBase.saveObject(joinRequestToProject);
				project.getRecivedRequests().put(joinRequestToProject.getId(), joinRequestToProject);
				DataBase.updateObject(project);
				
				alumnus.getSentRequests().put(joinRequestToProject.getId(), joinRequestToProject);
				DataBase.updateObject(alumnus);
			}
			
			//session = HibernateUtil.getSession();
			//session.beginTransaction();
			//session.lock(job, LockMode.NONE);
			//project.getRecivedRequests().size();
			//session.lock(alumnus, LockMode.NONE);
			//alumnus.getSentRequests().size();
			//session.getTransaction().commit();
			
			addActionMessage("درخواست شما برای پروژه به مدیر پروژه ارسال شد.");
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch(InvalidDate e){
			if (session != null && session.isOpen())
				session.getTransaction().rollback();
			addActionError(e.getMessage());
			return ERROR;
		} catch(NoSuchProject e){
			if (session != null && session.isOpen())
				session.getTransaction().rollback();
			addActionError(e.getMessage());
			return ERROR;
		} catch(NoSuchUser e){
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
	public long getPid() {
		return pid;
	}
	public void setPid(long pid) {
		this.pid = pid;
	}
}
