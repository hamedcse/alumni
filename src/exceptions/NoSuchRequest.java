package exceptions;

public class NoSuchRequest extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "درخواستی با مشخصات وارد شده در سیستم ثبت نشده است";

	@Override
	public String getMessage() {
		return message;
	}

}
