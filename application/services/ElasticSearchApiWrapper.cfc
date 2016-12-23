component extends="application.extensions.preside-ext-elasticsearch.services.ElasticSearchApiWrapper"{
	function generateDslPrefixedMatch (
		  string  q                = "*"
		, string  queryFields      = ""
		, string  fieldList        = ""
		, string  sortOrder        = ""
		, numeric page             = 1
		, numeric pageOffset       = 0
		, numeric pageSize         = 10
		, string  defaultOperator  = "OR"
		, string  highlightFields  = ""
		, numeric minimumScore     = 0
		, struct  basicFilter      = {}
		, struct  directFilter     = {}
		, string  idList           = ""
		, string  excludeIdList    = ""
	) {
		var body = StructNew();
		var idList = "";

		body['from'] = _calculateStartRecordFromPageInfo( arguments.page, arguments.pageOffset, arguments.pageSize );
		body['size'] = pageSize;

		if (Len(Trim(arguments.fieldList))) {
			body['fields'] = ListToArray(arguments.fieldList);
		}
		
		body['query'] = StructNew();
		body['query']['multi_match'] = StructNew();
		body['query']['multi_match']['fields'] = [];
		body['query']['multi_match']['query'] = escapeSpecialChars( arguments.q );
		body['query']['multi_match']['type'] = 'phrase_prefix';

		if ( Len( Trim( arguments.queryFields ) ) ) {
			body['query']['multi_match']['fields'] = ListToArray(arguments.queryFields);
		}

		if ( Len( Trim( arguments.sortOrder ) ) ) {
			body['sort'] = _generateSortOrder( arguments.sortOrder );
		}

		if ( Len( Trim( arguments.highlightFields ) ) ) {
			body['highlight'] = _generateHighlightsDsl( arguments.highlightFields );
		}
		if ( arguments.minimumScore ) {
			body['min_score'] = arguments.minimumScore;
		}

		if ( not StructIsEmpty( arguments.basicFilter ) ) {
			body['filter'] = _generateBasicFilter( arguments.basicFilter );
		}

		if ( not StructIsEmpty( arguments.directFilter ) ) {
			body['filter'] = _generateDirectFilter( arguments.directFilter );
		}

		if ( Len( Trim( arguments.idList ) ) ) {
			if ( not StructKeyExists( body, 'filter' ) ) {
				body['filter'] = StructNew();
				body['filter']['and'] = ArrayNew(1);
			}

			idList = StructNew();
			idList['ids'] = StructNew();
			idList['ids']['values'] = ListToArray( arguments.idList );

			ArrayAppend( body.filter['and'], idList );
		}
		if ( Len( Trim( arguments.excludeIdList ) ) ) {
			if ( not StructKeyExists( body, 'filter' ) ) {
				body['filter'] = StructNew();
				body['filter']['and'] = ArrayNew(1);
			}

			idList = StructNew();
			idList['not'] = StructNew();
			idList['not']['ids'] = StructNew();
			idList['not']['ids']['values'] = ListToArray( arguments.excludeIdList );

			ArrayAppend( body.filter['and'], idList );
		}
		
		return body;
	}
}