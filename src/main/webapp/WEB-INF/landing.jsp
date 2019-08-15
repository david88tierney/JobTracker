<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body {
  font-family: courier new;
}

.navbar {
  overflow: hidden;
  background-color: #333;
  opacity: 0.6;
}

.mySlides {
  display:none;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
.logout {
	display: flex;
	justify-content: flex-end;
}

img {
    display:inline-block;
    width:30%;
}
.section {
   max-width:90%;
   margin-left: 8%;
}

.title{
	text-align: center;
}

</style>
</head>
<body>

<div class="navbar">
	  <div class="dropdown">
	    <button class="dropbtn">Login || Register 
	      <i class="fa fa-caret-down"></i>
	    </button>
	    <div class="dropdown-content">
	    	<a href="/loginPage">Login Here</a>
	      	<a href="/registerPage">Register Here</a>
	    </div>
	  </div>
  <div class="logout">
  	<a href="/deleteSession"> Logout</a>
  </div> 
</div>
	<div class="title">
		<p>This is Your Dream Job, a Web App built to track what jobs you have applied for! </p>
	</div>
	
	<c:if test="${user.name != null}">
	    <h1>Welcome, ${ user.name }</h1> 
	</c:if>
	
	
	<table border="1">
		<thead>
			<th>Title</th>
			<th>Location</th>
			<th>Description</th>
			<th>Company</th>
		</thead>
		<tbody>
    	<c:forEach var="job" items="${ jobs }" >
        <tr> 
            <td>${  job.title } </td>
            <td>${  job.location }</td>
          	<td> ${ job.description }</td>
          	<td> ${ job.company }</td>
          	
        </tr>
    	</c:forEach>

		</tbody>
	</table>
	
	<a href="/add">Add a job you applied to!</a>








</body>
</html>