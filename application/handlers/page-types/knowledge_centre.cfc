component {
	private function index( event, rc, prc, args={} ) {
		
		
		
		return renderView(
			  view          = 'page-types/knowledge_centre/index'
			, presideObject = 'knowledge_centre'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}
}
