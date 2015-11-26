<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/social-buttons-3.css" />
</head>
<body>
	<div class="container">
		<sec:authorize access="isAnonymous()">

			<c:if test="${param.error eq 'bad_credentials'}">
				<div class="alert alert-danger alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">&times;</button>
					<spring:message code="text.login.page.login.failed.error" />
				</div>
			</c:if>
			<form action="${pageContext.request.contextPath}/login/authenticate"
				method="POST" role="form" class="form-signin">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<h3 class="heading-desc">Login</h3>
				<div class="social-box">
					<div class="row mg-btm">
						<div class="col-md-12">
							<a href="/auth/facebook" class="btn btn-primary btn-block"> <i
								class="icon-facebook"></i> &nbsp;&nbsp;&nbsp;Login with Facebook
							</a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<a href="/auth/twitter" class="btn btn-info btn-block"> <i
								class="icon-twitter"></i> &nbsp;&nbsp;&nbsp;Login with Twitter
							</a>
						</div>
					</div>
				</div>
				<div class="main">

					<input type="text" class="form-control" placeholder="Email"
						id="user-email" name="username" class="form-control" autofocus>
					<input type="password" class="form-control" id="user-password"
						name="password" placeholder="Password"> <span
						class="clearfix"></span>
				</div>
				<div class="login-footer">
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<div class="left-section">
								<a href="/user/register">Sign up now</a>
							</div>
						</div>
						<div class="col-xs-6 col-md-6 pull-right">
							<button id="singlebutton" name="singlebutton"
								class="btn btn-large btn-danger pull-right">Login</button>
						</div>
					</div>
			</form>

		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<p>
				<spring:message code="text.login.page.authenticated.user.help" />
			</p>
		</sec:authorize>
	</div>
</body>
</html>