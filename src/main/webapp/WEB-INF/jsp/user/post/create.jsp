<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>

<body>

<div
		class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
		<div class="panel panel-default">
			<div class="panel-heading">
				<strong> Post </strong>
			</div>
			<div class="panel-body">
			
				<form:form action="${pageContext.request.contextPath}/user/post/add"
					class="form-horizontal dropzone" commandName="postForm"
					method="POST" id="dropzone-form" enctype="utf8" role="form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<input type="hidden" name="target" id="target" value="post" />
					<input type="hidden" name="imgId" id="imgId" value="${id}" />

					<div
						class="dz-default dz-message file-dropzone text-center well col-sm-12">

						<span class="glyphicon glyphicon-paperclip"></span><span> Upload image
						</span>
					</div>
					<!-- this is were the previews should be shown. -->
					<div class="dropzone-previews" id="drop-follow"></div>
				</form:form>

				<form:form action="${pageContext.request.contextPath}/user/post/add"
					class="form-horizontal" commandName="post" id="form-inf"
					method="POST" enctype="utf8" role="form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-group">
						<label class="col-lg-3 control-label" for="Category"><spring:message
								code="label.post.Category" /></label>
						<div class="col-lg-6">
							<select class="form-control" name="id_category" id="id_category">
								<c:forEach var="item" items="${categoryList}">
									<option value="${item.id}">${item.label}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="form-group input-group">
						<span class="input-group-addon"><i
							class="fa fa-circle-o-notch"></i></span>
						<form:input id="post-title" path="title"
							cssClass="post-control col-sm-12" placeholder="title" /><br>
						<span id="error-title"></span>

					</div>
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-tag"></i></span>
						<form:textarea id="post-description" path="description"
							cssClass="post-control col-sm-12" placeholder="description" />
						<span id="error-description"></span>
					</div><br>
					<span id="error"></span>
				</form:form>
				<button id="upload-button" class="btn btn-primary col-md-offset-9">
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