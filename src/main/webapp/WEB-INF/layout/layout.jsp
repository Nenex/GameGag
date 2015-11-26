<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/static/js/vendor/jquery-2.1.4.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/vendor/bootstrap.min.js"></script>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/static/aperture/imagesico/favicon.png">
<!--[if IE]><![endif]-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/layout.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/login.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/datatables.min.css">
<script
	src="${pageContext.request.contextPath}/static/js/owlcarousel.js"></script>
<script src="${pageContext.request.contextPath}/static/js/layout.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/jquery.magnific-popup.min.js"></script>
<link
	href="${pageContext.request.contextPath}/static/css/js-image-slider.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style.css">
<script
	src="${pageContext.request.contextPath}/static/js/js-image-slider.js"
	type="text/javascript"></script>
</head>
<body id="pagetop" >

<nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/public">
      <img alt="" src="${pageContext.request.contextPath}/static/images/logo2.png"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <sec:authorize access="isAnonymous()">
        <li><a href="${pageContext.request.contextPath}/user/register"><button type="button" class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-user"></span></button></a></li>
        <li><a href="${pageContext.request.contextPath}/login"><button type="button" class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-log-in"></span></button></a></li>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
		  <li><a href="/logout"><button type="button" class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-log-out"></span></button></a></li>
	</sec:authorize>
	<li><a title="" href="#sidebar" class="togglepanel"><button type="button" class="btn btn-danger btn-lg"><span class="fa fa-bars"></span></button></a></li>
      </ul>
    </div>
  </div>
</nav>
	<div class="container clearfix ">
	</div>
	<div id="sidebar">
		<p class="closebutton">
			<a title="" href="javascript:$.pageslide.close()">x</a>
		</p>
		<div id="mainmenu" class="clearfix">
			<ul>
				<sec:authorize access="isAuthenticated()">
					<li>
						<div class="profile-image">
							<c:choose>
								<c:when test="${empty fileName}">
									<img class="circle" src="/static/upload/profil/anonyme.jpg"
										alt="Volton">
								</c:when>
								<c:otherwise>
									<img class="circle" src="/static/upload/profil/ ${fileName}"
										alt="Volton">
								</c:otherwise>
								</c:choose>
						</div>

						<div class="profile-content">
							<h3 class="profile-title textcenterlayout">
								<sec:authentication property="principal.firstName" />
							</h3>
							<h3 class="profile-title textcenterlayout">
								<sec:authentication property="principal.lastName" />
							</h3>
							<hr>
						</div>
					</li>
				</sec:authorize>
				<li class="active"><a title="" href="/public"><img alt=""
						class="iconmenu"
						src="${pageContext.request.contextPath}/static/images/menu/appbar.home.empty.png"><span
						class="menu_item">Accueil</span></a></li>
				<li><a class="menu_item" href=""><img alt=""
						class="iconmenu"
						src="${pageContext.request.contextPath}/static/images/menu/appbar.alien.png"><span
						class="menu_item">Category</span></a></li>
				<li><a class="menu_item" href=""><img alt=""
						class="iconmenu"
						src="${pageContext.request.contextPath}/static/images/menu/appbar.video.png"><span
						class="menu_item">Video</span></a></li>
				<li><a class="menu_item" href=""><img alt=""
						class="iconmenu"
						src="${pageContext.request.contextPath}/static/images/menu/appbar.image.multiple.png"><span
						class="menu_item">Gif</span></a></li>
				<sec:authorize access="isAuthenticated()">
					<li><a class="menu_item" href=""><img alt=""
							class="iconmenu"
							src="${pageContext.request.contextPath}/static/images/menu/appbar.social.dropbox.upload.png"><span
							class="menu_item">Post</span></a></li>
					<sec:authorize access="isAuthenticated()">
						<li><a class="menu_item" href="/user/profil"><img alt=""
								class="iconmenu"
								src="${pageContext.request.contextPath}/static/images/menu/appbar.social.dropbox.upload.png"><span
								class="menu_item">User profil</span></a></li>
					</sec:authorize>
				</sec:authorize>
				<sec:authorize
					access="hasAnyRole('ROLE_ADMIN','ROLE_MODERATOR') and isAuthenticated()">
					<li><a class="menu_item" href="/moderator"><img alt=""
							class="iconmenu"
							src="${pageContext.request.contextPath}/static/images/menu/appbar.chromakey.png"><span
							class="menu_item">Moderation</span></a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
					<li><a class="menu_item" href="/admin"><img alt=""
							class="iconmenu"
							src="${pageContext.request.contextPath}/static/images/menu/appbar.cog.png"><span
							class="menu_item">Admin Panel</span></a></li>
				</sec:authorize>
			</ul>
		</div>
		
	</div>
	<div class="container">
		<div class="content">
			<div id="view-holder">
				<sitemesh:write property="body" />
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/static/js/pageslide.min.js"></script>
</body>
</html>