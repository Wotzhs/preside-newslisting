component {

	/**
	 * @newsService.inject NewsService 
	 */

	 function init( newsService) {
	 	_setNewsService( newsService );
	 	return this;
	 }

	private function index( event, rc, prc, args={} ) {
		
		args.numberOfNews = event.getPageProperty( 'posts_per_page' )
		args.data         = _getNewsService().loadNews( args.numberOfNews );

		event.include('js-loadmore');
		// writeDump(args.data); abort;

		return renderView(
			  view          = 'page-types/news_listing/index'
			, presideObject = 'news_listing'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}

	public function loadNews( event, rc, prc, args={} ) {
		prc.data = _getNewsService().loadNews( rc.numberOfNews, rc.offset );
		event.setView( view='page-types/news_listing/_newslist', noLayout=true );
	}

	private function _getNewsService() {
		return _newsService;
	}
	private function _setNewsService( newsService ) {
		_newsService = newsService;
	}	
}
