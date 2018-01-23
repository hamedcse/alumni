package exceptions;

public class NoSuchWebPageException extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "چنین صفحه ای در سیستم موجود نمی باشد";

	public NoSuchWebPageException() {
		
	}
	
	public NoSuchWebPageException(String message) {
		this.message = message;
	}

	@Override
	public String getMessage() {
		return message;
	}
}
