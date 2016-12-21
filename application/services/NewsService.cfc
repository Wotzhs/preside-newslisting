/**
*  @presideService
*  @singleton
*/
component {

  	function init() {
	    return this;
	}

	function loadNews( numeric numberOfNews=10, numeric offset=1 ){
		var newsDetails =  $getPresideObject('news_detail').selectData(
			  selectFields = [
				  'page.id'
			  	, 'page.title'
			  	, 'page.slug'
			  	, 'asset.asset_url'
			  	, 'page.teaser'
			  	, 'page.main_content'
			  	, 'news_detail.date_published'
			  	, 'news_detail.datecreated'
			  	, '"" AS total_comment'
			  	, "group_concat( category.id ) as category_label"
			  	, "group_concat( category.label ) as category_id"
			  ]
			, orderBy  = 'news_detail.datecreated DESC'
			, startRow = offset
			, maxRows  = numberOfNews
			, groupBy  = "page.id"
		);

		var commentDetails = $getPresideObject('comment').selectData(
			filter = { page=listToArray( valueList( newsDetails.id ) ) }
		);

		var pageComment = {}
		loop query=commentDetails{
			if( !structKeyExists( pageComment, commentDetails.page ) ){
				pageComment[commentDetails.page] = 1;
			}else{
				pageComment[commentDetails.page] += 1;
			}		
		}
		

		loop query=newsDetails{
			if( structKeyExists( pageComment, newsDetails.id ) ){
				querySetCell( newsDetails, "total_comment", pageComment[ newsDetails.id ], newsDetails.currentRow );
			}
		}

		return  newsDetails;
	}

	function retrieveCategories( required string pageId ) {
		return $getPresideObject('news_detail').selectData(
			  selectFields = [ 'news_category.id', 'news_category.label' ]
			, filter       = { id=pageId}
		);
	}

	function getRelatedNews( required string categoryId ) {
		return $getPresideObject('news_category').selectData(
			  selectFields = [
			  	  'news_detail.id' 
				, 'page.title'
				, 'page.slug'
				, 'page.teaser'
			  ]
			, filter       = { id=categoryId }
		)
	}

}