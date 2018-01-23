package exceptions;

public class NoSuchField extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "رشته ای با مشخصات وارد شده در سیستم ثبت نشده است";

	@Override
	public String getMessage() {
		return message;
	}

}
