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
					class="form-horizontal" commandName="postForm" method="POST"
					enctype="utf8" role="form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<input type="hidden" name="user_id"
						value="<sec:authentication property="principal.id" />" />

					<div class="form-group">
						<label class="col-lg-3 control-label" for="Category"><spring:message
								code="label.post.Category" />:</label>
						<div class="col-lg-6">
							<select class="form-control" name="id_category">
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
					<div class="form-group">
						<label for="email" class="col-lg-3 control-label"><spring:message
								code="label.post.Filename" /></label>
						<div class="col-lg-6">
							<input type="text" class="form-control" name="filename">
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-3 col-lg-10">
							<button type="submit" class="btn btn-default">
								<spring:message code="label.post.Create" />
							</button>
						</div>
					</div>
				</form:form>
			</fieldset>
		</div>
	</div>
</body>