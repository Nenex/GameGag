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
	src="${pageContext.request.contextPath}/static/js/app/post.form.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-lg-10">
			<fieldset>
				<legend>
					<spring:message code="label.post.page.title" />
				</legend>
				<form:form
					action="${pageContext.request.contextPath}/public/post/add"
					class="form-horizontal" commandName="postForm" id="form-inf"
					method="POST" enctype="utf8" role="form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<input type="hidden" name="user_id"
						value="<sec:authentication property="principal.id" />" />

					<div class="form-group">
						<label class="col-lg-3 control-label" for="Category"><spring:message
								code="label.post.Category" />:</label>
						<div class="col-lg-6">
							<select class="form-control" name="id_category" id="id_category">
								<c:forEach var="item" items="${categoryList}">
									<option value="${item.id}">${item.label}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="lastName" class="col-lg-3 control-label"><spring:message
								code="label.post.Title" /></label>
						<div class="col-lg-6">
							<input type="text" class="form-control" name="title">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-lg-3 control-label"><spring:message
								code="label.post.Description" /></label>
						<div class="col-lg-6">
							<input type="text" class="form-control" name="description">
						</div>
					</div>
		
				</form:form>
				
				
				<form:form
					action="${pageContext.request.contextPath}/public/post/add"
					class="form-horizontal  dropzone" commandName="postForm"
					method="POST" id="dropzone-form" enctype="utf8" role="form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<input type="hidden" name="target" id ="target"
						value="post"/>
					<input type="hidden" name="imgId" id ="imgId"
						value=""/>
					<div
							class="dz-default dz-message file-dropzone text-center well col-sm-12">

							<span class="glyphicon glyphicon-paperclip"></span> <span>
								Attach file, drag and drop here</span>
						</div>

						<!-- this is were the previews should be shown. -->
						<div class="dropzone-previews">
						</div>
					
					</form:form>
				<button id="upload-button" class="btn btn-primary">
						<span class="glyphicon glyphicon-upload"></span> Save
					</button>
			</fieldset>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/libs/dropzone.js"></script>
	<script src="${pageContext.request.contextPath}/static/app.js"></script>
</body>