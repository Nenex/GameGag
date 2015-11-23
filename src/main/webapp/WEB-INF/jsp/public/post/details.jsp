<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>	
	<div class="col-lg-3 col-md-4 col-xs-6 thumb" id="${post.id}">
		<h1>${posts.comments}</h1>
		<img class="img-responsive" src="${post.filename}">
		<input type="button" value="+">
		<input type="button" value="-">
	</div>
	<c:forEach var="comment"  items="${posts.comments}" begin="1" end="5"  >
		 	${comment.comment}
	</c:forEach>
</body>
</html>