package exceptions;

public class NotAuthorizedToPerformAction extends Exception{
	private static final long serialVersionUID = 1L;
	private String message = "شما مجوز انجام عمل مورد نظر را ندارید";

	@Override
	public String getMessage() {
		return message;
	}

}
