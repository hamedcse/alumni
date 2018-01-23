package exceptions;

public class TryAgainException extends Exception {
	//Due to null values
	private static final long serialVersionUID = 1L;
	private String message = "لطفا مجددا تلاش نمایید";

	@Override
	public String getMessage() {
		return message;
	}

}
