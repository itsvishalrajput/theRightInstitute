<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html >
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> Institutes | The Right Institute</title>
	
	<!-- core CSS -->
    <link href="views/css/bootstrap.min.css" rel="stylesheet">
    <link href="views/css/font-awesome.min.css" rel="stylesheet">
    <link href="views/css/animate.min.css" rel="stylesheet">
    <link href="views/css/prettyPhoto.css" rel="stylesheet">
    <link href="views/css/main.css" rel="stylesheet">
    <link href="views/css/responsive.css" rel="stylesheet">
    <link href="views/css/searchbox.css" rel="stylesheet">
        
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
                          
                        <%try {
								if(request.getSession().getAttribute("user-name")==null){
						%>
                        <li class="active"><a href="signin.jsp">Register Now</a></li>
                        <li class="active"><a href="Login.jsp">Login</a></li>
                        <%} else { %>
                        <li class="active"><a href="logout">Logout</a></li>
                        <%	}

						}catch(Exception e){
							e.printStackTrace();
						}
						%>
						<li class="active"><a href="register_institute.jsp" >Add a Course</a></li>
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header--><br/>
    
    <!-- Page Content -->
    <div class="container">
    
    <!-- Search Box -->
    
    <form method="post" action="search">
		<div class="field" id="searchform">
  			<input type="text" id="searchterm" name="searchInstitute" placeholder="Search by Institute Name" />
  			<input type="text" id="searchterm" name="searchCourse" placeholder="Search by Course Name" />
  			<input type="text" id="searchterm" name="searchLocation" placeholder="Search by Location" />
  		<button type="submit" id="search" >Find !</button>
		</div>
		<script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	</form>
	
	<c:if test="${fn:length(institutesList) ge 0}">
	
	<!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Page Heading
                    <small>Institutes</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
		

        <!-- Search Results -->
        
        <c:set var="link" value="0" scope="session"/>
        <c:forEach var="InstitutesObj" items="${institutesList}">
        	<c:set var="link" value="${link+1}" scope="session" />
        	
        	<div class="row">
            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="${InstitutesObj.instituteImageURL }" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h2>${InstitutesObj.instituteName }</h2>
                <h4>${InstitutesObj.instituteCourseTitle }</h4>
                <p>${InstitutesObj.courseDescription}</p>
                
                <form method="post" action="view_details.jsp?link=${link }">
                	<div class="form-group">
                    	<button type="submit" name="submit" class="btn btn-primary btn-lg" >View Details</button>
                	</div>
                </form>
            </div>
        </div>
        <!-- /.row -->

        <hr>
        
        </c:forEach>

		</c:if>
		
		<c:if test="${fn:length(institutesList) eq 0}">
			<h2>Got no matches for you !</h2>
		</c:if>
		
		
		<!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->
        
        </div>
    <!-- /.container -->
    
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
<%try {
	if(request.getSession().getAttribute("user-name")==null){
%>
		<a href = "index.jsp">Login</a>

<%} else { %>
<a href = "logout">Logout</a>
<%}

}catch(Exception e){
	e.printStackTrace();
}
%>

<form method="get" action="search">
	<input type="text" name="searchInstitute">
	<input type="text" name="searchCourse">
	<input type="text" name="searchLocation">
	<button type="submit">Search</button>
</form>

<c:if test="${fn:length(institutesList) ge 0}">
<c:set var="count" value="0" scope="session"/>
<c:forEach var="InstitutesObj" items="${institutesList}">
	<c:set var="count" value="${count+1}" scope="session" />
	${InstitutesObj.instituteName }
	${InstitutesObj.instituteCourseTitle }
	${InstitutesObj.courseDescription }
	<a href="view_details.jsp">Details</a>
</c:forEach>
</c:if>

<c:if test="${fn:length(institutesList) eq 0}">
			
			 
			 Got no matches for you !
			 
			 NOTE:- Enter all of the above 3 search parameters.
		</c:if>
</body>
</html>
--%>
-->