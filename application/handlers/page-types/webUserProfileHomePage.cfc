component {

	/**
	 * @websiteUser.inject presidecms:object:website_user 
	 */

	function init( websiteUser ) {
		_setWebsiteUser( websiteUser );
		return this;
	}

	private function index( event, rc, prc, args={} ) {
		
		if ( !isLoggedIn() ) {
			setNextEvent(
				  url           = event.buildLink( page="login" )
				, persistStruct = {
					message     = "LOGIN_REQUIRED"
				}
			);
			return;
		}

		args.displayName = getLoggedInUserDetails().display_name;
		args.message     = rc.message ?: "";

		return renderView(
			  view          = 'page-types/webUserProfileHomePage/index'
			, presideObject = 'webUserProfileHomePage'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}

	private function _getWebsiteUser() {
		return _websiteUser;
	}
	private function _setWebsiteUser( websiteUser ) {
		_websiteUser = websiteUser;
	}
}
