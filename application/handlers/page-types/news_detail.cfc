component {

	property name="commentService" inject="CommentService";
	property name="newsService"    inject="NewsService";

	function index( event, rc, prc, args={} ) {

		var currentPageId = event.getCurrentPageId();
		args.labels       = newsService.retrieveCategories( currentPageId );
		args.comments     = commentService.loadComment( currentPageId );
		args.relatedNews  = ''
		
		// retreive related news based on categories
		for ( row =1; row <= args.labels.recordCount; row= (row+1) ){
			args.relatedNews = newsService.getRelatedNews( args.labels['id'][row]);
		}

		// dump(args.relatedNews); abort;
		
		return renderView(
			   view          = "page-types/news_detail/index"
			,  presideObject = "news_detail"
			,  id            = currentPageId
			,  args          = args
		)
	}	
}