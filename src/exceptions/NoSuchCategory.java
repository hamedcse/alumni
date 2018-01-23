package exceptions;

public class NoSuchCategory extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "موضوعی با مشخصات وارد شده در سیستم ثبت نشده است";

	@Override
	public String getMessage() {
		return message;
	}

}
