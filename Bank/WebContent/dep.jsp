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
String un1=(String)session.getAttribute("adminun");
if(un1!=null)
{
	String ac=request.getParameter("ac");
	double mn=Double.parseDouble( request.getParameter("mn"));
	double mn1= Admin.getBalance(ac);
	int x=Admin.deposit(ac, mn, mn1);
	Admin.addStatement(ac, mn);
	RequestDispatcher rd=request.getRequestDispatcher("deposit.jsp");
	if(x==1){		
	  out.println("<body><h3><font  color='green'>Deposited Successfully</font></h3></body>");
	  rd.include(request,response);
	}else{
		out.println("<body><h3><font  color='green'>Failed Try Again</font></h3></body>");
		  rd.include(request,response);
	}
}
else{
	RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	out.println("<body><h3 align='center'><font color='red'>Please Sign in To Continue</font></h3></body>");
	rd.include(request,response);
}
%>
</body>
</html>