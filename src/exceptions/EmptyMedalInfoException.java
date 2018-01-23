package exceptions;

public class EmptyMedalInfoException extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "مقادیر را کامل وارد نکرده اید";

	public EmptyMedalInfoException(String string) {
		this.message = this.message + string;
	}

	public EmptyMedalInfoException() {

	}

	@Override
	public String getMessage() {
		return message;
	}

}
