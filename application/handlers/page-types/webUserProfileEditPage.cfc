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

		args.currentUser = getLoggedInUserDetails(); 

		rc.validationResult = ""

		return renderView(
			  view          = 'page-types/webUserProfileEditPage/index'
			, presideObject = 'webUserProfileEditPage'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}

	public function update( event, rc, prc, args={}) {
		var update = _getWebsiteUser().updateData(
			
			  id                      = getLoggedInUserDetails().id
			, data                    = { display_name   = rc.display_name }
			, forceUpdateAll          = true
			, updateManyToManyRecords = true
		);
		getLoggedInUserDetails().display_name = rc.display_name;
		setNextEvent(
			  url           = event.buildLink( page="webUserProfileHomePage" )
			, persistStruct = {
				message     = "Profile update successful!"
			  }  
		)
	}

	private function _getWebsiteUser() {
		return _websiteUser;
	}
	private function _setWebsiteUser( websiteUser) {
		_websiteUser = websiteUser;
	}

}
