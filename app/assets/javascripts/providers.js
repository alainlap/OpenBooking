$(document).ready( function() {

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
	$('input#filter').keyup(liveFilter);
});


function liveFilter() {
	var filterString = $(this).val();
	var filterProperty = $('select#property').val();

	$.ajax({
		type: "GET",
		url: '/providers',
		data: {filter: {filter: filterString, property: filterProperty}},
		dataType: "js"
		}).done(function(data){
			alert("success!");
		});
}
