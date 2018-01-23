package exceptions;

public class InvalidMiladiDate extends Exception {

	private static final long serialVersionUID = 1L;
	private String message = "تاریخ میلادی وارد شده، معتبر نمی باشد";

	@Override
	public String getMessage() {
		return message;
	}

}
