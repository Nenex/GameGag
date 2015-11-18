<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <c:set var="id" value="${id}"/>
 <c:set var="user_role" value="${user_role}"/>
 <c:set var="person" value="${person}"/>
 <p>${person} has currently ${user_role} right.<p>
	<form action="${pageContext.request.contextPath}/admin/manage" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="id" value="${id}"/>
		<select name="role">
		  <c:forEach var="role" items="${role}">
		  <c:choose>
			    <c:when test="${user_role==role}">
			        <option value="${role}" selected>${role}</option>
			    </c:when>    
			    <c:otherwise>
			        <option value="${role}">${role}</option>
			    </c:otherwise>
			</c:choose>
		  </c:forEach>
		  <input type="submit" value="reg"/>
		  </select>
	</form>
	<%-- <sec:authentication property="principal.role" /> --%>
</body>
</html>