<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html ">
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
	 
	out.println("<h3 align='center'> <br> <form action='transfer.jsp' method='post'><pre>");
	out.println("Person Name    <input type='text' name='fn'><br>"); 
	out.println("Account Number <input type='text' name='ac'><br>");
	out.println("Money          <input type='number' name='mn'><br>");
	out.println("<input type='submit' value='Send'>");
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