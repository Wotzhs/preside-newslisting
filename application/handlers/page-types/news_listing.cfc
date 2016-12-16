component {

	/**
	 * @newsService.inject    NewsService 
	 * @commentService.inject CommentService
	 */

	 function init( newsService, commentService ) {
	 	_setNewsService( newsService );
	 	_setCommentService( commentService);
	 	return this;
	 }

	private function index( event, rc, prc, args={} ) {
		
		args.numberOfNews = event.getPageProperty( 'posts_per_page' )
		args.data         = _getNewsService().loadNews( args.numberOfNews );
		args.commentCount = {};
		args.labels       = {};

		// loop over each news to get number of comments each carries
		for ( row =1; row <= args.data.recordCount; row= (row+1) ){
			args.commentCount[ args.data['id'][row] ] = _getCommentService().loadComment(args.data['id'][row]).recordCount;
			args.labels[ args.data['id'][row] ]       = _getNewsService().retriveCategories( args.data['id'][row]);
		}
		
		event.include('js-loadmore');

		return renderView(
			  view          = 'page-types/news_listing/index'
			, presideObject = 'news_listing'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}

	public function loadNews( event, rc, prc, args={} ) {
		prc.data = _getNewsService().loadNews( rc.numberOfNews, rc.offset );
		prc.commentCount = {};
		prc.labels       = {};

		// loop over each news to get number of comments each carries
		for ( row =1; row <= prc.data.recordCount; row= (row+1) ){
			prc.commentCount[ prc.data['id'][row] ] = _getCommentService().loadComment(prc.data['id'][row]).recordCount;
			prc.labels[ prc.data['id'][row] ]       = _getNewsService().retriveCategories( prc.data['id'][row]);
		}
		event.setView( view='page-types/news_listing/_newslist', noLayout=true );
	}
	private function _getNewsService() {
		return _newsService;
	}
	private function _setNewsService( newsService ) {
		_newsService = newsService;
	}	
	private function _getCommentService() {
		return _commentService;
	}
	private function _setCommentService( commentService ) {
		_commentService = commentService;
	}	
}
