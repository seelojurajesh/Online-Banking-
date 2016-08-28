<%@page import="com.connection.Admin"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body> 
<%
String fn=request.getParameter("fn");
String ln=request.getParameter("ln");
String mob=request.getParameter("mob");
String em=request.getParameter("em");
String ct=request.getParameter("ct");
String st=request.getParameter("st");
String un=request.getParameter("un");
String ps=request.getParameter("ps");
String ac=request.getParameter("ac");
double mn=Double.parseDouble( request.getParameter("mn"));
Connection con=DBConnect.getConObj();
PreparedStatement p=null,p1=null;
RequestDispatcher rd=request.getRequestDispatcher("create.html");
try{
	p= con.prepareStatement("insert into bank values(?,?,?,?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	p1= con.prepareStatement("insert into state values(?,?,?,?,?)");
	p.setString(1,fn);
	p.setString(2,ln);
	p.setString(3,mob);
	p.setString(4,em);
	p.setString(5,ct);
	p.setString(6,st);
	p.setString(7,un);
	p.setString(8,ps);
	p.setDouble(9,mn);
	p.setString(10,ac);
	p1.setString(1,ac);
	p1.setString(2, Admin.getDate());
	p1.setString(3, "Deposited");
	p1.setString(4, ac);
	p1.setDouble(5, mn);
	
	int x=p.executeUpdate();
	p1.executeUpdate();
	if(x==1){
		out.println("<body><h1><font  color='green'>Account Created Successfully</font></h1></body>");
		rd.include(request, response);
	}
	else{
		out.println("<body><h1><font color='red'>Account Creation Failed, Please Try Again</font></h1></body>");
		rd.include(request, response);
	}
}catch(Exception e){
	e.printStackTrace();
}
finally{
	p.close();
}
%>
</body>
</html>