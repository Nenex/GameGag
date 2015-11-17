$(document).ready(function(){
	
	if (window.location.hash && window.location.hash == '#_=_') {
	    window.location.hash = '/public';
	    window.location.href = '/public';
	}
	
});