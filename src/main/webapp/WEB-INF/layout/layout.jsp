<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    
<link rel="shortcut icon" href="${pageContext.request.contextPath}/static/aperture/imagesico/favicon.png">
<!--[if IE]><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layout.css">
<script src="${pageContext.request.contextPath}/static/js/vendor/jquery-2.1.4.js"></script>
<script src="${pageContext.request.contextPath}/static/js/owlcarousel.js"></script>
<script src="${pageContext.request.contextPath}/static/js/layout.js"></script>
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body id="pagetop">

<div id="sidebar">
    <p class="closebutton"><a title="" href="javascript:$.pageslide.close()">x</a></p>
	<div id="mainmenu" class="clearfix">
		<ul>
			<li class="active"><a title="" href="/public"><img alt="" src="${pageContext.request.contextPath}/static/images/menu/appbar.home.empty.png"><span class="menu_item">Accueil</span></a></li>
			<li><a class="menu_item" href=""><img alt="" src="${pageContext.request.contextPath}/static/images/menu/appbar.home.empty.png"><span class="menu_item">Menu Link 1</span></a></li>
			<li><a class="menu_item" href=""><img alt="" src="${pageContext.request.contextPath}/static/images/menu/appbar.home.empty.png"><span class="menu_item">Menu Link 2</span></a></li>
			<li><a class="menu_item" href=""><img alt="" src="${pageContext.request.contextPath}/static/images/menu/appbar.home.empty.png"><span class="menu_item">Menu Link 3</span></a></li>
			<li><a class="menu_item" href=""><img alt="" src="${pageContext.request.contextPath}/static/images/menu/appbar.home.empty.png"><span class="menu_item">Contact Us</span><a></li>
			<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
				<li><a class="menu_item" href="/admin"><img alt="" src="${pageContext.request.contextPath}/static/images/menu/appbar.home.empty.png"><span class="menu_item">Administration</span><a></li>
			</sec:authorize>
		</ul>
	</div>
</div>

<div class="container clearfix">
	<div id="headercont" class="bodycontainer clearfix">
		<h1><a title="" href="#">GameGag <span>Blablablabla</span></a></h1>
        <p>
       		<a title="" href="#sidebar" class="togglepanel"><span class="fa fa-bars"></span></a>
        	<sec:authorize access="isAnonymous()">
                    <a href="${pageContext.request.contextPath}/user/register"><spring:message code="label.navigation.registration.link"/></a>
                    <a href="${pageContext.request.contextPath}/auth/facebook"><button class="btn-facebook"><i class="icon-facebook"></i></a>
                    <a href="${pageContext.request.contextPath}/auth/twitter"><button class="btn btn-twitter"><i class="icon-twitter"></i></a>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
	               <a href="/logout" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-log-out"></span>Logout</a>
                </sec:authorize>
        </p>
	</div>
</div>



<div class="content">
        <div id="view-holder">
            <sitemesh:write property="body"/>
        </div>
    </div>

<script src="${pageContext.request.contextPath}/static/js/pageslide.min.js"></script>
</body>
</html>