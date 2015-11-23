<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script type="text/javascript">
		$(document).ready(function(){ // Quand le document est complètement chargé
			var load = false; // aucun chargement de commentaire n'est en cours
		 	/* la fonction offset permet de récupérer la valeur X et Y d'un élément
			dans une page. Ici on récupère la position du dernier div qui 
			a pour classe : ".commentaire" */
			var offset = $('.image:last').offset(); 
			$(window).scroll(function(){ // On surveille l'évènement scroll
				/* Si l'élément offset est en bas de scroll, si aucun chargement 
				n'est en cours, si le nombre de commentaire affiché est supérieur 
				à 5 et si tout les commentaires ne sont pas affichés, alors on 
				lance la fonction. */
				if((offset.top-$(window).height() <= $(window).scrollTop()) 
				&& load==false && ($('.image').size()>=5) && 
				($('.image').size()!=$('.nb_com').text())){
					// la valeur passe à vrai, on va charger
					load = true;
					//On récupère l'id du dernier commentaire affiché
					var last_id = $('.image:last').attr('id');
					//On affiche un loader
					$('.loadmore').show();
					//On lance la fonction ajax
					$.ajax({
						url: '/public/list/'+last_id,
						type: 'get',
						//Succès de la requête
						success: function(posts) {
							//On masque le loader
							$('.loadmore').fadeOut(500);
							/* On affiche le résultat après
							le dernier commentaire */
							//$('.image:last').after(data.toString());
							$.each(posts, function(index, post) {
				                $('.cont_com').append($('<div class="col-lg-3 col-md-4 col-xs-6 thumb" id="' + post.id + '"><a class="thumbnail" href="'+ post.filename + '"><img class="img-responsive" src="'+ post.filename + '"></a></div>', {
				                }));
				            });
							/* On actualise la valeur offset
							du dernier commentaire */
							offset = $('.image:last').offset();
							//On remet la valeur à faux car c'est fini
							load = false;
						}
					});
				}
			});
		});
	</script>
	<div class="cont_com">
		 <c:forEach var="post"  items="${posts}" begin="1" end="10"  >
			 	<div class="col-lg-3 col-md-4 col-xs-6 thumb" id="${post.id}">
				<a class="thumbnail" href="${post.filename}">
					<img class="img-responsive" src="${post.filename}">
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="loadmore">Chargement en cours...</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".cont_com").magnificPopup({
				delegate: "a", // selection de la balise des liens des images
				type: "image"
				// autres options
			});
		});
	</script>	
</body>
</html>
