<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/app/post.form.js"></script>
</head>
<body>
    <div class="page-header">
        <h1><spring:message code="label.user.registration.page.title"/></h1>
    </div>
    <sec:authorize access="hasRole('ROLE_USER')">
        <div class="panel panel-default">
            <div class="panel-body">
                <form:form action="${pageContext.request.contextPath}/public/post/add" commandName="postForm" method="POST" enctype="utf8" role="form">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="user_id" value="<sec:authentication property="principal.id" />" />
                    
                    <div class="row">
                    	<div id="form-group-Category" class="form-group col-lg-4">
		                     <span class="input">
		                     <label class="control-label" for="Category"><spring:message code="label.post.Category" />:</label>	
			                     <select name="id_category">
							          <c:forEach var="item" items="${categoryList}">
							            <option value="${item.id}">${item.label}</option>
							          </c:forEach>
							        </select>
							 </span>
						 </div>
                    </div>
                    <div class="row">
						<div id="form-group-Title" class="form-group col-lg-4">
							<label class="control-label" for="post-Title"><spring:message code="label.post.Title" />:</label>
							<input type="text" name="title"><br>
						</div>
					</div>
					<div class="row">
						<div id="form-group-Description" class="form-group col-lg-4">
							<label class="control-label" for="post-Title"><spring:message code="label.post.Description" />:</label>
							<input type="text" name="description"><br>
						</div>
					</div>
					<div class="row">
						<div id="form-group-Description" class="form-group col-lg-4">
							<label class="control-label" for="post-Title"><spring:message code="label.post.Filename" />:</label>
							<input type="text" name="filename"><br>
						</div>
					</div>
                    <button type="submit" class="btn btn-default"><spring:message code="label.post.Create"/></button>
                </form:form>
            </div>
        </div>
    </sec:authorize>
</body>
</html>