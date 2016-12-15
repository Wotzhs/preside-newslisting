component {

	/**
	 * @websiteUser.inject presidecms:object:website_user 
	 */ 

	function init( websiteUser ) {
		_setWebsiteUser( websiteUSer );
	 	return this;
	}

	function showProfile( profileId ) {
		return _getWebsiteUser().selectData(
			filter = { id = profileId }
		);
	}

	function updateProfile(profileId, updatedName) {
		return _getWebsiteUser().updateData(
			  id                      = profileId
			, data                    = { display_name = updatedName }
			, forceUpdateAll          = true
			, updateManyToManyRecords = true
		);
	}

	private function _getWebsiteUser() {
		return _websiteUser;
	}
	private function _setWebsiteUser( websiteUser ) {
		_websiteUser = websiteUser;
	}
}