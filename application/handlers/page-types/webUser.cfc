component {

	/**
	 * @webUserService.inject webUserService
	 */ 

	function init( webUserService ) {
		_setWebUserService( webUserService );
	 	return this;
	 }

	 public void function preHandler( event ) output=false {
	 	if(!isLoggedIn() || isAutoLoggedIn() ){
	 		event.accessDenied( reason="Login Required");
	 	}
	 }

	public function show( event, rc, prc, args={} ) {

		prc.targetProfile = _getWebUserService().showProfile( prc.profileId );

		prc.message = rc.message ?: "";
				
		event.setView( view='page-types/webUser/show');
	}

	public function edit ( event, rc, prc, args={} ) {
		prc.currentUser = getLoggedInUserDetails(); 
		prc.validationResult = rc.validationResult ?: "";

		event.setView('page-types/webUser/edit');
	}

	public function update ( event, rc, prc, args={} ) {
		var formName         = "websiteUserProfile.edit";
		var formData         = event.getCollectionForForm( formName );
		var validationResult = validateForm(formName, formData);

		if ( !validationResult.validated() ) {
			setNextEvent( 
				  url                  = event.buildLink (edit=true)
				, persistStruct        = {
					  message          = "INCOMPLETE_FORM"
					, validationResult = validationResult
				  }
			); 
			return;
		}

		_getWebUserService().updateProfile( getLoggedInUserDetails().id, rc.display_name )
		getLoggedInUserDetails().display_name = rc.display_name;

		setNextEvent(
			  url           = event.buildLink( profileId=getLoggedInUserId() )
			, persistStruct = {
				message     = "Profile update successful!"
			  }  
		)
	}

	private function _getWebUserService() {
		return _webUserService;
	}
	private function _setWebUserService( webUserService ) {
		_webUserService = webUserService;
	}
}
