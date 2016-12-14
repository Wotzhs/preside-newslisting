component {

	/**
	 * @websiteUser.inject presidecms:object:website_user 
	 */ 

	function init( websiteUser ) {
		_setWebsiteUser( websiteUSer );
	 	return this;
	 }

	public function show( event, rc, prc, args={} ) {

		prc.targetProfile = _getWebsiteUser().selectData(
			filter = { id = prc.profileId }
		);
		
		event.setView('page-types/webUser/index');
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

		var update = _getWebsiteUser().updateData(
			  id                      = getLoggedInUserDetails().id
			, data                    = { display_name   = rc.display_name }
			, forceUpdateAll          = true
			, updateManyToManyRecords = true
		);
		getLoggedInUserDetails().display_name = rc.display_name;

		setNextEvent(
			  url           = event.buildLink( profileId=getLoggedInUserId() )
			, persistStruct = {
				message     = "Profile update successful!"
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
