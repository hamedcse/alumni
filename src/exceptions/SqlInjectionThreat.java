package exceptions;

public class SqlInjectionThreat extends Exception {
	private static final long serialVersionUID = 1L;
	private String message = "SQL Injection Threat!";

	public SqlInjectionThreat(String string) {
		this.message = this.message +" QUERY= "+ string;
	}

	public SqlInjectionThreat() {

	}

	@Override
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
