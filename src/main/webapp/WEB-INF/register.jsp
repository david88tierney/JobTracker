<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<style>
	body {
		background-image: url("images/blueFalls-X3.jpg");
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
		<h3>Registration</h3>
			<c:if test="${userError != null}">
			    <p class="error"> ${userError}</p> 
			</c:if>
				<form:form action="/register" method="POST" modelAttribute="user">
				
				    <p><form:label path="name"> Name: </form:label></p>
				    <p><form:errors path="name"></form:errors> </p>
				    <p><form:input path="name"></form:input></p>
				
				    <p><form:label path="email"> Email: </form:label></p>
				    <p><form:errors path="email"></form:errors> </p>
				    <p><form:input path="email"></form:input></p>
				
				    <p><form:label path="password"> Password: </form:label></p>
				    <p><form:errors path="password"></form:errors></p> 
				    <p><form:input path="password" type="password" ></form:input></p>
				
				    <p><form:label path="confirm"> Password Confirmation: </form:label></p>
				    <p><form:errors path="confirm"></form:errors> </p>
				    <p><form:input path="confirm" type="password"></form:input></p>
				    
				    <p><input type="submit" value="Register" /></p>
				    
				</form:form>
			</div>
	</div> 
</body>
</html>