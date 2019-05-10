<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
	<body style="background-image: url('img/sunrise.jpg'); background-size:cover;">
		<h1 style="display:inline-block; color:#7F96CC ; margin:20px;" >Some friends around you:</h1>
		<a style="display:inline-block; margin-left: 900px;" href="/main">Go Back</a>
		
		<div class='firstUser'>
	        <img src="img/eugene.jpg" alt="eugene" class="rounded-circle" style="width:140px;height:140px;display:inline-block;margin:20px;">
	        <span style="color:white; font-size:13pt;"><span style="font-size:20pt;">Eugene</span></span>
        </div>
        <div class='secondUser'>
	        <img src="img/hadis.jpg" alt="hadis" class="rounded-circle" style="width:140px;height:140px;display:inline-block; margin:20px;">
	        <span style="color:white; font-size:13pt;"><span style="font-size:20pt;">Hadis</span> </span>
        </div>
         <div class='thirdUser'>
	        <img src="img/zeee.jpg" alt="zainab" class="rounded-circle" style="width:140px;height:140px;display:inline-block; margin:20px;">
	        <span style="color:white; font-size:13pt;"><span style="font-size:20pt;">Zainab</span> </span>
        </div>
        <div class='fourthUser'>
	        <img src="img/dillon.jpg" alt="dillon" class="rounded-circle" style="width:140px;height:140px;display:inline-block;margin:20px;">
	        <span style="color:white; font-size:13pt;"><span style="font-size:20pt;">Dylon The Rapper</span></span>
        </div>
	
	
	
	</body>
</html>