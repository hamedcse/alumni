package actions.common;

import java.util.Map;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import session.SessionManager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value="/")
public class LogoutAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings({"rawtypes" })
	@Action(value="logout", results={
		@Result(name="success", location="result/common/logout/redirect.jsp"),
		@Result(name="error", location="result/common/result.jsp")
	})
	public String execute(){
		try 
		{
			Map httpSession = (Map) ActionContext.getContext().get("session");
			SessionManager.remove((Long) httpSession.get("UID"));
			httpSession.clear();
			return SUCCESS;
		}catch (Exception e){
			addActionError(e.getMessage());
			e.printStackTrace();
			return ERROR;
		}
	}
}
