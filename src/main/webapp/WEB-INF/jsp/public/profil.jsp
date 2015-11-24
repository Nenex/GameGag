<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<c:set var="fileName" value="${fileName}" />
	<c:set var="firstName" value="${firstName}" />
	<c:set var="lastName" value="${lastName}" />
	<img height=160 src="\static\upload\profil\ ${fileName}"></img>
	<span>${firstName}</span>
	<span>${lastName}</span>
	
	
	<a href="/public/profil/edit/?person=${user.firstName}%20${user.lastName}" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#myModal">editer profil</a>
	<a href="/public/profil/editPassword/?person=${user.firstName}%20${user.lastName}" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#myModal">Changer de mot de passe</a>
				
	<!-- Modal HTML -->
	    <div id="myModal" class="modal fade">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <!-- Content -->
	            </div>
	        </div>
	    </div>
	    

	    
</body>
</html>