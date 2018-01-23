package exceptions;

public class InvalidActivationInfoException extends Exception {

	private static final long serialVersionUID = 1L;
	private String message = "اطلاعات فعال سازی حساب کاربری اشتباه است";

	@Override
	public String getMessage() {
		return message;
	}

}
