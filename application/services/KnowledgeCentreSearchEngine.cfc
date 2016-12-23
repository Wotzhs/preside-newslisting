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

	public function search(
		  string  q               = "*"
		, numeric page            = 1
		, string  sortOrder       = "MOST_RECENT"
		, numeric pageSize        = 9999
		, string  excludeId       = ""
		, string  year            = ""
		, string  resource_id     = ""
		, string  idList          = ""
		, boolean featured        = false
		, string  fieldList       = "id,resource_id,title,description,slug,published_date,teaser"
	) {
		var args             = duplicate( arguments );
		args.objects         = ["resource_library_resource"];
		args.sortOrder       = _getSortOrder( arguments.sortOrder );
		args.defaultOperator = "AND";
		args.fullDsl         = _getElasticSearchApiWrapper().generateSearchDsl( argumentCollection = args );
		args.fullDsl.filter  = _setFilterDsl(
			  excludeId       = arguments.excludeId  
			, year            = arguments.year       
			, resource_id     = arguments.resource_id
			, idList          = arguments.idList     
			, featured        = arguments.featured   
		);
		_addAggregation( args.fullDsl );
		var results = _getElasticSearchEngine().search( argumentCollection=args );
		_translateAggregration( results.getAggregations() );
		// dump(results.getResults());abort;
		// dump(results.getAggregations());abort;

		return results;

	}

	private function _setFilterDsl(
		  string  excludeId   = ""
		, string  resource_id = ""
		, string  idList      = ""
		, boolean featured    = ""
		, required string year
	) {
		var filter              = {};
			filter.bool         = {};
			filter.bool.should  = [];
			filter.bool.must    = [];
			filter.bool.must_not= [];

		!len(arguments.excludeId)   ?: filter.bool.must_not.append( { terms = { _id = listToArray( '#arguments.excludeId#' ) } } );
		!len(arguments.resource_id) ?: filter.bool.must.append( { terms = { resource_id = listToArray( '#arguments.resource_id#' ) } } );
		!len(arguments.idList)      ?: filter.bool.must.append( { terms = { _id = listToArray( '#arguments.idList#' ) } } );
		!len(arguments.featured)    ?: filter.bool.must.append( { terms = { featured = listToArray( '#arguments.featured#' ) } } );

		return filter;

	}

	private function _addAggregation( required struct fullDsl ){
		var aggs = {
			title = { terms = { field="title", size=0 } }
		};

		if ( ( fullDsl.filter ?: {} ).count() ) {
			fullDsl.aggs = {
				filtered = {
					  filter = fullDsl.filter
					, aggs   = aggs 
				}
			}
		} else {
			fullDsl.aggs = aggs;	
		}
		
	}

	private function _translateAggregration( aggregations ){
		return this;
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
			  RELEVANCE    = "_score desc, publish_date desc"
			, MOST_RECENT  = "publish_date desc, _score desc"
			, MOST_POPULAR = "visit_count desc, _score desc"
			, TITLE_ASC    = "title asc, _score desc"
			, TITLE_DESC   = "title desc, _score desc"
		};
	}

	private function _getSortOrderOptions() {
		return _sortOrderOption;
	}


}