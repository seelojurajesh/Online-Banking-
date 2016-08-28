<%@page import="com.connection.StatementList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>
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
String un=(String)session.getAttribute("un");
if(un!=null)
{
	ArrayList<StatementList> al=UserAuthentication.getStatement(un);
	RequestDispatcher rd=request.getRequestDispatcher("UserHome.jsp");
	out.println("<h3 align='center'><font color='green'>Statements History </font><br></h3>");
	Iterator<StatementList> it= al.iterator();

	out.println("<h3><table border='2' bgcolor='Lavender' align='center'><tr><th>Date</th><th>Description</th><th>From Account</th><th>Amount</th> </tr>");
	while (it.hasNext()) {
		StatementList ob =  it.next();
		out.println("<tr><td>"+ob.getDt()+"</td> <td>"+ob.getTy()+"</td><td>"+ob.getFr()+"</td><td>"+ob.getMn()+"</td></tr>");
		
	}
	out.println("	</table></h3>");
	rd.include(request,response);
}
else{
	RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	out.println("<body><h3 align='center'><font color='red'>Please Sign in To Continue</font></h3></body>");
	rd.include(request,response);
}
%>
</body>
</html>