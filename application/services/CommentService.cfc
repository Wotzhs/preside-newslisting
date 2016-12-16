component {

	/**
	 * @commentDao.inject presidecms:object:comment 
	 */

	function init( commentDao ) {
		_setCommentDao( commentDao );
		return this;
	}

	function loadComment( pageId ) {
		return _getCommentDao().selectData(
			  selectFields = [ 
				  "comment"
				, "datecreated"
				, "website_user.display_name" 
				, "website_user.id"
			  ]
			, filter       = { page = pageId }
		);
	}

	function addComment( comment, pageId, userId ) {
		_getCommentDao().insertData(
			data = {
				  comment = comment
				, page    = pageId
				, author  = userId
			}
		);
	}

	function deleteComment( newsId ) {
		return this;
	}
	private function _getCommentDao() {
		return _commentDao;
	}
	private function _setCommentDao( commentDao ) {
		_commentDao = commentDao;
	}
}
