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
		
		event.setView('page-types/webUserShowPage/_show');
	}

	private function _getWebsiteUser() {
		return _websiteUser;
	}
	private function _setWebsiteUser( websiteUser ) {
		_websiteUser = websiteUser;
	}
}
