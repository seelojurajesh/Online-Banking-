<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.DBConnect"%>
<%@page import="com.connection.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  
String s=request.getParameter("val");  
if(s==null || s.trim().equals("")){  
out.print("Please enter Username");  
}else{  
 
try{ 
Connection con=DBConnect.getConObj();
PreparedStatement ps=con.prepareStatement("select uname from bank");  
  
ResultSet rs=ps.executeQuery();  
while(rs.next()){
	 String x=rs.getString(1);
	 if(x.equalsIgnoreCase(s)){
		out.print("Username Already taken"); 
		break;
	 }
}  
ps.close();  
}catch(Exception e){e.printStackTrace();}  
}  
%>  
</body>
</html>