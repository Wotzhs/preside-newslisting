	component {

	/**
	 * @signUpDao.inject           presidecms:object:website_user
	 * @websiteLoginService.inject WebsiteLoginService
	 */

	 function init( signUpDao, websiteLoginService) {
	 	_setSignUpDao( signUpDao );
	 	_setWebsiteLoginService( websiteLoginService );
	 	return this;
	 }


	public function signUp( loginId, email, password, displayName ) {

		ifExists   = _getSignUpDao().selectData(
			filter = { email_address = email }
		);

		if (ifExists.recordCount) { return "EMAIL_EXISTS" };

		createAccount       = _getSignUpDao().insertData(
			data            = {
			  login_id      = loginId
			, email_address = email
			, password      = password
			, display_name  = displayName
			}
		);

		return "SUCCESS";
	}

	private function _getSignUpDao() {
		return _signUpDao;
	}
	private function _setSignUpDao( signUpDao ) {
		_signUpDao = signUpDao;
	}
	private function _getWebsiteLoginService() {
		return _websiteLoginService;
	}
	private function _setWebsiteLoginService( websiteLoginService ) {
		_websiteLoginService = websiteLoginService;
	}	
}
