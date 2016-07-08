<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | The Right Institute</title>
	
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
                          
                        <%try {
								if(request.getSession().getAttribute("user-name")==null){
						%>
                        <li class="active"><a href="signin.jsp">Register Now</a></li>
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
		
    </header><!--/header-->

    <section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">

                <div class="item active" style="background-image: url(views/images/slider/bg1.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                	<%try {
									if(request.getSession().getAttribute("user-name")==null){
									%>
                        			<form id="main-login-form" class="login-form" name="login-form" method="post" action="login">
                                    <h2 class="animation animated-item-1">
                            			<input type="text" name="uname" class="form-control" placeholder="Enter the Username" required="required"></h2>
                                    <h2 class="animation animated-item-2">
                            			<input type="password" name="pswd" class="form-control" placeholder="Enter the Password" required="required"></h2>
                                    <h2 class="btn-slide animation animated-item-3">
                                    	<button type="submit" name="submit" class="btn btn-primary btn-lg">Login to <b>The Right Institute</b></button></h2>
                                    </form>
                       				 <%}
									}catch(Exception e){
										e.printStackTrace();
									}
									%>
									
                                </div>
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(views/images/slider/bg2.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <%try {
									if(request.getSession().getAttribute("user-name")==null){
									%>
                        			<form id="main-login-form" class="login-form" name="login-form" method="post" action="login">
                                    <h2 class="animation animated-item-1">
                            			<input type="text" name="uname" class="form-control" placeholder="Enter the Username" required="required"></h2>
                                    <h2 class="animation animated-item-2">
                            			<input type="password" name="pswd" class="form-control" placeholder="Enter the Password" required="required"></h2>
                                    <h2 class="btn-slide animation animated-item-3">
                                    	<button type="submit" name="submit" class="btn btn-primary btn-lg">Login to <b>The Right Institute</b></button></h2>
                                    </form>
                       				 <%}
									}catch(Exception e){
										e.printStackTrace();
									}
									%>
                                </div>
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(views/images/slider/bg3.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <%try {
									if(request.getSession().getAttribute("user-name")==null){
									%>
                        			<form id="main-login-form" class="login-form" name="login-form" method="post" action="login">
                                    <h2 class="animation animated-item-1">
                            			<input type="text" name="uname" class="form-control" placeholder="Enter the Username" required="required"></h2>
                                    <h2 class="animation animated-item-2">
                            			<input type="password" name="pswd" class="form-control" placeholder="Enter the Password" required="required"></h2>
                                    <h2 class="btn-slide animation animated-item-3">
                                    	<button type="submit" name="submit" class="btn btn-primary btn-lg">Login to <b>The Right Institute</b></button></h2>
                                    </form>
                       				 <%}
									}catch(Exception e){
										e.printStackTrace();
									}
									%>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
        <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
            <i class="fa fa-chevron-left"></i>
        </a>
        <a class="next hidden-xs" href="#main-slider" data-slide="next">
            <i class="fa fa-chevron-right"></i>
        </a>
    </section><!--/#main-slider-->
    
    <section id="feature" >
        <div class="container">
           <div class="center wow fadeInDown">
                <h2>Features</h2>
                <p class="lead"><b>THE RIGHT INSTITUTE</b> is the right place to look for if U r tryin' to find information about new courses to learn.<br>You can opt "the Right Institute" at your nearest location. </p>
            </div>

            <div class="row">
                <div class="features">
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-bullhorn"></i>
                            <h2>Accurate Information</h2>
                            <h3>Precise information of the batches of various courses.</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-comments"></i>
                            <h2>Easy to search</h2>
                            <h3>Easy to find particular course depending on Institute Name and Course name</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-cloud-download"></i>
                            <h2>Search according to Place</h2>
                            <h3>One can easily find a particular course in his location.</h3>
                        </div>
                    </div><!--/.col-md-4-->
                
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-leaf"></i>
                            <h2>Institutes can update information</h2>
                            <h3>Institutes can provide Info about their upcoming courses.</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-cogs"></i>
                            <h2>Self operating mechanism</h2>
                            <h3>Institutes can post and interested students can read directly.</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-heart"></i>
                            <h2>Patch-up with large Institutes</h2>
                            <h3>Reputed institutes promoting Info for bulk admission.</h3>
                        </div>
                    </div><!--/.col-md-4-->
                </div><!--/.services-->
            </div><!--/.row-->    
        </div><!--/.container-->
    </section><!--/#feature-->

    <section id="partner">
        <div class="container">
            <div class="center wow fadeInDown">
                <h2>Our Partners</h2>
                <p class="lead"> India's Reputed Training Institutes with world-class facilities are also providing <br> assistance now to interested candidates through  US.</p>
            </div>    

            <div class="partners">
                <ul>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" src="views/images/partners/partner1.png"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" src="views/images/partners/partner2.png"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms" src="views/images/partners/partner3.png"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1200ms" src="views/images/partners/partner4.png"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1500ms" src="views/images/partners/partner5.png"></a></li>
                </ul>
            </div>        
        </div><!--/.container-->
    </section><!--/#partner-->
    

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
<%try {
	if(request.getSession().getAttribute("user-name")==null){
%>
		<a href = "index.jsp">Login</a>
		<a href = "signin.jsp">Register</a>
<%} else { %>
<a href = "logout">Logout</a>
<%}

}catch(Exception e){
	e.printStackTrace();
}
%>		--%>
<form method="post" action="login">
	<input type="text" name="uname"/>
	<input type="password" name="pswd"/>
	<button type="submit">Login</button>
</form>
</body>
</html>
-->