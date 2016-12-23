(function(){
	'use strict'

	function searchHandler() {
		$('#search').on('submit', function() {
			event.preventDefault();
			var userSearch  = $(this).find('input').val();
			if ( userSearch.length ) { search( userSearch ) };
		});	
	}
	
	function inputHandler() {
		var $submitButton = $('button[type="button"]');
		$('input[name="search"]').on('input paste change', function() {
			$(this).val() !== '' ? $submitButton.text('Clear!') : $submitButton.text('Go!')
		});	
	}

	function buttonHandler() {
		$('button[type="button"]').on('click', function() {
			if ( $(this).text() === 'Clear!' ) { 
				$('input[name="search"]').val('');
				$(this).text('Go!')
			}
			if ( $('#searchResult').length ) {
				$('#newslist').show();
				$('#loadmore').show();
			}
		});
	}


	function search(userSearch) {
		$('#searchResult').empty();
		$.ajax({
			url    : '/page-types/news_listing/searchNews/',
			method : 'post',
			data   : { search : userSearch },
			success: function(data) {
				$('#newslist').hide();
				$('#loadmore').hide();
				$('#searchResult').append(data);
			},
			fail: function(data) {
				console.log(data);
			}
		})
	}
	searchHandler();
	inputHandler();
	buttonHandler();
})();

