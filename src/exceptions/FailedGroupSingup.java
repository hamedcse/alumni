package exceptions;

public class FailedGroupSingup extends Exception {

	private static final long serialVersionUID = 1L;
	private String message = "ثبت نام تعدادی از کاربران با موفقیت صورت نپذیرفت";

	@Override
	public String getMessage() {
		return message;
	}

}
