package  util;

import java.math.BigDecimal;
import java.util.regex.Pattern;

import exceptions.InvalidTokenException;
import exceptions.SqlInjectionThreat;
import exceptions.ValidationFailure;


public class Validator {

	private static String regexInt = "\\A\\d+\\Z";
	// private static String regexMoney = "\\A\\d+(?:[.,]\\d{1,3})?\\Z";
	// private static String regexFarsiName = "\\A[آا-ی]+[آا-ی - ]*\\Z"; old one
	private static String regexFarsiWithSpace = "\\A[آا-ی]+[آا-ی -  ئ]*\\Z";
	private static String regexUsername = "\\A[a-zA-Z]+[a-zA-Z]+[a-zA-Z]+\\d*[a-zA-Z0-9]*\\Z";
	private static String regexEmail = "\\A[\\d!#$%&'*+./=?_`a-zA-Z{|}~^-]++@[\\d.a-zA-Z-]+\\.[a-zA-Z]{2,6}\\Z";
	// private static String regexGameName = "\\A[آا-ی]+[آا-ی - ]*.*\\Z";
	private static String regexGameTime = "\\A\\d\\d:\\d\\d\\Z";

	public Validator() {

	}

	public static void validateSignup(String username, String password,
			String name, String family, String birthDate, String gender,
			String educationLevel, String howIMetIrvex, String email)
			throws ValidationFailure {

		if ((username.equals("")) || (password.equals("")) || (name.equals(""))
				|| (family.equals("")) || (birthDate.equals(""))
				|| (gender.equals("")) || (educationLevel.equals(""))
				|| (howIMetIrvex.equals("")) || (email.equals("")))
			throw new ValidationFailure();
		
		if (!Pattern.matches(regexUsername, username))
			throw new ValidationFailure("");
		
		if (!Pattern.matches(regexFarsiWithSpace, name))
			throw new ValidationFailure();
		
		if (!Pattern.matches(regexFarsiWithSpace, family))
			throw new ValidationFailure();
		
		if (!Pattern.matches(regexEmail, email))
			throw new ValidationFailure();
		
		if (name.length() > 15)
			throw new ValidationFailure();
		
		if (family.length() > 25)
			throw new ValidationFailure();
		
		if (password.length() > 40)
			throw new ValidationFailure();
		
		if (username.length() > 25)
			throw new ValidationFailure();
		
		if (email.length() > 80)
			throw new ValidationFailure();
	}

	public static void validateBuyOrSell(String symbol, double price,
			long shares) throws ValidationFailure {

		if ((price <= 0) || (symbol.equals("")) || (shares <= 0))
			throw new ValidationFailure();
		if (String.valueOf(shares).length() > 9)
			throw new ValidationFailure();
		/*
		 * if (!Pattern.matches(regexMoney, String.valueOf(price))) throw new
		 * ValidationFailure();
		 */
		if (!Pattern.matches(regexInt, String.valueOf(shares)))
			throw new ValidationFailure();
	}

	public static void validateCreateGame(String name, BigDecimal initialMoney,
			String startDate, String endDate, String startTime, String endTime, String buyLimitationPercent)
			throws ValidationFailure {

		if ((name.equals("")) || (String.valueOf(initialMoney).equals(""))
				|| (startDate.equals("")) || (endDate.equals(""))
				|| (startTime.equals("")) || (endTime.equals("")) || (buyLimitationPercent.equals("")))
			throw new ValidationFailure();
		if ((!startTime.equals("00:00")) && (endTime.equals("00:00")))
			throw new ValidationFailure();
		if (initialMoney.compareTo(BigDecimal.valueOf(100000)) == -1)
			throw new ValidationFailure();
		if (initialMoney.compareTo(BigDecimal.valueOf(1000000000)) == 1)
			throw new ValidationFailure();
		if (String.valueOf(initialMoney).length() > 15)
			throw new ValidationFailure();
		if((Float.parseFloat(buyLimitationPercent)>100) || (Float.parseFloat(buyLimitationPercent)<1))
			throw new ValidationFailure();
		/*
		 * if (!Pattern.matches(regexGameName, name)) throw new
		 * ValidationFailure();
		 */
		if (!Pattern.matches(regexGameTime, startTime))
			throw new ValidationFailure();
		if (!Pattern.matches(regexGameTime, endTime))
			throw new ValidationFailure();
		/*
		 * if (!Pattern.matches(regexMoney, String.valueOf(initialMoney))) throw
		 * new ValidationFailure();
		 */

	}
	
	public static void validateSQLInjectionFreeQuery(String queryStr)
			throws SqlInjectionThreat {
		String query = queryStr.toLowerCase();
		if ((query.contains("delete")) || (query.contains("update"))
				|| (query.contains("drop")) || (query.contains("where"))
				|| (query.contains("from")) || (query.contains("insert"))
				|| (query.contains("alter")) || (query.contains(";"))
				|| (query.contains("'")))
			throw new SqlInjectionThreat(queryStr);
	}
	
	public static void validateToken(String sessionToken, String formToken)
			throws InvalidTokenException {
		if ((sessionToken == null) || (formToken == null) || (!sessionToken.equals(formToken)))
			throw new InvalidTokenException();
	}
}