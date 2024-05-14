package com.connection;
import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider{
		
		public static Connection getConn() {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodorder","root","Ha@18@10@20");
				return con;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
		}
		
		
	}

