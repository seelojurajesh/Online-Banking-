<%@page import="com.connection.UserAuthentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

	<% 
String un=(String)session.getAttribute("un");
if(un!=null){
	String name=UserAuthentication.getUserName(un);
out.println("<h1 align='center'><font color='cyan'>"+name+"</font><br></h1>");
out.println("<h1 align='center'><button><a href='balance.jsp'>Check Available Balance </a></button> ");
out.println("<button><a href='trans.jsp'>Transfer Money</a></button> ");
out.println("<button><a href='state.jsp'>Mini Statement</a></button> ");
out.println("<button><a href='change.jsp'>Change Password</a></button> ");
out.println("<button><a href='Logout.jsp'>Log out</a></button> </h1>");

}
else{
	RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	out.println("<body><h3 align='center'><font color='red'>Please Sign in To Continue</font></h3></body>");
	rd.include(request,response);
}
%>
</body>
</html>