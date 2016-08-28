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
String un=(String)session.getAttribute("un");
if(un!=null)
{
	 
	RequestDispatcher rd=request.getRequestDispatcher("UserHome.jsp");
	 
	out.println("<h3 align='center'> <br> <form action='changepswd.jsp' method='post'><pre>");
	out.println("First Name        <input type='text' name='fn'><br>"); 
	out.println("Current Password  <input type='password' name='cps'><br>");
	out.println("New Password      <input type='password' name='nps'><br>");
	out.println("<input type='submit' value='Change'>");
	out.println("</pre></form/>");
	out.println("</h3>");
	rd.include(request,response);

}
else if(un==null){
	RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	out.println("<body><h3 align='center'><font color='red'>Please Sign in To Continue</font></h3></body>");
	rd.include(request,response);
}
%>
</body>
</html>