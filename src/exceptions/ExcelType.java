package exceptions;

public class ExcelType extends Exception {

	private static final long serialVersionUID = 1L;
	private String message = "پسوند فایل انتخاب شده باید xls باشد";

	@Override
	public String getMessage() {
		return message;
	}

}
