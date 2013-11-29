

$(document).ready(function() {

	// $('#notice').on( "load", slideFlash);
	// $('#success').on( "load", slideFlash);
	// $('#alert').on( "load", slideFlash);
	if($('#notice').length){ slideFlash($('#notice')) };
	if($('#success').length){ slideFlash($('#success')) };
	if($('#alert').length){ slideFlash($('#alert')) };

	$(function() {
		if ($('.pagination').length) {
			$(window).scroll(function() {
				var url = $('.pagination span.next').children().attr('href');
				if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 550) {
					$('.pagination').text("Fetching more providers...");
					$.getScript(url);
				}
			});
		}
		$(window).scroll();
	});

	// bind to keypress in filter box
	$('input#filter').keyup(liveFilter)

});

function slideFlash(target) {
	$(target).animate({top: 0}, 800);
	setTimeout(function () {
		$(target).animate({top: -100}, 800);	
	}, 3000)
}

function liveFilter() {
	var filterString = $(this).val();
	console.log(filterString);
	var filterProperty = $('select#property').val();
	$.post('/providers', {filter: filterString, property: filterProperty});
};