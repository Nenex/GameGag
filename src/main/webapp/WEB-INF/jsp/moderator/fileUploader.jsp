<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/libs/bootstrap-3.1.1/css/bootstrap.min.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/libs/bootstrap-dialog/css/bootstrap-dialog.min.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">	

<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				<h3>Spring MVC + Dropzone.js Example</h3>
			</div>
			<div class="panel-body">
				<div>
					<form id="dropzone-form" class="dropzone" action="${pageContext.request.contextPath}/upload" method="post" 
						enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
						<div
							class="dz-default dz-message file-dropzone text-center well col-sm-12">

							<span class="glyphicon glyphicon-paperclip"></span> <span>
								To attach files, drag and drop here</span><br> <span>OR</span><br>
							<span>Just Click</span>
						</div>

						<!-- this is were the previews should be shown. -->
						<div class="dropzone-previews"></div>
						<input type="submit" value="test" />
					</form>
					<hr>
					<button id="upload-button" class="btn btn-primary">
						<span class="glyphicon glyphicon-upload"></span> Upload
					</button>
					<a class="btn btn-primary pull-right" href="list">
						<span class="glyphicon glyphicon-eye-open"></span> View All Uploads
					</a>
				</div>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/static/libs/jquery/jquery-2.1.1.js"></script>
	<script src="${pageContext.request.contextPath}/static/libs/bootstrap-3.1.1/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/static/libs/bootstrap-dialog/js/bootstrap-dialog.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/libs/dropzone.js"></script>
	<script src="${pageContext.request.contextPath}/static/app.js"></script>
		
</body>
</html>