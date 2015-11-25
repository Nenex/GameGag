<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<body>
	
		
		<form:form
			action="http://gamegag.com:8080/public/user/savePassword"
			class="form-horizontal" commandName="postForm"
			method="POST"  enctype="utf8" role="form">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			
			<input type="text" name="password"/>
			<input type="submit" value="submit"/>
			<!-- this is were the previews should be shown. -->
		<div class="dropzone-previews"></div>
		</form:form>
		


	
	</div>
</body>
</html>