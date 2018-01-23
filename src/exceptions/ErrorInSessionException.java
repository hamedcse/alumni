package exceptions;

public class ErrorInSessionException extends Exception {
	//Due to null values
	private static final long serialVersionUID = 1L;
	private String message = "مشکلی در انجام تراکنش(ها) وجود دارد، لطفا مجددا تلاش نمایید.";

	@Override
	public String getMessage() {
		return message;
	}

}
