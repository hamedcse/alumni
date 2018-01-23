package actions.admin;


import hibernate.HibernateUtil;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;

import util.LoggerUtil;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import database.DataBase;
import domain.Category;
import exceptions.ErrorInSessionException;
import exceptions.NoSuchCategory;

@ResultPath(value="/")
public class EditCategoryAction  extends ActionSupport implements ModelDriven<Category>  {
	private static final long serialVersionUID = 1L;
	private Category category = new Category();
	private long categoryID = -1;
	@Action(value="editCategory", results={
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
			Category tmpCategory = DataBase.getCategoryByID(categoryID);
			tmpCategory.setName(category.getName());
			tmpCategory.setDescription(category.getDescription());
			DataBase.updateObject(tmpCategory);
			addActionMessage("اطلاعات موضوع  انتخاب شده، به روز شد.");
			session.getTransaction().commit();
			LoggerUtil.info("Action suceeded.", this.getClass().getName());
		} catch(NoSuchCategory e){
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
	public long getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(long categoryID) {
		this.categoryID = categoryID;
	}
	@Override
	public Category getModel() {
		return category;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}
