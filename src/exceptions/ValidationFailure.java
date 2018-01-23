package exceptions;

public class ValidationFailure extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "اطلاعات وارد شده مناسب نیستند، لطفا برای دیدن جزییات خطا 'جاوا اسکریپت' مرورگر خود را فعال نمایید";

	public ValidationFailure(String string) {
		this.message = this.message + string;
	}

	public ValidationFailure() {

	}

	@Override
	public String getMessage() {
		return message;
	}

}
