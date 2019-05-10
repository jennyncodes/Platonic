<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title><c:out value="${hobby.name}"/></title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>
	<body  style="background-image: url('/img/pretty.jpeg'); background-size:cover;">

		<h1 style="text-align:center; margin:10px;"><c:out value="${hobby.name}"/></h1>
		<a style="display:inline-block; margin-left: 950px; vertical-align:top;" href="/main">Go Back</a>
		
		
				<h3 style="text-align:center; margin:30px;">Edit Hobby</h3>
				<div style="border: 1px solid white; margin:40px 600px; " class="form col-lg-3">
				<form:form method="post" action="/hobbies/${hobby.id}/edit" modelAttribute="hobby">
					<input type="hidden" name="_method" value="post">
							
					  <div class="form-group">
					    <label for="name">Name:</label>
					    <form:input type="text" class="form-control" path="name" id="name" aria-describedby="name" placeholder="Enter your hobby"/>
					  </div>
					  <div class="form-group">
					    <label for="location">Location:</label>
					    <form:input type="text" class="form-control" path="location" id="location" placeholder="Enter your location"/>
					  </div>
					  <div class="form-group">
					    <label for="state">State:</label>
					    <form:input type="text" class="form-control" path="state" id="state" placeholder="Enter your state"/>
					  </div>
					  <div class="form-group">
					    <label for="description">Description:</label>
					    <form:textarea  class="form-control" path="description" id="description" placeholder="Enter your description"/>
					  </div>
					<form:hidden path="user" value="${user.id}"/>
					<input style="margin-left:150px;" class="btn btn-info" type="submit" value="Edit"/>
				</form:form>
				<form:errors cssClass="red" path="hobby.*"/>
		</div>
	
	
	</body>
</html>