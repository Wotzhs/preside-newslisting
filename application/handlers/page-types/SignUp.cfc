	component {

	/**
	 * @signUpService.inject SignUpService
	 * @bCryptService.inject BCryptService
	 * 
	 */

	 function init( signUpService, bCryptService ) {
	 	_setSignUpService( signUpService );
	 	_setBcryptService( bCryptService );
	 	return this;
	 }


	public function signUp( event, rc, prc, args={} ) {
		var hashedPassword = _getBcryptService().hashPw(rc.user.password)
		prc.data = _getSignUpService().signUp( rc.user.loginId, rc.user.email, hashedPassword, rc.user.displayName );
		dump(prc.data);
	}

	private function _getSignUpService() {
		return _signUpService;
	}
	private function _setSignUpService( signUpService ) {
		_signUpService = signUpService
	}

	private function _getBcryptService() {
		return _bCryptService;
	}
	private function _setBcryptService( bCryptService ) {
		_bCryptService = bCryptService
	}	
}
