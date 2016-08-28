<%@page import="com.connection.UserAuthentication"%>
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
String un1=(String)session.getAttribute("un");
if(un1!=null)
{
	String ac2=request.getParameter("ac");
	double mn=Double.parseDouble( request.getParameter("mn"));
	double smn1= UserAuthentication.getBalance(un1);
	double rmn1= UserAuthentication.getBalanceByAccNo(ac2);
	RequestDispatcher rd=request.getRequestDispatcher("trans.jsp");
	if(smn1>=mn){
		UserAuthentication.beforeDeposit(un1, mn, smn1);
		int x=UserAuthentication.tranfer(ac2, mn, rmn1);
	   
	   if(x==1){		
	   out.println("<body><h3><font  color='green'>Transfered Successfully</font></h3></body>");
	   rd.include(request,response);
	   }else{
		 out.println("<body><h3><font  color='green'>Failed Try Again</font></h3></body>");
		  rd.include(request,response);
	    }
	}else{
		 out.println("<body><h3><font  color='red'>You dont't have sufficient balance to Transfer</font></h3></body>");
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