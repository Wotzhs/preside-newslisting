component {

	/**
	 * @newsDao.inject presidecms:object:news_detail
	 */

	function init( required any newsDao){
		_setNewsDao( arguments.newsDao );
		return this;
	}

	function loadNews(  numberOfNews=10, offset=1 ){
		return _getNewsDao().selectManyToManyData(
			  propertyName = "category"
			, selectFields = [
			  	  'page.title'
			  	, 'page.slug'
			  	, 'page.main_image'
			  	, 'page.teaser'
			  	, 'page.main_content'
			  	, 'news_detail.date_published'
			  	, 'news_detail.datecreated'
			  	, 'news_category.label'
			  ]
			, orderBy      = '-news_detail.datecreated'
			, startRow     = offset
			, maxRows      = numberOfNews
		)
	}

	private function _getNewsDao() {
		return _newsDao;
	}

	private function _setNewsDao( newsDao ) {
		_newsDao = arguments.newsDao;
	}
}