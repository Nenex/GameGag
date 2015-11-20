<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title></title>
<body>

    <div id="sliderFrame">
        <div id="slider">
            <img src="${pageContext.request.contextPath}/static/images/slide/image-slider-1.jpg" alt="Welcome to GameGag" />
            <img src="${pageContext.request.contextPath}/static/images/slide/image-slider-2.jpg" alt="Blabla" />
            <img src="${pageContext.request.contextPath}/static/images/slide/image-slider-3.jpg" alt="Blabla" />
            <img src="${pageContext.request.contextPath}/static/images/slide/image-slider-4.jpg" alt="Blabla" />
            <img src="${pageContext.request.contextPath}/static/images/slide/image-slider-5.jpg" alt="Blabla" />
        </div>
</div>


<div class="container">
<sec:authorize access="isAuthenticated()">

	<div class="page-header">
		<h1>
			<spring:message code="label.homepage.title" />
			<sec:authentication property="principal.firstName" />
		</h1>
	</div>
</sec:authorize>
</div>
</body>
</html>
