$(document).ready(function() {

	// $('#notice').on( "load", slideFlash);
	// $('#success').on( "load", slideFlash);
	// $('#alert').on( "load", slideFlash);
	if($('#notice').length){ slideFlash($('#notice')); }
	if($('#success').length){ slideFlash($('#success')); }
	if($('#alert').length){ slideFlash($('#alert')); }

});

function slideFlash(target) {
	$(target).animate({top: 0}, 800);
	setTimeout(function () {
		$(target).animate({top: -100}, 800);
	}, 3000);
}