package actions.common;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value="/")
public class HomeAction  extends ActionSupport  {
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings({ "rawtypes" })
	@Action(value="home", results={
		@Result(name="success", location="index.jsp"),
		@Result(name="alumnus", location="alumnus_panel.jsp"),
		@Result(name="admin", location="admin_panel.jsp"),
		@Result(name="project_manager", location="project_manager_panel.jsp"),
		@Result(name="error", location="index.jsp")
	})
	public String execute(){
		try 
		{
			Map httpSession = (Map) ActionContext.getContext().get("session");
			//long uid = (Long) httpSession.get("UID");
			String type = (String) httpSession.get("TYPE");
			
			if(type == null || type.equalsIgnoreCase("")){
				httpSession.clear();
				clearErrorsAndMessages();
				return ERROR;
			}
			
			if(type.equalsIgnoreCase("alumnus")){
				
				return "alumnus";
			}else if (type.equalsIgnoreCase("admin")) {
				
				return "admin";
			}else if (type.equalsIgnoreCase("projectManager")) {
				
				return "project_manager";
			}else{
				return ERROR;
			}
			
		}catch (Exception e){
			addActionError(e.getMessage());
			e.printStackTrace();
			return ERROR;
		}
	}

	
}
