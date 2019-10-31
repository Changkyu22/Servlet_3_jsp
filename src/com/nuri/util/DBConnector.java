package com.nuri.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
	
	public static Connection getConnection() throws Exception {
		Connection con = null;
		
		String user = "user13";
		String password = "user13";
		String url = "jdbc:oracle:thin:@211.238.142.28:1521:xe";
		String driver ="oracle.jdbc.driver.OracleDriver";
		
		Class.forName(driver);
		
		con = DriverManager.getConnection(url, user, password);
		
		return con;
	}
	
	
}
