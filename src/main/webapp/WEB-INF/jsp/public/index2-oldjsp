<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title></title>
<body>
<sec:authorize access="isAuthenticated()">

	<div class="page-header">
		<h1>
			<spring:message code="label.homepage.title" />
			<sec:authentication property="principal.firstName" />
			<sec:authentication property="principal.lastName" />
		</h1>
	</div>
</sec:authorize>
</body>
</html>