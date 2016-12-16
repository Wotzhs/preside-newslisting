component {

	/**
	 * @newsDao.inject        presidecms:object:news_detail
	 */

	function init( newsDao ){
		_setNewsDao( newsDao );
		return this;
	}

	function loadNews(  numberOfNews=10, offset=1 ){
		return _getNewsDao().selectManyToManyData(
			  propertyName = "category"
			, selectFields = [
				  'page.id'
			  	, 'page.title'
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

	function retriveCategories( pageId ) {
		return _getNewsDao().selectManyToManyData(
			  propertyName = "category"
			, selectFields = [ 'news_category.label' ]
			, filter       = { id = pageId}
		);
	}

	private function _getNewsDao() {
		return _newsDao;
	}
	private function _setNewsDao( newsDao ) {
		_newsDao = arguments.newsDao;
	}

}