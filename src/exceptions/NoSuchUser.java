package exceptions;

public class NoSuchUser extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "کاربری با مشخصات وارد شده در سیستم ثبت نشده است";

	@Override
	public String getMessage() {
		return message;
	}

}
