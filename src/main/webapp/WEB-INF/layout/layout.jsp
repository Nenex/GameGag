<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    

    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/vendor/jquery-2.1.4.js"></script>
    
<link rel="shortcut icon" href="${pageContext.request.contextPath}/static/aperture/imagesico/favicon.png">
<!--[if IE]><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/datatables.min.css">
<script src="${pageContext.request.contextPath}/static/js/owlcarousel.js"></script>
<script src="${pageContext.request.contextPath}/static/js/layout.js"></script>
</head>

<body id="pagetop">

<div id="sidebar">
    <p class="closebutton"><a title="" href="javascript:$.pageslide.close()">x</a></p>
	<div id="mainmenu" class="clearfix">
		<ul>
			<sec:authorize access="isAuthenticated()">
			<li>
				<div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="top-section">
                            <div class="profile-image">
                                <img  src="${pageContext.request.contextPath}/static/images/profile.jpg" alt="Volton">
                            </div>
			
                            <div class="profile-content">
                                <h3 class="profile-title"> <sec:authentication property="principal.firstName" /> </h3>
                                <h3 class="profile-title"> <sec:authentication property="principal.lastName" /></h3>
                            </div>
                        </div>
                    </div>
                </div>

			</li>
			</sec:authorize>
			<li class="active"><a title="" href="/public"><img alt="" class ="iconmenu" src="${pageContext.request.contextPath}/static/images/menu/appbar.home.empty.png"><span class="menu_item">Accueil</span></a></li>
			<li><a class="menu_item" href=""><img alt="" class ="iconmenu" src="${pageContext.request.contextPath}/static/images/menu/appbar.alien.png"><span class="menu_item">Category</span></a></li>
			<li><a class="menu_item" href=""><img alt="" class ="iconmenu" src="${pageContext.request.contextPath}/static/images/menu/appbar.video.png"><span class="menu_item">Video</span></a></li>
			<li><a class="menu_item" href=""><img alt="" class ="iconmenu" src="${pageContext.request.contextPath}/static/images/menu/appbar.image.multiple.png"><span class="menu_item">Gif</span></a></li>
			<sec:authorize access="isAuthenticated()">
			<li><a class="menu_item" href=""><img alt="" class ="iconmenu" src="${pageContext.request.contextPath}/static/images/menu/appbar.social.dropbox.upload.png"><span class="menu_item">Post</span></a></li>
			</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MODERATOR') and isAuthenticated()">
				<li><a class="menu_item" href="/moderator"><img alt="" class ="iconmenu" src="${pageContext.request.contextPath}/static/images/menu/appbar.chromakey.png"><span class="menu_item">Moderation</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
				<li><a class="menu_item" href="/admin"><img alt="" class ="iconmenu" src="${pageContext.request.contextPath}/static/images/menu/appbar.cog.png"><span class="menu_item">Admin Panel</span></a></li>
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
                    <a href="${pageContext.request.contextPath}/user/register" class="logout"><span class="glyphicon glyphicon-log-out"></span>Signup</a> 
                    <a href="${pageContext.request.contextPath}/login" class="logout"><span class="glyphicon glyphicon-log-out"></span>Login</a>  
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">       
	               <a href="/logout" class="logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a>
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