package exceptions;

public class InvalidTokenException extends Exception {

	private static final long serialVersionUID = 1L;
	private String message = "Invalid Token";

	@Override
	public String getMessage() {
		return message;
	}

}
