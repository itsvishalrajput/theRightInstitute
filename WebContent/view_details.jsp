<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html >
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> Institute Details | The Right Institute</title>
	
	<!-- core CSS -->
    <link href="views/css/bootstrap.min.css" rel="stylesheet">
    <link href="views/css/font-awesome.min.css" rel="stylesheet">
    <link href="views/css/animate.min.css" rel="stylesheet">
    <link href="views/css/prettyPhoto.css" rel="stylesheet">
    <link href="views/css/main.css" rel="stylesheet">
    <link href="views/css/responsive.css" rel="stylesheet">

        
    <link rel="shortcut icon" href="views/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="106x115" href="views/images/ico/apple-touch-icon-144-precomposed.jpg">
</head><!--/head-->

<body class="homepage">

    <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                        <div class="topnumber"><p><i class="fa faphone-square"></i> </p></div>
                    </div>
                    <div class="col-sm-6 col-xs-8">
                       <div class="social">
                            <ul class="social-share">
                            	<li><a href="http://www.gmail.com"><i class="fa fa-google"></i></a></li>
                                <li><a href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li> 
                            </ul>
                            <div class="search">
                                <form role="form" action="search.jsp">
                                    <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                                    <i class="fa fa-search"></i>
                                </form>
                           </div>
                       </div>
                    </div>
                </div>
            </div><!--/.container-->
        </div><!--/.top-bar-->
        
        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><img src="views/images/logo.jpg" alt="logo"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="about_me.jsp">About Me</a></li>
                        <li><a href="search.jsp">Institutes</a></li>
                        <li><a href="contact-me.jsp">Contact</a></li>
                        <li><a href="logout">Logout</a></li>               
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header--><br/>
    
    <!-- Institutes Details -->
    
    <c:forEach var="InstitutesObj" items="${institutesList }" varStatus="myIndex">
    
    	<c:if test="${param.link eq myIndex.count}">
    	
    	<!-- Institute Name Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">${InstitutesObj.instituteName }
               
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Institute Row -->
        <div class="row">
        	<div class="col-md-0.5"></div>
            <div class="col-md-7">
                <img class="img-responsive" src="${InstitutesObj.instituteImageURL }">
            </div>

            <div class="col-md-4">
                <h2>${InstitutesObj.instituteName } Description</h2>
                <p>${InstitutesObj.instituteDescription}</p>
                <h4>Website:</h4><a href="http://${InstitutesObj.instituteWebsite}">${InstitutesObj.instituteWebsite}</a>
                <h4>Address:-</h4>
                <p>${InstitutesObj.instituteAddress} ${InstitutesObj.instituteCity} ${InstitutesObj.instituteState} ${InstitutesObj.institutePincode}</p>
                <h4>Email:</h4><p>${InstitutesObj.instituteEmail}</p>
    			<h4>Contact No.-</h4><p>${InstitutesObj.instituteContactNo}</p>
                <hr>
            </div>
          </div>
          <div class="row">
          <div class="col-md-2"></div>
            <div class="col-md-8">   
                <h2>Courses</h2>
             
                <h3>${InstitutesObj.instituteCourseTitle}</h3>
                <p>${InstitutesObj.courseDescription}</p>
                <ul>
                    <li><b>Duration:</b>${InstitutesObj.courseDuration}</li>
                    <li><b>Timings:</b>${InstitutesObj.courseTimings}</li>
                    <li><b>Fees:</b>Rs. ${InstitutesObj.courseFees}</li>
                </ul>
                <hr>
            </div>

        </div>
        <!-- /.row -->
        
       </c:if>
       
      </c:forEach>
      
      <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2016 <a target="_blank" href="http://www.github.com/itsvishalrajput" title="Free Twitter Bootstrap WordPress Themes and HTML templates">Vishal Rajput</a>. All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="about_me.jsp">About Me</a></li>
                        <li><a href="#">Faq</a></li>
                        <li><a href="contact-me.jsp">Contact Me</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer><!--/#footer-->

    <script src="views/js/jquery.js"></script>
    <script src="views/js/bootstrap.min.js"></script>
    <script src="views/js/jquery.prettyPhoto.js"></script>
    <script src="views/js/jquery.isotope.min.js"></script>
    <script src="views/js/main.js"></script>
    <script src="views/js/wow.min.js"></script>
</body>
</html>


<!-- 
<%--
<body>
<c:forEach var="InstitutesObj" items="${institutesList }" varStatus="myIndex">
<c:out value="${count }" />
<c:out value="${myIndex.count}" />
<c:if test="${count eq myIndex.count}">
	<c:out value="chal gya" />
	${InstitutesObj.instituteDescription}
</c:if>
</c:forEach>
</body>
</html>
--%>
-->