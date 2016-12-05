	component {

	/**
	 * @signUpDao.inject presidecms:object:website_user
	 * 
	 */

	 function init( signUpDao) {
	 	_setSignUpDao( signUpDao );
	 	return this;
	 }


	public function signUp( loginId, email, password, displayName ) {
		return prc.data = _getSignUpDao().insertData(
			data = {
			  login_id      = loginId
			, email_address = email
			, password      = password
			, display_name  = displayName
			}
		);
	}

	private function _getSignUpDao() {
		return _signUpDao;
	}
	private function _setSignUpDao( signUpDao ) {
		_signUpDao = signUpDao
	}
}
