package exceptions;

public class ProjectManagerSuspendByAdmin extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "حساب کاربری مدیر پروژه انتخاب شده توسط مدیر سامانه موقتا غیر فعال شده است";

	@Override
	public String getMessage() {
		return message;
	}

}
