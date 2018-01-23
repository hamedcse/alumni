package exceptions;

public class InvalidDate extends Exception {

	private static final long serialVersionUID = 1L;
	private String message = "تاریخ  وارد شده، معتبر نمی باشد";

	@Override
	public String getMessage() {
		return message;
	}

}
