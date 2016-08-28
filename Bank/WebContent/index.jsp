<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Online Banking</title>
<script type="text/javascript">
	function validate(){
		var unex=/^[a-z]+$/;
		var psex=/^[0-9]+$/;
		if(!unex.test(document.getElementById("unm").value)){
	        document.getElementById("unme").innerHTML="Invalid Username";
	        return false;
		}
		else if(!psex.test(document.getElementById("psd").value)){
	        document.getElementById("psde").innerHTML="Invalid Password";
	        return false;
		}
		return true;
	}
	</script>
</head>
<body>
<h1 align="center"><font color="Blue">Welcome to Online Banking</font></h1><br><br>
 <form action="controllerpage.jsp" method="post"  ><h1 align="center">
 <input type="text" name="un" id="unm" placeholder="Username"><font color="red"><span id="unme"></span></font> <br>
 <input type="password" name="ps" id="psd" placeholder="Password"><font color="red"><span id="psde"></span></font> <br>
 <select dropzone="select" name="op">
 <option  value="admin">Admin</option>
 <option value="user">User</option>
 </select><br> 
 <input type="submit" value="Log in" ></h1>
 </form>
 </body>
</html>