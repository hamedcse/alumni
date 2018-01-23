package exceptions;

public class BanedUser extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "حساب کاربری شما توسط مدیر به صورت موقت غیر فعال شده است";

	@Override
	public String getMessage() {
		return message;
	}
}
