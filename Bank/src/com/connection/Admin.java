package com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Admin {
	public static int deposit(String ac1,double money1,double money2){
		int x=0;
		PreparedStatement p;
		try{
		     Connection con=DBConnect.getConObj();
		     double mn=money1+money2;
		     p= con.prepareStatement("update bank set money=? where accno=?");
		     p.setDouble(1, mn);
		     p.setString(2, ac1);
		     x= p.executeUpdate(); 
			 p.close();
		    
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return x;
	}
	static public double getBalance(String ac){
		PreparedStatement p;
		double x=0;
		try{
		     Connection con=DBConnect.getConObj();
		     p= con.prepareStatement("select money from bank where accno=?");
		     p.setString(1, ac);
		     ResultSet rs= p.executeQuery();
		     rs.next();
		     x=rs.getDouble(1);
		     p.close();
		     rs.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return x;
	}
	public static String getDate(){
		SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
		String date = sdf.format(new Date()); 
		return date;
	}
	public static void addStatement(String ac,double mn){
		PreparedStatement p1;
		try {
			Connection con=DBConnect.getConObj();
			p1= con.prepareStatement("insert into state values(?,?,?,?,?)");
			p1.setString(1,ac);
			p1.setString(2, Admin.getDate());
			p1.setString(3, "Deposited");
			p1.setString(4, ac);
			p1.setDouble(5, mn);
			
			int x=p1.executeUpdate();
			p1.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
