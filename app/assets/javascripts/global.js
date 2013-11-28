$(document).ready(function() {
	// $('#notice').on( "load", slideFlash);
	// $('#success').on( "load", slideFlash);
	// $('#alert').on( "load", slideFlash);
	if($('#notice').length > 0){ slideFlash($('#notice')) };
	if($('#success').length > 0){ slideFlash($('#success')) };	
	if($('#alert').length > 0){ slideFlash($('#alert')) };	
});




function slideFlash(target) {
	$(target).animate({top: 0}, 800);
	setTimeout(function () {
		$(target).animate({top: -100}, 800);	
	}, 3000)
}



