package exceptions;

public class InvalidPrice extends Exception {

	private static final long serialVersionUID = 1L;
	private String message = "قیمت پیشنهادی معتبر نمی باشد";

	@Override
	public String getMessage() {
		return message;
	}

}
