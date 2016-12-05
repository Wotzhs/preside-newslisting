var offset = 1;
var numberOfNews = parseInt(document.querySelector('#numberOfNews').value);

document.querySelector('#loadmore').onclick = function(){
	offset += numberOfNews;
	
	//// without jquery
	// var requestData = "numberOfNews="+numberOfNews+"&offset="+offset;
	// var xhr = new XMLHttpRequest();
	// xhr.open('get', '/page-types/news_listing/loadNews/?'+requestData);
	// xhr.send();
	// xhr.onreadystatechange = function(){
	// 	if (xhr.readyState === 4 && xhr.status === 200){
	// 		document.querySelector('.newslist').insertAdjacentHTML('beforeend', xhr.response);
	// 	}
	// }

	$.ajax({
		url: '/page-types/news_listing/loadNews/',
		method: 'post',
		data: {numberOfNews: numberOfNews, offset: offset},
		success: function(data){
			$('.newslist').append(data);
		},
		fail: function(data){
			console.log(data)
		}
	})
}
