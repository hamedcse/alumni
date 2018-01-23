package exceptions;

public class NoSuchProjectManager extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "مدیر پروژه ای با مشخصات وارد شده در سیستم ثبت نشده است";

	@Override
	public String getMessage() {
		return message;
	}

}
