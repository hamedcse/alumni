package exceptions;

public class NoSuchCollege extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "دانشکده ای با مشخصات وارد شده در سیستم ثبت نشده است";

	@Override
	public String getMessage() {
		return message;
	}

}
