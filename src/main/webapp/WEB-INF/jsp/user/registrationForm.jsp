<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title></title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/app/user.form.js"></script>
</head>
<body>
	<!--     <div class="page-header"> -->
	<%--         <h1><spring:message code="label.user.registration.page.title"/></h1> --%>
	<!--     </div> -->
	<div class="panel panel-default">
		<div class="panel-body">
			<form:form action="${pageContext.request.contextPath}/user/register"
				commandName="user" method="POST" enctype="utf8" role="form">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<c:if test="${user.signInProvider != null}">
					<form:hidden path="signInProvider" />
				</c:if>
				<div class="row">
					<div id="form-group-firstName" class="form-group col-lg-4">
						<label class="control-label" for="user-firstName"><spring:message
								code="label.user.firstName" />:</label>
						<form:input id="user-firstName" path="firstName"
							cssClass="form-control" />
						<form:errors id="error-firstName" path="firstName"
							cssClass="help-block" />
					</div>
				</div>
				<div class="row">
					<div id="form-group-lastName" class="form-group col-lg-4">
						<label class="control-label" for="user-lastName"><spring:message
								code="label.user.lastName" />:</label>
						<form:input id="user-lastName" path="lastName"
							cssClass="form-control" />
						<form:errors id="error-lastName" path="lastName"
							cssClass="help-block" />
					</div>
				</div>
				<div class="row">
					<div id="form-group-email" class="form-group col-lg-4">
						<label class="control-label" for="user-email"><spring:message
								code="label.user.email" />:</label>
						<form:input id="user-email" path="email" cssClass="form-control" />
						<form:errors id="error-email" path="email" cssClass="help-block" />
					</div>
				</div>
				<c:if test="${user.signInProvider == null}">
					<div class="row">
						<div id="form-group-password" class="form-group col-lg-4">
							<label class="control-label" for="user-password"><spring:message
									code="label.user.password" />:</label>
							<form:password id="user-password" path="password"
								cssClass="form-control" />
							<form:errors id="error-password" path="password"
								cssClass="help-block" />
						</div>
					</div>
					<div class="row">
						<div id="form-group-passwordVerification"
							class="form-group col-lg-4">
							<label class="control-label" for="user-passwordVerification"><spring:message
									code="label.user.passwordVerification" />:</label>
							<form:password id="user-passwordVerification"
								path="passwordVerification" cssClass="form-control" />
							<form:errors id="error-passwordVerification"
								path="passwordVerification" cssClass="help-block" />
						</div>
					</div>
				</c:if>
				<button type="submit" class="btn btn-default">
					<spring:message code="label.user.registration.submit.button" />
				</button>
			</form:form>
		</div>
	</div>




	<!DOCTYPE html>
	<%@ page contentType="text/html;charset=UTF-8" language="java"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<%@ taglib prefix="sec"
		uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title></title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/app/user.form.js"></script>
</head>
<body>
	<!--     <div class="page-header"> -->
	<%--         <h1><spring:message code="label.user.registration.page.title"/></h1> --%>
	<!--     </div> -->


	<sec:authorize access="isAnonymous()">
		<div
			class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong> Signin </strong>
				</div>
				<div class="panel-body">
					<form:form
						action="${pageContext.request.contextPath}/user/register"
						commandName="user" method="POST" enctype="utf8" role="form">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<c:if test="${user.signInProvider != null}">
							<form:hidden path="signInProvider" />
						</c:if>
						<br />
						<div class="form-group input-group">
							<span class="input-group-addon"><i
								class="fa fa-circle-o-notch"></i></span>
							<form:input id="user-firstName" path="firstName"
								cssClass="form-control" placeholder="firstName" />
							<form:errors id="error-firstName" path="firstName"
								cssClass="help-block" />

						</div>
						<div class="form-group input-group">
							<span class="input-group-addon"><i class="fa fa-tag"></i></span>
							<form:input id="user-lastName" path="lastName"
								cssClass="form-control" placeholder="lastName" />
							<form:errors id="error-lastName" path="lastName"
								cssClass="help-block" />
						</div>
						<div class="form-group input-group">
							<span class="input-group-addon">@</span>
							<form:input id="user-email" path="email" cssClass="form-control"
								placeholder="Email" />
							<form:errors id="error-email" path="email" cssClass="help-block" />
						</div>
						<c:if test="${user.signInProvider == null}">
							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<form:password id="user-password" path="password"
									placeholder="password" cssClass="form-control" />
								<form:errors id="error-password" path="password"
									cssClass="help-block" />
							</div>
							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<form:password id="user-passwordVerification"
									path="passwordVerification" cssClass="form-control"
									placeholder="passwordVerification" />
								<form:errors id="error-passwordVerification"
									path="passwordVerification" cssClass="help-block" />
							</div>
						</c:if>
						<button type="submit" class="btn btn-default">
							<spring:message code="label.user.registration.submit.button" />
						</button>

					</form:form>
				</div>

			</div>
		</div>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<p>
			<spring:message code="text.registration.page.authenticated.user.help" />
		</p>
	</sec:authorize>
</body>
</html>