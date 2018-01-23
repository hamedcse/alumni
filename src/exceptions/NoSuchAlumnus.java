package exceptions;

public class NoSuchAlumnus extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "فارغ التحصیلی با مشخصات وارد شده در سیستم ثبت نشده است";

	@Override
	public String getMessage() {
		return message;
	}

}
