component {

	/**
	 * @newsService.inject NewsService 
	 */

	 function init( newsService) {
	 	_setNewsService( newsService );
	 	return this;
	 }

	private function index( event, rc, prc, args={} ) {

		var offset       = rc.offset ?: 1;
		var numberOfNews = event.getPageProperty( 'posts_per_page' ) ?: 10;
		
		args.data = _getNewsService().loadNews( offset, numberOfNews );

		writeDump(args.data); abort;

		return renderView(
			  view          = 'page-types/news_listing/index'
			, presideObject = 'news_listing'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}

	private function _getNewsService() {
		return _newsService;
	}
	private function _setNewsService( newsService ) {
		_newsService = newsService
	}	
}
