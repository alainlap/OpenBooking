$(document).ready( function() {

	$(function() {
		if ($('.pagination').length) {
			$(window).scroll(function() {
				if ($('input#filter').val()==="") {
					var url = $('.pagination span.next').children().attr('href');
					if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 550) {
						$('.pagination').text("Fetching more providers...");
						$.getScript(url);
					}
				}
			});
		}
		$(window).scroll();
	});

	// bind to keypress in filter box and change in selector boxes
	$('#filter').keyup(liveFilter);
	$('#filter-form').on("change", "select", liveFilter);

	//prevent form submission if user hits enter
	$("#filter-form").on("submit", function(event){
		event.preventDefault();
		event.stopPropagation();
	});
});


function liveFilter(event) {
	var filterString = $(this).val();
	var filterProperty = $('select#property').val();
	var filterType = $('select#type').val();

	event.preventDefault();
	event.stopPropagation();

	$.ajax({
		type: "GET",
		url: '/providers',
		data: { filter: { filter: filterString, property: filterProperty, type: filterType } },
		dataType: "script"
	});
}
