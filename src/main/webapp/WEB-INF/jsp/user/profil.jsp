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


	<div
		class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
		<div class="panel panel-default">
			<div class="panel-heading">
				<strong> Profil </strong>
			</div>
			<div class="panel-body">
			
				<img height=160 src="\static\upload\profil\ ${fileName}"></img>
				<form:form action="${pageContext.request.contextPath}/user/profil"
					class="form-horizontal dropzone" commandName="postForm"
					method="POST" id="dropzone-form" enctype="utf8" role="form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<input type="hidden" name="target" id="target" value="profil" />
					<input type="hidden" name="imgId" id="imgId" value="${id}" />

					<div
						class="dz-default dz-message file-dropzone text-center well col-sm-12">

						<span class="glyphicon glyphicon-paperclip"></span><span> Change image
						profil</span>
					</div>
					<!-- this is were the previews should be shown. -->
					<div class="dropzone-previews" id="drop-follow"></div>
				</form:form>

				<form:form action="${pageContext.request.contextPath}/user/profil"
					class="form-horizontal" commandName="profil" id="form-inf"
					method="POST" enctype="utf8" role="form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<div class="form-group input-group">
						<span class="input-group-addon"><i
							class="fa fa-circle-o-notch"></i></span>
						<form:input id="profil-firstName" path="firstName"
							cssClass="form-control" placeholder="firstName" />
						<span id="error-firstName"></span>

					</div>
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-tag"></i></span>
						<form:input id="profil-lastName" path="lastName"
							cssClass="form-control" placeholder="lastName" />
						<span id="error-lastName"></span>
					</div>

					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<form:password id="profil-password" path="password"
							placeholder="password" cssClass="form-control" />
						<span id="error-password"></span>
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<form:password id="profil-passwordVerification"
							path="passwordVerification" cssClass="form-control"
							placeholder="passwordVerification" />
						<span id="error-passwordVerification"></span>
					</div>

					<%-- <button type="submit" class="btn btn-default">
						<spring:message code="label.user.registration.submit.button" />
					</button> --%>
					<span id="error"></span>
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