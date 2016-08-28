<%@page import="com.connection.UserAuthentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%
	RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	String un=request.getParameter("un");
	String ps=request.getParameter("ps");
	String op=request.getParameter("op");
	if(op.equals("admin")){
		if(un.equals("rajesh") && ps.equals("rajesh")){
			session.setAttribute("adminun", un);
			response.sendRedirect("AdminHome.jsp");
		}
		else{
			out.println("<body><h3 align='center'><font color='red'>Invalid Username or Password</font></h3></body>");
			rd.include(request,response);
		}
	}else if(op.equals("user")){
		int x=UserAuthentication.getAuth(un, ps);
		if(x==1){
			session.setAttribute("un", un);
			response.sendRedirect("UserHome.jsp");
		}
		else if(x==0){
			out.println("<body><h3 align='center'><font color='red'>Invalid Username or Password</font></h3></body>");
			rd.include(request,response);
		}
	}
%>
</body>
</html>