package exceptions;

public class NoSuchInvitation extends Exception {

	private static final long serialVersionUID = 1L;
	private String message = "دعوتنامه ای با شماره وارد شده موجود نمی باشد";

	@Override
	public String getMessage() {
		return message;
	}

}
