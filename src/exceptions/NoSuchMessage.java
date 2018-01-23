package exceptions;

public class NoSuchMessage extends Exception {

	private static final long serialVersionUID = 1L;
	private String message = "پیامی با مشخصات وارد شده موجود نمی باشد";

	@Override
	public String getMessage() {
		return message;
	}

}
