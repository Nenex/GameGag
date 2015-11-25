<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
  <sec:authorize access="isAuthenticated()">  	
	<button type="button" id="btnVotePlus" onclick="votePlus()" class="btn btn-success btn-lg" <c:if test="${not empty userVote and userVote == true}"> disabled</c:if>><span class="glyphicon glyphicon-thumbs-up"></span><span id="votePlus">${voteplus}</span> Like</button>
	<button type="button" id="btnVoteMoins" onclick="voteMoins()" class="btn btn-danger btn-lg" <c:if test="${not empty userVote and userVote == false}"> disabled</c:if>><span class="glyphicon glyphicon-thumbs-down"></span><span id="voteMoins">${votemoins}</span> Dislike</button>
	<button type="button" class="btn btn-info btn-lg" ><span class="glyphicon glyphicon-edit"></span> Comment</button>
  </sec:authorize>
  	<sec:authorize access="isAnonymous()">
	<button type="button" class="btn btn-success btn-lg"><span class="glyphicon glyphicon-thumbs-up"></span><span id="votePlus">${voteplus}</span> Like</button>
	<button type="button" class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-thumbs-down"></span><span id="voteMoins">${votemoins}</span> Dislike</button>
	<button type="button" class="btn btn-info btn-lg" ><span class="glyphicon glyphicon-edit"></span> Comment</button>
    </sec:authorize>
</div>

</div>
		<c:forEach var="comment"  items="${comments}">
		<br />
			${comment.user.firstName}
		 	${comment.comment}
		</c:forEach>
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
	<script type="text/javascript">
		function votePlus() {
			var cptPlus = parseInt($("#votePlus").html());			
			cptPlus = cptPlus + 1;
			$.ajax({
				url: '/user/post/vote/${post.id}/true',
				type: 'get',
				success: function(vote) {
					$("#votePlus").text(cptPlus.toString());
				}
				
			});
			if($('#btnVoteMoins').prop('disabled')) {
				var cptMoins = parseInt($("#voteMoins").html());
				cptMoins = cptMoins - 1;
				$("#voteMoins").text(cptMoins.toString());
		    }
			$("#btnVotePlus").attr("disabled", "disabled").button('refresh');
			$("#btnVoteMoins").removeAttr("disabled", "disabled").button('refresh');
		}
		
		function voteMoins() {	 
			var cptMoins = parseInt($("#voteMoins").html());
			cptMoins = cptMoins + 1;
			$.ajax({				
				url: '/user/post/vote/${post.id}/false',
				type: 'get',
				success: function(vote) {
					$("#voteMoins").text(cptMoins.toString());
				}
			});
			if($('#btnVotePlus').prop('disabled')) {
				var cptPlus = parseInt($("#votePlus").html());
				cptPlus = cptPlus - 1;
				$("#votePlus").text(cptPlus.toString());
		    }
			$("#btnVoteMoins").attr("disabled", "disabled").button('refresh');
			$("#btnVotePlus").removeAttr("disabled", "disabled").button('refresh');
		}
	</script>	
</body>
</html>