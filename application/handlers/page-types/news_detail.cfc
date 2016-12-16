component {

	/**
	 * @commentService.inject CommentService 
	 * @newsService.inject    NewsService
	 */

	function init( commentService, newsService ) {
		_setCommentService( commentService );
		_setNewsService( newsService );
		return this;
	}

	function index( event, rc, prc, args={} ) {

		args.labels   = _getNewsService().retriveCategories( event.getCurrentPageId() );
		args.comments = _getCommentService().loadComment( event.getCurrentPageId() );
		
		return renderView(
			   view          = "page-types/news_detail/index"
			,  presideObject = "news_detail"
			,  id            = event.getCurrentPageId()
			,  args          = args
		)
	}

	private function _getCommentService() {
		return _commentService;
	}	
	private function _setCommentService( commentService ) {
		_commentService = commentService;
	}
	private function _getNewsService() {
		return _newsService;
	}
	private function _setNewsService( newsService ) {
		_newsService = newsService;
	}	
}