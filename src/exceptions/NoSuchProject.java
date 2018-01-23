package exceptions;

public class NoSuchProject extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "پروژه ای با مشخصات وارد شده در سیستم ثبت نشده است";

	@Override
	public String getMessage() {
		return message;
	}

}
