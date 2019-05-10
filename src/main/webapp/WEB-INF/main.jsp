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
	
	  <title>Strictly Platonic </title>
	
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
      <a class="navbar-brand js-scroll-trigger" href="#page-top">Platonic</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#profile">Profile</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#testimonial">Testimonial</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#features">Features</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#contact">Account</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/logout">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <header class="masthead">
    <div class="container h-100">
      <div class="row h-100">
        <div class="col-lg-7 my-auto">
          <div class="header-content mx-auto">
          <h1 style="text-algin:top;">Welcome, to the New Friend App <c:out value="${user.firstName}"/>!</h1>

            <h3>Discover new friends around your area.</h3>
            <a style="margin:40px;" href="/profile" class="btn btn-outline btn-xl js-scroll-trigger">Find Friends!</a>
          </div>
        </div>
        <div class="col-lg-5 my-auto">
          <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
	    <ol class="carousel-indicators">
	      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
	      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
	      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
	    </ol>
	    <div class="carousel-inner">
	      <div class="carousel-item active">
	        <img src="img/yosemite.jpg" class="d-block w-250" alt="hiking">
	        <div class="carousel-caption d-none d-md-block">
	          <h5>Hiking</h5>
	          <p>Enjoy a hike with a group.</p>
	        </div>
	      </div>
	      <div class="carousel-item">
	        <img src="img/bonfire.jpg" class="d-block w-250" alt="bonfire">
	        <div class="carousel-caption d-none d-md-block">
	          <h5>Bonfire</h5>
	          <p> Have a bonfire at the beach.</p>
	        </div>
	      </div>
	      <div class="carousel-item">
	        <img src="img/concerts.jpg" class="d-block w-250" alt="concert">
	        <div class="carousel-caption d-none d-md-block">
	          <h5>Concerts</h5>
	          <p>Enjoy a concert with a new friend.</p>
	        </div>
	      </div>
	    </div>
	    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
	      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
	      <span class="carousel-control-next-icon" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
	  </div>
	</div>
        </div>
      </div>

  </header>
  
  <section style="background-image: url('img/yellow.jpg'); background-size:cover;"class="profile bg-primary text-center" id="profile">
    <div class="container">
      <div class="row">
        <div class="col-md-8 mx-auto">
          <h2 style="text-align:left;" class="section-heading">My Profile:</h2>
  
          <p style="font-size: 16pt; margin:20px;"> I am:  <c:out value="${user.age}"/> years old and  I am from <c:out value="${user.city}"/>, <c:out value="${user.state}"/>.</p>
          <p style="font-size: 16pt; margin:20px;"> I like: <c:out value="${user.hobbies}"/></p>
          
        </div>
      </div>
    </div>
  </section>

<!-- Create a form for users to write testimonials and populate it on the testimonials-->

  
<!--  testimonials -->
  <section style="background-image: url('img/purple.jpeg'); background-size:cover;" class="testimonial" id="testimonial">
    <div class="container">
      <div style=  class="section-heading text-center">
        <h2 style="color: #586391;">Here's what people had said about this app!</h2>
        <hr>
        <div class='firstUser'>
	        <img src="img/eugene.jpg" alt="eugene" class="rounded-circle" style="width:140px;height:140px;display:inline-block;margin:20px;">
	        <span style="color:white; font-size:13pt;"><span style="font-size:20pt;">Eugene:</span>  I enjoy going to the gym and found a great spotter on this app.</span>
        </div>
        <div class='secondUser'>
	        <img src="img/hadis.jpg" alt="hadis" class="rounded-circle" style="width:140px;height:140px;display:inline-block; margin:20px;">
	        <span style="color:white; font-size:13pt;"><span style="font-size:20pt;">Hadis:</span>  I met my bestfriend on this app. I enjoy cooking with my new friends.</span>
        </div>
        <div class='thirdUser'>
	        <img src="img/yi.jpg" alt="yi" class="rounded-circle" style="width:140px;height:140px;display:inline-block; margin:20px;">
	        <span style="color:white; font-size: 13pt;"><span style="font-size: 20pt;">Yi:</span>  I met a group of friends on this app and we went painting!</span>
        </div>
        <div class='fourthUser'>
	        <img src="img/phong.jpg" alt="phong" class="rounded-circle" style="width:140px;height:140px;display:inline-block; margin:20px;">
	        <span style="color:white; font-size:13pt;"><span style="font-size:20pt;">Dillon:</span>  I enjoy going to concerts and met my new rave fam on this app. </span>
        </div>
          <div class='fifthUser'>
	        <img src="img/srikar.jpg" alt="srikar" class="rounded-circle" style="width:140px;height:140px;display:inline-block; margin:20px;">
	        <span style="color:white; font-size:13pt;"><span style="font-size:20pt;">Srikar:</span>  I love shopping and found someone that loves to carry my bags. </span>
        </div>
      </div>
        <a style="margin:40px 400px;" href="/coming" class="btn btn-outline btn-xl js-scroll-trigger">Try Now for Free!</a>
      </div>  
  
    </section>
      


  

  <section style="background-image: url('img/photo.gif'); background-size:cover; margin-bottom:0px;" class="features" id="features">
    <div class="container">
      <div style="margin-bottom: 0px; "class="section-heading text-center">
        <h2 style="opacity:0.8;">Discover new friends with the same hobbies</h2>
    <!--     <p class="text-muted">Check out what you can do with this app theme!</p> -->
        <hr>
      </div>
      <div class="row ">
        <div class="col-lg-18 my-auto">
        <div style="margin: 0px 100px; " class="col-lg-10 my-auto">
          <div  class="container-fluid">
            <div  class="row ">
              <div class="col-md-4">
                <div class="feature-item">
                  <h3 style="color: #137EBB; font-size:40pt;">Define</h3>
                  <p style="color:white; font-size:15pt;">Add interests, values, and share pictures and more </p>
                </div>
              </div>
               <div class="col-md-4">
                <div class="feature-item">
                  <h3 style="color:#4EC19D; font-size:40pt;">Discover</h3>
                  <p style="color:white; font-size:15pt;">Friends around your area </p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="feature-item">
                  <h3 style="color:#FEE284; font-size:40pt;">Connect</h3>
                  <p style="color:white; font-size:15pt;">Direct and group messaging</p>"/Users/jenny/Documents/WebFundamentals/algorithm_three.html"
                </div>
              </div>     
            </div>
			<a style="margin-left:300px; " href="/hobbies/new" class="btn btn-outline btn-xl js-scroll-trigger">Create a new Hobby!</a>
            </div>
            </div>
          </div>
        </div>
        </div>
    
  </section>

  <!-- <section class="cta">
    <div class="cta-content">
      <div class="container">
        <h2>No more being forever alone.</h2>
        <h2>Start making friends now.</h2>
        
        
      </div>
    </div>
    <div class="overlay"></div>
  </section>
  <!--  -->

  <section class="contact bg-primary" id="account">
    <div class="container">
      <h2>We
        <i class="fas fa-heart"></i>
        new friends!</h2>
      <ul class="list-inline list-social">
        <li class="list-inline-item social-twitter">
          <a href="#">
            <i class="fab fa-twitter"></i>
          </a>
        </li>
        <li class="list-inline-item social-facebook">
          <a href="#">
            <i class="fab fa-facebook-f"></i>
          </a>
        </li>
        <li class="list-inline-item social-google-plus">
          <a href="#">
            <i class="fab fa-google-plus-g"></i>
          </a>
        </li>
      </ul>
    </div>
  </section>

  <footer>
    <div class="container">
      <p>&copy; Nguyen 2019. All Rights Reserved.</p>
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


       