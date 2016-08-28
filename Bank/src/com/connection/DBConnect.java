package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	static Connection con;
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/rajesh", "root","root");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getConObj(){
		return con;
	}
}
