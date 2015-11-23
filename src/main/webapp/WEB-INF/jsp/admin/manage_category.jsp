<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="modal-title">Edit category</h4>
	</div>
	<form action="${pageContext.request.contextPath}/admin/manage_category" method="post">
		<c:set var="id" value="${category.id}" />
		<div class="modal-body">
			<input type="hidden" name="${_csrf.parameterName}"value="${category.id}" /> 
			<div class="form-group">
				<label>Label</label>
				<input type="text" class="form-control" name="label" value="${category.label}" /> 
			</div>
			<div class="form-group">
			<label>Image Url</label>
				<input type="text" class="form-control" name="imageUrl" value="${category.fileName}" />
			</div> 
			<div class="form-group">
			 <div class="checkbox">
			 <p> Activate / Disabled</p>
 				<label><input type="checkbox"  name="disabled" <c:if test="${category.disabled == 'true'}">checked</c:if>/></label>
			</div> 
			</div>
		</div>

		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<input type="submit" value="Edit" class="btn btn-info"/>
		</div>
	</form>
	<%-- <sec:authentication property="principal.role" /> --%>
</body>
</html>