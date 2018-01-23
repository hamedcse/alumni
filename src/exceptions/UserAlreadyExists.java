package exceptions;

public class UserAlreadyExists extends Exception{

	private static final long serialVersionUID = 1L;
	private String message = "نام کاربری انتخاب شده تکراری می باشد";

	@Override
	public String getMessage() {
		return message;
	}

}
