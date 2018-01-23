package exceptions;

public class NoSuchResume extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "رزومه ای با مشخصات وارد شده در سیستم ثبت نشده است";

	@Override
	public String getMessage() {
		return message;
	}

}
