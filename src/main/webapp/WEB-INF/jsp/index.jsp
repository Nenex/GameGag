<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<%-- <head>
<title></title>
<body>
<sec:authorize access="isAuthenticated()">

	<div class="page-header">
		<h1>
			<spring:message code="label.homepage.title" />
			<sec:authentication property="principal.firstName" />
			<sec:authentication property="principal.lastName" />
		</h1>
	</div>
</sec:authorize>
<sec:authorize access="isAnonymous()">
 <script type="text/javascript">window.location.href="/login";</script>
	
</sec:authorize>


</body> --%>


<head>
	<!-- Metas
	================================================== -->
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, user-scalable=no, target-densitydpi=device-dpi"/>
	<meta name="description" content="Birva Creative Studio - Bootstrap Multipurpose One Page HTML Theme" />
	<meta name="keywords" content="Bootstrap 3,html5,css3,jquery,portfolio,creative,design,personal" />
	<meta name="author" content="" />
	
	<!-- Page Title 
	================================================== -->
	<title>GameGag</title>
	
	<!-- Favicon 
	================================================== -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.html"/>
	
	<!-- Google fonts
	================================================== -->
	<link href='http://fonts.googleapis.com/css?family=Oswald:300,400,500,700' rel='stylesheet' type='text/css' />    
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,600,700,800,300' rel='stylesheet' type='text/css' />
	
	<!-- bootstrap v3.0.2
	================================================== -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.css">
	
	<!--font-awesome
	================================================== -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.css">
	
	
	<!-- CSS Custom
	================================================== -->    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/magnific-popup.css">
	<link rel="stylesheet" type="text/css" id="color" href="${pageContext.request.contextPath}/static/css/colors/color-default.css">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="${pageContext.request.contextPath}/static/js/html5shiv.js"></script>
      <script src="${pageContext.request.contextPath}/static/js/respond.min.js"></script>
    <![endif]-->
   </head>

<body data-twttr-rendered="true" data-spy="scroll" data-target="#my-nav">

<!-- Banner section-->
<section class="banner" id="header">
	<div class="banner-pattern">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<!--logo-->
					<div class="main-photo" id="header-photo">
						<img width="120" height="120" class="banner-logo pulsate-opacity" src="${pageContext.request.contextPath}/static/images/01_logo.png" alt="">
					</div>
					<!-- heading -->
					<h1 style="opacity: 1; padding-top: 0px;" class="funny-text">Game GaG</h1>
					<!-- ticker -->
					<ul id="aboutme">
						<li>Insta Game</li>
						<li>Best Funny Pics Game &amp; GIFs, Videos </li>		
					</ul>
					<!--social icon -->
					<div class="social">
						<div class="sideline"></div>
						<a title="Twitter" target="_blank" href="/auth/twitter"><span class="icon-circle large"><i class="fa fa-twitter"></i></span></a>
						<a title="facebook" target="_blank" href="/auth/facebook"><span class="icon-circle large"><i class="fa fa-facebook"></i></span></a>
						<div class="sideline"></div>
					</div>
					<!--Action button-->
					<p>
						<a href="/public" class="btn btn-outline-white btn-small btnmore">Enter</a>
					</p>
				</div>
			</div>
		</div>		
	</div>
</section>
<!-- End of Banner -->








<!-- Bootstrap core JavaScript, plugin and custom scripts
================================================== -->

<script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/modernizr.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.funnyText.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/masonry.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.appear.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.cslider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.mixitup.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/classie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/imagesloaded.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.parallax-1.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/parallaxInit.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.flexisel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/perfect-scrollbar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/carousel-slider.js"></script>
<script type='text/javascript' src="${pageContext.request.contextPath}/static/js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/tweetable.jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.timeago.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.placeholder.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/scripts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/switcher.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/app/fb-hack.js"></script>

<script>
jQuery(document).ready(function() {
	// Pie Charts
	'use strict';
	var pieChartClass = 'pieChart',
    pieChartLoadedClass = 'pie-chart-loaded';
	function initPieCharts() {
		var chart = $('.' + pieChartClass);
		chart.each(function() {
			$(this).appear(function() {
				var $this = $(this),
					chartBarColor = ($this.data('bar-color')) ? $this.data('bar-color') : "#ff0000",
					chartBarWidth = ($this.data('bar-width')) ? ($this.data('bar-width')) : 150
				if( !$this.hasClass(pieChartLoadedClass) ) {
					$this.easyPieChart({
						animate: 2000,
						size: chartBarWidth,
						lineWidth: 6,
						scaleColor: false,
						trackColor: "#eeeeee",
						barColor: chartBarColor,
					}).addClass(pieChartLoadedClass);
				}
			});
		});
	}
	initPieCharts();
});
</script>
<script type="text/javascript">
		$(document).ready(function() {
			'use strict';
			$('.funny-text').funnyText({
				speed: 700,
				activeColor: '#ff0000',
				color: '#fff',
				fontSize: '1em',
				borderColor: 'none'
			});
			
		});
	</script>

</body>
</html>