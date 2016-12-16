component {

	/**
	 * @commentService.inject CommentService 
	 */

	function init( commentService ) {
		_setCommentService( commentService );
		return this;
	}

	function loadComment( newsId ) {
	}

	function addComment( event, rc, prc, args={} ) {
		_getCommentService().addComment( rc.comment, rc.page, getLoggedInUserid() );
		setNextEvent(
			url = event.buildLink( page=rc.page )
		);
	}

	function deleteComment( newsId ) {
		return this;
	}

	private function _getCommentService() {
		return _commentService;
	}
	private function _setCommentService( commentService ) {
		_commentService = commentService;
	}
}