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
			<img
				src="${pageContext.request.contextPath}/static/images/slide/image-slider-1.jpg"
				alt="Welcome to GameGag" /> <img
				src="${pageContext.request.contextPath}/static/images/slide/image-slider-2.jpg"
				alt="Blabla" /> <img
				src="${pageContext.request.contextPath}/static/images/slide/image-slider-3.jpg"
				alt="Blabla" /> <img
				src="${pageContext.request.contextPath}/static/images/slide/image-slider-4.jpg"
				alt="Blabla" /> <img
				src="${pageContext.request.contextPath}/static/images/slide/image-slider-5.jpg"
				alt="Blabla" />
		</div>
	</div>
	
	<div class="container head-posts">
		<div class="page-header">
			<h1>
				<spring:message code="label.homepage.title" />
			</h1>
		</div>
	</div>
	<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
	<div class="container">
		<div class="cont_com">
			<c:forEach var="post" items="${posts}" begin="0" end="4">
				<div class="col-lg-3 col-md-4 col-xs-6 thumb" id="${post.id}">
					<a class="thumbnail" href="/public/post/details/${post.id}"> 
						<video id="video-control" class="img-src img-responsive" width="320" height="240" poster="${post.filename}"></video>
						
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
	<script type="text/javascript">
		$(document).ready(function(){ 
			var re = /(?:\.([^.]+))?$/;
			$('.img-src').each(function(){
				ext = re.exec($(this).attr('poster'))[1];
				switch(ext){
				case 'png':
				case 'jpg':
				case 'gif':
				case 'jpeg':
				case 'tiff':
				case 'bmp':
					break;
				default:
					$(this).attr('poster','/static/upload/post/playvideo.png');
					break;
				}
			});
			
			
			
			
			
			
			
			
			
			// Quand le document est complètement chargé
			var load = false; // aucun chargement de commentaire n'est en cours
		 	/* la fonction offset permet de récupérer la valeur X et Y d'un élément
			dans une page. Ici on récupère la position du dernier div qui 
			a pour classe : ".commentaire" */
			var offset = $('.thumb:last').offset(); 
			$(window).scroll(function(){ // On surveille l'évènement scroll
				/* Si l'élément offset est en bas de scroll, si aucun chargement 
				n'est en cours, si le nombre de commentaire affiché est supérieur 
				à 5 et si tout les commentaires ne sont pas affichés, alors on 
				lance la fonction. */
				if((offset.top-$(window).height() <= $(window).scrollTop()) 
				&& load==false && ($('.thumb').size()>=5) && 
				($('.thumb').size()!=$('.nb_com').text())){	
					// la valeur passe à vrai, on va charger
					load = true;
					//On récupère l'id du dernier commentaire affiché
					var last_id = $('.thumb:last').attr('id');
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
								var re = /(?:\.([^.]+))?$/;
								var ext = re.exec(post.filename)[1];
								
								switch(ext){
								case 'png':
								case 'jpg':
								case 'gif':
								case 'jpeg':
								case 'tiff':
								case 'bmp':
									break;
								default:
									post.filename = "/static/upload/post/playvideo.png";
									break;
								}
								
				                $('.cont_com').append($('<div class="col-lg-3 col-md-4 col-xs-6 thumb" id="' + post.id + '"><a class="thumbnail" href="/public/post/details/'+ post.id + '"><video id="video-control" class="img-responsive width="320" height="240" poster="'+ post.filename + '"></video></a></div>', {
				                }));
				            });
							/* On actualise la valeur offset
							du dernier commentaire */
							offset = $('.thumb:last').offset();
							//On remet la valeur à faux car c'est fini
							load = false;
						}
					});
				}
			});
		});
	</script>
	<script type="text/javascript">
	
	if ($('#back-to-top').length) {
	    var scrollTrigger = 100, // px
	        backToTop = function () {
	            var scrollTop = $(window).scrollTop();
	            if (scrollTop > scrollTrigger) {
	                $('#back-to-top').addClass('show');
	            } else {
	                $('#back-to-top').removeClass('show');
	            }
	        };
	    backToTop();
	    $(window).on('scroll', function () {
	        backToTop();
	    });
	    $('#back-to-top').on('click', function (e) {
	        e.preventDefault();
	        $('html,body').animate({
	            scrollTop: 0
	        }, 700);
	    });
	}
	</script>
	<div class="loadmore">Chargement en cours...</div>
</body>
</html>
