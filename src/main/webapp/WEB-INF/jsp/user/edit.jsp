<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/js/vendor/jquery-2.1.4.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/vendor/bootstrap.min.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/static/aperture/imagesico/favicon.png">
	<!--[if IE]><![endif]-->
</head>
<body>
	<c:set var="fileName" value="${fileName}" />
	<c:set var="firstName" value="${firstName}" />
	<c:set var="lastName" value="${lastName}" />
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="modal-title">Edit user profil</h4>
	</div>
	<div class="modal-body">

		
		<form:form
			action="${pageContext.request.contextPath}/public/profil/edit"
			class="form-horizontal dropzone" commandName="postForm"
			method="POST" id="dropzone-form" enctype="utf8" role="form">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<input type="hidden" name="target" id="target" value="profil" />
			<input type="hidden" name="imgId" id="imgId" value="" />
			<div
				class="dz-default dz-message file-dropzone text-center well col-sm-12">

				<span class="glyphicon glyphicon-paperclip"></span> <span>
					Change image profil</span>
			</div>
			<!-- this is were the previews should be shown. -->
		<div class="dropzone-previews"></div>
		</form:form>
		<form:form
			action="${pageContext.request.contextPath}/public/profil/edit"
			class="form-horizontal" commandName="postForm" id="form-inf"
			method="POST" enctype="utf8" role="form">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<input type="text" name="firstName" id="firstName"
				value="${firstName}" />
			<input type="text" name="lastName" id="lastName"
				value="${lastName}" />
		</form:form>

<div class="modal-footer">
		<button id="upload-button" class="btn btn-primary" data-target="#modal">
			<span class="glyphicon glyphicon-upload"></span> Save
		</button>
		</div>
		
<script src="${pageContext.request.contextPath}/static/libs/dropzone.js"></script>
<script src="${pageContext.request.contextPath}/static/app.js"></script>
<script type="text/javascript">
	    
	    $(document).ready(function(){
	    	 var myDropzone = new Dropzone("form#dropzone-form");
	    });
	    
	    </script>
	</div>

	<%-- <sec:authentication property="principal.role" /> --%>
	
</body>
</html>