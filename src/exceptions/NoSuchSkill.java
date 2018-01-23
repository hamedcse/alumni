package exceptions;

public class NoSuchSkill extends Exception{
	private static final long serialVersionUID = 1L;
	private String message = "مهارتی با مشخصات وارد شده در سیستم ثبت نشده است";

	@Override
	public String getMessage() {
		return message;
	}

}
