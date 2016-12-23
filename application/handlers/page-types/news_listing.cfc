component {

	 property name="newsService"      inject="NewsService";
	 property name="commentService"   inject="CommentService";
	 property name="newsSearchEngine" inject="NewsSearchEngine";

	 function init() {
	 	return this;
	 }

	private function index( event, rc, prc, args={} ) {
		
		args.numberOfNews = event.getPageProperty( 'posts_per_page' )
		args.data         = newsService.loadNews( args.numberOfNews );

		event.include('js-loadmore');
		event.include('js-search');
		return renderView(
			  view          = 'page-types/news_listing/index'
			, presideObject = 'news_listing'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}

	public function loadNews( event, rc, prc, args={} ) {
		prc.data = newsService.loadNews( rc.numberOfNews, rc.offset );
		event.setView( view='page-types/news_listing/_newslist', noLayout=true );
	}

	public function searchNews( event, rc, prc, args={} ) {
		prc.searchResult = newsSearchEngine.search(rc.search, 'title,description' );
		event.setView( view='page-types/news_listing/_searchResult', noLayout=true);
	}

}
