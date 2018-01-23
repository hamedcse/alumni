package actions.project.manager;


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
import domain.ArchivedRequest;
import domain.Project;
import domain.Request;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchProject;
import exceptions.NoSuchRequest;

@ResultPath(value="/")
public class ApproveRequestForProjectAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	private String rid = "-1";
	private String pid = "-1";
	
	@SuppressWarnings("rawtypes")
	@Action(value="approveRequestForProject", results={
		@Result(name="success", location="project_manager_project_detail.jsp"),
		@Result(name="error", location="project_manager_project_detail.jsp")
	})
	public String execute(){
		Session session = null;
		try {
			LoggerUtil.info("Action started.", this.getClass().getName());
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			long uid =  (Long) httpSession.get("UID");

			long ridNum = Long.valueOf(rid);
			long pidNum = Long.valueOf(pid);
			
			if(ridNum < 1){
				addActionError(new NoSuchRequest().getMessage());
				if (session != null && session.isOpen())
					session.getTransaction().rollback();
				return ERROR;
			}
			
			if(pidNum < 1){
				addActionError(new NoSuchProject().getMessage());
				if (session != null && session.isOpen())
					session.getTransaction().rollback();
				return ERROR;
			}
			
			Request request = DataBase.getRequestByID(ridNum);
			Project project = DataBase.getProjectByID(pidNum);
			
			if(!request.getIsCancelledBySource()){
				Alumnus newMember = DataBase.getAlumnusByID(request.getSourceID());
				newMember.getProjects().put(project.getId(), project);
				session.update(newMember);
				project.getMembers().put(newMember.getId(), newMember);
				request.setUpdationDate(PersianCalendare.getCurrentShamsiDateInLong());
				request.setStatus(1);
				session.update(request);
				ArchivedRequest archivedRequest = new ArchivedRequest(request);
				session.save(archivedRequest);
				project.getArchivedRequests().put(archivedRequest.getId(), archivedRequest);
				project.getRecivedRequests().remove(request.getId());
				session.update(project);
				addActionMessage("درخواست تایید و درخواست کننده به اعضای پروژه افزوده شد.");
			}else{
				project.getRecivedRequests().remove(request.getId());
				session.update(project);
				addActionMessage("این درخواست از طرف ارسال کننده لغو شده است.");
			}
			
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch (NoSuchRequest e) {
			if (session != null && session.isOpen())
				session.getTransaction().rollback();
			addActionError(e.getMessage());
			return ERROR;
		} catch (NoSuchProject e) {
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

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
}
