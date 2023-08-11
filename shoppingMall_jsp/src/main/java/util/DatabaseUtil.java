package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
	public static Connection getConnection() {
		String driverName="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/shoppingMall";
		String username = "root";
		String password = "123456";
		Connection conn = null;
		
		try{
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			return conn;

		} catch(ClassNotFoundException e){
			e.printStackTrace();
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		return null;
	}
}