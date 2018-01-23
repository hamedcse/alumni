package exceptions;

public class LoginException extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "نام کاربری یا کلمه عبور اشتباه می باشد";

	@Override
	public String getMessage() {
		return message;
	}
}
