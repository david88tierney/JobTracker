<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<style>
	body {
		background-image: url("images/waterfall.jpg");
		font-family: courier new;
		background-repeat: no-repeat;
		background-attachment: fixed;  /* Background Image will stay fixed */
   	 	background-size: cover;
	
		}
.navbar {
  overflow: hidden;
  background-color: #333;
  opacity: 0.6;
}
.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.card-body{
   	color: white;
   	text-align: center;
   	position: absolute;
    font-family: courier new;
   }
</style>
<body>
<div class="navbar">
  <a href="/home">Home</a>
</div>
<div class="d-flex justify-content-center h-100">
	<div class="card-body">
		<h3> Login </h3>

				<form:form action="/login" method="POST" >
				    <c:if test="${loginError != null}">
				        <p class="error"> ${loginError}</p> 
				        </c:if>
				    <p>Email:</p>
				    <p><input type="text" name="email"  /></p>
				    
				    <p>Password:</p>
				    <p><input type="password" name="password" /></p>
				    
				    <p><input type="submit" value="Login" /></p>
				</form:form>
	</div>
</div>

</body>
</html>