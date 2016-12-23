component {

	property name="knowledgeCentreSearchEngine" inject="KnowledgeCentreSearchEngine";

	private function index( event, rc, prc, args={} ) {
		
		args.searchResults = knowledgeCentreSearchEngine.search().getResults();
		
		return renderView(
			  view          = 'page-types/knowledge_centre/index'
			, presideObject = 'knowledge_centre'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}
}
