component {

	/**
	 * @websiteUser.inject presidecms:object:website_user 
	 */ 

	function init( websiteUser ) {
		_setWebsiteUser( websiteUSer );
	 	return this;
	 }

	// private function index( event, rc, prc, args={}) {

	//  	args.targetProfile  = rc.targetUserProfile ?: "";

	//  	return renderView(
	// 		  view          = 'page-types/SignUp/index'
	// 		, presideObject = 'SignUp'
	// 		, id            = event.getCurrentPageId()
	// 		, args          = args
	// 	);
	//  }

	public function retrieveProfile( event, rc, prc, args={} ) {
		var targetUserProfile = _getWebsiteUser().selectData(
			filter            = { id = rc.id } 
		);

		// dump(targetUserProfile); abort;

		setNextEvent(
			  url           = event.buildLink( page="webUserShowPage" )
			, persistStruct = {
				targetUSer  = targetUserProfile 
			}
		)
	}

	private function _getWebsiteUser() {
		return _websiteUser;
	}
	private function _setWebsiteUser( websiteUser ) {
		_websiteUser = websiteUser;
	}
}
