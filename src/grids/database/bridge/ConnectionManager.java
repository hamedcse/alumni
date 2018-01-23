package grids.database.bridge;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionManager {

	public static Connection connectToMYSQL() {
		Connection connection = null;

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = (Connection) DriverManager
					.getConnection("jdbc:mysql://localhost/alumni?user=root&password=123&amp;characterSet=utf8&useUnicode=true&characterEncoding=utf-8&characterSetResults=utf8");
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			//CacheLogger.Add("ConnectionManager->execute Method(Exception)", e);
			e.printStackTrace();
		}

		return connection;
	}

	public static boolean disconnectFromMYSQL(Connection connection) {

		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			//CacheLogger.Add("ConnectionManager->execute Method(Exception)", e);
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
