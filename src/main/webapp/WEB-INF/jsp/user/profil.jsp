<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>

<body>
	<c:set var="fileName" value="${fileName}" />
	<c:set var="firstName" value="${firstName}" />
	<c:set var="lastName" value="${lastName}" />
	<c:set var="id" value="${id}" />


	<div class="container" style="padding-top: 60px;">
		<h1 class="page-header">Edit Profile</h1>
		<div class="row">
			<!-- left column -->
			<div class="col-md-4 col-sm-6 col-xs-12">
				<div class="text-center">
					<img height=160 src="\static\upload\profil\ ${fileName}"></img>
					<form:form action="${pageContext.request.contextPath}/user/profil"
						class="form-horizontal dropzone" commandName="postForm"
						method="POST" id="dropzone-form" enctype="utf8" role="form">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<input type="hidden" name="ignore" value="ignore" id="ignore" />
						<input type="hidden" name="target" id="target" value="profil" />
						<input type="hidden" name="imgId" id="imgId" value="${id}" />

						<div
							class="dz-default dz-message file-dropzone text-center well col-sm-12">

							<span class="glyphicon glyphicon-paperclip"></span><span>
								Change image profil</span>
						</div>
						<!-- this is were the previews should be shown. -->
						<div class="dropzone-previews" id="drop-follow"></div>
					</form:form>
				</div>
			</div>
			<!-- edit form column -->
			<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
				<h3>Personal info</h3>
				<form:form action="${pageContext.request.contextPath}/user/profil"
					class="form-horizontal" commandName="profil" id="form-inf"
					method="POST" enctype="utf8" role="form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />




					<div class="form-group">
						<label class="col-lg-3 control-label">First name:</label>
						<div class="col-lg-8">
							<form:input id="profil-firstName" path="firstName"
								cssClass="form-control" placeholder="firstName" />
							<span id="error-firstName"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Last name:</label>
						<div class="col-lg-8">
							<form:input id="profil-lastName" path="lastName"
								cssClass="form-control" placeholder="lastName" />
							<span id="error-lastName"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Password:</label>
						<div class="col-lg-8">
							<form:password id="profil-password" path="password"
								placeholder="password" cssClass="form-control" />
							<span id="error-password"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">Password:</label>
						<div class="col-lg-8">
							<form:password id="profil-passwordVerification"
								path="passwordVerification" cssClass="form-control"
								placeholder="password verification" />
							<span id="error-passwordVerification"></span>
						</div>
					</div>
					<%-- <button type="submit" class="btn btn-default">
						<spring:message code="label.user.registration.submit.button" />
					</button> --%>
					<span id="error"></span>
					<span id="success"></span>
				</form:form>
				<button id="upload-button" class="btn btn-primary">
					<span class="glyphicon glyphicon-upload"></span> Save
				</button>
			</div>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/static/libs/dropzone.js"></script>
	<script src="${pageContext.request.contextPath}/static/app.js"></script>
</body>
</html>