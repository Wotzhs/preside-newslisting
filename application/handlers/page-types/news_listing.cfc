component {

	 property name="newsService"    inject="NewsService";
	 property name="commentService" inject="CommentService";

	 function init() {
	 	return this;
	 }

	private function index( event, rc, prc, args={} ) {
		
		args.numberOfNews = event.getPageProperty( 'posts_per_page' )
		args.data         = newsService.loadNews( args.numberOfNews );

		event.include('js-loadmore');

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

}
