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
	String cpw=request.getParameter("cps");
	String npw= request.getParameter("nps");
	String cpw1=UserAuthentication.getCPwd(un1); 
	RequestDispatcher rd=request.getRequestDispatcher("change.jsp");
	if(cpw.equals(cpw1)){
		int x=UserAuthentication.changePwd(un1, npw); 	   
	   if(x==1){		
	   out.println("<body><h3><font  color='green'>Password changed Successfully</font></h3></body>");
	   rd.include(request,response);
	   }else{
		 out.println("<body><h3><font  color='green'>Failed Try Again</font></h3></body>");
		  rd.include(request,response);
	    }
	}else{
		 out.println("<body><h3><font  color='red'>Incorrect current Password </font></h3></body>");
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