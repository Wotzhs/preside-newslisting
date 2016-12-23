component {

	/**
	 * @elasticSearchApiWrapper.inject ElasticSearchApiWrapper 
	 * @elasticSearchEngine.inject     ElasticSearchEngine
	 */

	function init( elasticSearchApiWrapper, elasticSearchEngine ) {
		_setElasticSearchApiWrapper( elasticSearchApiWrapper );
		_setElasticSearchEngine( elasticSearchEngine );
		_setSortOrderOptions();
		return this;
	}

	function search(
		  string  q           = "*"
		, string  queryFields = ''
		, numeric page        = 1
		, string  sortOrder   = "MOST_RECENT"
		, numeric pageSize    = 9999
		, string  fieldList   = "id,resource_id,title,description,slug,date_published,teaser"
	) {
		var args             = duplicate( arguments );
		args.sortOrder       = _getSortOrder( arguments.sortOrder );
		args.fullDsl         = _getElasticSearchApiWrapper().generateDslPrefixedMatch( argumentCollection = args );
		var results = _getElasticSearchEngine().search( argumentCollection=args );
		return results;
	}

	private function _getSortOrder( string sortOrder ) {
		var sortOrders = _getSortOrderOptions();
		if ( !structKeyExists( sortOrders , sortOrder ) ) { return sortOrders.MOST_RECENT }
		return sortOrders[sortOrder];
	}

	//  private get & set
	private function _getElasticSearchApiWrapper() {
		return _elasticSearchApiWrapper;
	}

	private function _setElasticSearchApiWrapper( elasticSearchApiWrapper ) {
		_elasticSearchApiWrapper = elasticSearchApiWrapper;
	}

	private function _getElasticSearchEngine() {
		return _elasticSearchEngine;
	}
	private function _setElasticSearchEngine( elasticSearchEngine ) {
		_elasticSearchEngine = elasticSearchEngine;
	}	

	private function _setSortOrderOptions() {
		_sortOrderOption = {
			  RELEVANCE    = "_score desc, date_published desc"
			, MOST_RECENT  = "date_published desc, _score desc"
			, MOST_POPULAR = "visit_count desc, _score desc"
			, TITLE_ASC    = "title asc, _score desc"
			, TITLE_DESC   = "title desc, _score desc"
		};
	}

	private function _getSortOrderOptions() {
		return _sortOrderOption;
	}

}
