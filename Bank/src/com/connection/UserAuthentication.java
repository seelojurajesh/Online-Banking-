package com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

public class UserAuthentication {
	public static int getAuth(String un1,String ps1){
		int x=0;
		PreparedStatement p;
		try{
		     Connection con=DBConnect.getConObj();
		     p= con.prepareStatement("select uname,pswd from bank");
		     
		     ResultSet rs= p.executeQuery();
		     while (rs.next()) {
				if(un1.equals(rs.getString(1)) && ps1.equals(rs.getString(2))){
					x=1;
				}
				 
			}
		   p.close();
		   rs.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return x;
	}
	static public double getBalance(String un){
		PreparedStatement p;
		double x=0;
		try{
		     Connection con=DBConnect.getConObj();
		     p= con.prepareStatement("select money from bank where uname=?");
		     p.setString(1, un);
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
	
	static public double getBalanceByAccNo(String ac){
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
	
	public static int tranfer(String ac1,double money1,double money2){
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
	
	public static int beforeDeposit(String uname1,double money1,double actMny){
		int x=0;
		PreparedStatement p;
		try{
		     Connection con=DBConnect.getConObj();
		     double mn=actMny-money1;
		     p= con.prepareStatement("update bank set money=? where uname=?");
		     p.setDouble(1, mn);
		     p.setString(2, uname1);
		     x= p.executeUpdate(); 
			 p.close();
		    
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return x;
	}
	
	static public String getCPwd(String un){
		PreparedStatement p;
		String x=null;
		try{
		     Connection con=DBConnect.getConObj();
		     p= con.prepareStatement("select pswd from bank where uname=?");
		     p.setString(1, un);
		     ResultSet rs= p.executeQuery();
		     rs.next();
		     x=rs.getString(1);
		     p.close();
		     rs.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return x;
	}
	
	static public int changePwd(String un,String ps){
		PreparedStatement p;
		int x=0;
		try{
		     Connection con=DBConnect.getConObj();
		     p= con.prepareStatement("update bank set pswd=? where uname=?");
		     p.setString(1, ps);
		     p.setString(2, un);
		     x=p.executeUpdate();
		     p.close();
		     
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return x;
	}
	
	static public String getUserName(String un){
		PreparedStatement p;
		String x,y,str="";
		try{
		     Connection con=DBConnect.getConObj();
		     p= con.prepareStatement("select fname,lname from bank where uname=?");
		     p.setString(1, un);
		     ResultSet rs= p.executeQuery();
		     rs.next();
		     x=rs.getString(1);
		     y=rs.getString(2);
		     str=x+" "+y;
		     p.close();
		     rs.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return str;
	}
	
	public static String getDate(){
		SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
		String date = sdf.format(new Date()); 
		return date;
	}
	public static String getAccno(String un){
		String ps="";
		try{
			Connection con=DBConnect.getConObj();
		     PreparedStatement p= con.prepareStatement("select accno from bank where uname=?");
		     p.setString(1, un);
		     ResultSet rs= p.executeQuery();
		     rs.next();
		     ps=rs.getString(1);
		     p.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return ps;
	}
	
	public static ArrayList<StatementList> getStatement(String un){
		ArrayList<StatementList> al=new ArrayList<StatementList>();
		String ac=getAccno(un);
		PreparedStatement p;
		String x,y,z;
		double m;
		try{
		     Connection con=DBConnect.getConObj();
		     p= con.prepareStatement("select dt,tp,fr,money from state where accno=?");
		     p.setString(1, ac);
		     ResultSet rs= p.executeQuery();
		     while (rs.next()) {
		    	  
			     x=rs.getString(1);
			     y=rs.getString(2);
			     z=rs.getString(3);
			     m=rs.getDouble(4);
			     al.add(new StatementList(x, y, z, m));
			}
		      
		     
		     p.close();
		     rs.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return al;
	
	
	}
}
