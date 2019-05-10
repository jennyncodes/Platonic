<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
	<head>
	 	  <meta charset="utf-8">		
		 <title><c:out value="${hobby.name}"/></title>
		 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		
	</head>
	
	
	<body style="background-image: linear-gradient(to right, rgba(255,0,0,0), rgba(255,0,0,1));" id="page-top">
	
		  <!-- Navigation -->
	  <nav class="navbar navbar-light">
	   <a style="color:#AE6471;" class="navbar-brand js-scroll-trigger" href="#page-top">FriendZone</a>
		<a class="nav-link js-scroll-trigger" href="/main">Go Back</a>
 
		</nav>



	<section class="cta">
	    <div class="cta-content">
	      <div class="container">
	        <h1>These are <c:out value="${user.firstName}"/> hobbies:</h1>
	        <div class='table'>
	       	<table style=" background-color: white;" class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Hobby</th>
			      <th scope="col">Location</th>
			      <th scope="col">State</th>
			      <th scope="col">Description</th>
			      <th scope="col">Action </th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach items="${hobbies}" var="hobby">
					<tr>
		  				<td scope="row"><a style="color: #9F727D;" href="/hobbies/${hobby.id}"><c:out value="${hobby.name}"/></a></td>
					    <td><c:out value="${hobby.location}"/></td>
					    <td><c:out value="${hobby.state}"/></td>
					    <td><c:out value="${hobby.description}"/></td>
					    <td><a href="/hobbies/${hobby.id}/edit">Edit</a>|<a href="/hobbies/${hobby.id}/delete">Delete</a></td>
					</tr>
			</c:forEach>
	  		</tbody>
	  	</table>
	  	</div>
	  	
	  	<h2> Other people hobbies:</h2>
	  	<table style=" background-color: white;" class="table table-striped">
				<thead>
	  				<tr>
	    				<th scope="col">Name</th>
					    <th scope="col">Location</th>
					    <th scope="col">State</th>
					    <th scope="col">Description</th>
					    <th scope="col">Host</th>
					    <th scope="col">Action/Status</th>
	  				</tr>
				</thead>
				<tbody>
					<c:forEach items="${userHobbies}" var="userHob">
	  				<tr>
	  					<td><a href="/hobbies/${userHob.id}"><c:out value="${userHob.name}"/></a></td>
					    <td><c:out value="${userHob.location}"/></td>
					    <td><c:out value="${userHob.state}"/></td>
					    <td><c:out value="${userHob.description}"/></td>
						<td><c:out value="${userHob.user.firstName}"/></td>
                        <c:choose>
                        <c:when test="${userHob.user == user}">
                            <td>Joining | <a href="/hobbies/${userHob.id}/edit">Edit</a> | <a href="hobbies/${userHob.id}/delete">Delete</a></td>
                        </c:when>
                        <c:otherwise>
                            <c:set var="joining" value="${false}"/>
                            <c:forEach items="${in.getJoinedUsers()}" var="joiner">
                                <c:if test="${joiner == user}"> 
                                    <c:set var="joining" value="${true}"/>
                                </c:if>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${joining == false}">
                                    <td><a href="/hobbies/${userHob.id}/join">Join</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td>Joining | <a href="hobbies/${userHob.id}/cancel">Cancel</a></td>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                        </c:choose>  
	  				</tr>
	  				</c:forEach>
				</tbody>
			</table>






	<div style="border: 1px solid white; margin:40px 5px; " class="formform  col-md-4">
	<h3> Add a new Hobby</h3>
	<form:form method="post" action="/newHobby" modelAttribute="hobby">
		  
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
	  		<input style="margin-left:120px; "class="btn btn-outline-danger" type="submit" value="create"/>
		<form:errors cssClass="red" path="hobby.*"/>   
		</form:form>
	   	</div>
	   </div>
	   <div class="overlay"></div>
	   </div>
	  </section> 
	  

	
	</body>
	
</html>
	
