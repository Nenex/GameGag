<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>	
<div class="container">	
	<div class="row text-center">

<div class="col-md-12"><h2  style="margin:0;"><b>${post.title}</b></h2></div>

<hr />

</div>
<a href="/public"><button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-home"></span> Home</button></a>
		<div class="col-md-6 thumb">
		
			<a class="image-popup-vertical-fit thumb" href="${post.filename}"title="${post.title}"> <img class="img-responsive details"
				src="${post.filename}">
			</a>
		</div>

		<div class="col-md-6 columns">
  <h2>Description</h2>
  <p>${post.description}</p>  
  <h2>Votes</h2>
	<p>${fn:length(votes)}</p>
	<button type="button" class="btn btn-success btn-lg"><span class="glyphicon glyphicon-thumbs-up"></span> Like</button>
	<button type="button" class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-thumbs-down"></span> Dislike</button>
	<button type="button" class="btn btn-info btn-lg" ><span class="glyphicon glyphicon-edit"></span> Comment</button>
</div>

</div>

	<div class="row">

		<div class="col-md-10">

			<div class="status-upload">
				<form>
					<textarea placeholder="What are you doing right now?"></textarea>

					<button type="submit" class="btn btn-success green">
						<i class="fa fa-share"></i> Share
					</button>
				</form>
			</div>
			<!-- Status Upload  -->
		</div>

	</div>
	</div>



	<script type="text/javascript">
		$(document).ready(function() {
			$(".thumb").magnificPopup({
				delegate: "a", // selection de la balise des liens des images
				type: "image",
				
				// autres options
		});
	});
	</script>	
</body>


</html>