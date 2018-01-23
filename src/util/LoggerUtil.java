package  util;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class LoggerUtil {
	private static Logger logger;
	
	public static void debug(String message, String className) {
		logger = LogManager.getLogger(className);
		logger.debug(message);
	}
	
	public static void info(String message, String className) {
		logger = LogManager.getLogger(className);
		logger.info(message);
	}
	
	public static void warn(String message, String className) {
		logger = LogManager.getLogger(className);
		logger.warn(message);
	}
	
	public static void error(String message, String className) {
		logger = LogManager.getLogger(className);
		logger.error(message);
	}
}
