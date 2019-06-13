<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Platonic</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="vendor/simple-line-icons/css/simple-line-icons.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">

  <!-- Plugin CSS -->
  <link rel="stylesheet" href="device-mockups/device-mockups.min.css">

  <!-- Custom styles for this template -->
  <link href="css/new-age.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a style="font-size:25pt; font-family: Georgia;" class="navbar-brand js-scroll-trigger">Platonic</a>
      
    </div>
  </nav>

  <header class="masthead">
    <div class="container h-100">
      <div class="row h-100">
        <div class="col-lg-5 my-auto">
          <div class="header-content mx-auto">
            <h2 style="font-size:19pt; margin: 20px;" >Register</h2>
			<p><form:errors path="user.*"/></p>
		
		    <form:form method="POST" action="/registration" modelAttribute="user">
		    	<div class="form-group">
			  		<p>
				    	<form:label for="firstName" path="firstName">First Name:</form:label>
				    	<form:input type="firstName" class="form-control" id="inputFirstName" path="firstName" aria-describedby="name" placeholder="Enter your first name"/>
			    	</p>	
			 	</div>
			 	<div class="form-group">
			  		<p>
				    	<form:label for="lastName" path="lastName">Last Name:</form:label>
				    	<form:input type="lastName" class="form-control" id="inputLastName" path="lastName" aria-describedby="lastname" placeholder="Enter your last name"/>
			    	</p>	
			 	</div>
			 	<div class="form-group">
			  		<p>
				    	<form:label for="age" path="age">Age:</form:label>
				    	<form:input type="age" class="form-control" id="inputAge" path="age" aria-describedby="age" />
			    	</p>	
			 	</div>
			 	<div class="form-group">
			 	<p>
		            <form:label path="city">City:</form:label>
		            <form:input type="text" path="city"/>
						<form:select cssClass="state" path="state">
							<c:forEach items="${states}" var="state">
								<form:option value="${state}"><c:out value="${state}"/></form:option>
							</c:forEach>
						</form:select>
				</p>
				</div>
				<div class="form-group">
				  	<p>
				    	<form:label for="exampleInputHobby" path="hobbies">Hobbies: </form:label>
				    	<form:input type="text" class="form-control" id="exampleInputHobby" path="hobbies" aria-describedby="emailHelp" placeholder="Enter your hobbies"/>
				    </p>	
				 </div>
			  	<div class="form-group">
				  	<p>
				    	<form:label for="exampleInputEmail1" path="email">Email: </form:label>
				    	<form:input type="email" class="form-control" id="exampleInputEmail1" path="email" aria-describedby="emailHelp" placeholder="Enter email"/>
				    </p>	
				 </div>
				  <div class="form-group">
					  <p>
					    <form:label for="exampleInputPassword1" path="password">Password</form:label>
					    <form:password class="form-control" id="exampleInputPassword1" path="password" placeholder="Password"/>
					 </p>
				  </div>
				   <div class="form-group">
					  <p>
					    <form:label for="exampleInputPassword1" path="passwordConfirmation">Password Confirmation</form:label>
					    <form:password class="form-control" id="exampleInputPassword1" path="passwordConfirmation" placeholder="Password must match"/>
					 </p>
				  </div>
				  
				  <input type="submit" class="btn btn-outline btn-xl js-scroll-trigger" value="Register!"/>
				</form:form>
		            
          	</div>
        </div>
        <div style="vertical-align:top; margin-left:260px;" class="col-lg-4 my-auto">
		    <h2 style="font-size:20pt;" >Login</h2>
		     <form method="post" action="/login">
		     <p><c:out value="${error}" /></p>
		    	<div class="form-group">
				  	<p>
				    	<label for="email" path="email1">Email </label>
				    	<input type="text" class="form-control" id="email1" name="email1" aria-describedby="emailHelp" placeholder="Enter email"/>
				    </p>	
				 </div>
				  <div class="form-group">
					  <p>
					    <label for="exampleInputPassword1" path="password1">Password</label>
					    <input type="password" class="form-control" id="password1" name="password1" placeholder="Enter your Password"/>
					 </p>
				  </div>
		   
		        <input type="submit" class="btn btn-outline btn-xl js-scroll-trigger" value="Login!"/>
		    </form>
   		</div>
      </div>
     </div>

  </header>



  <footer>
    <div class="container">
      <p>&copy; Jenthewebdev 2019. All Rights Reserved.</p>
      <ul class="list-inline">
        <li class="list-inline-item">
          <a href="#">Privacy</a>
        </li>
        <li class="list-inline-item">
          <a href="#">Terms</a>
        </li>
        <li class="list-inline-item">
          <a href="#">FAQ</a>
        </li>
      </ul>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/new-age.min.js"></script>

</body>

</html>


