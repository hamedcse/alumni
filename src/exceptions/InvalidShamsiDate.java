package exceptions;

public class InvalidShamsiDate extends Exception {

	private static final long serialVersionUID = 1L;
	private String message = "تاریخ شمسی وارد شده، معتبر نمی باشد";

	@Override
	public String getMessage() {
		return message;
	}

}
