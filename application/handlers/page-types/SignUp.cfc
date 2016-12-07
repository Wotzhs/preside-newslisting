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

	 private function index( event, rc, prc, args={}) {

	 	args.message        = args.message ?: ( rc.message ?: "" );

	 	return renderView(
			  view          = 'page-types/SignUp/index'
			, presideObject = 'SignUp'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	 }

	public function signUp( event, rc, prc, args={} ) {
		var formName         = "signup.signup";
		var formData         = event.getCollectionForForm( formName );
		var validationResult = validateForm(formName, formData);

		if ( !validationResult.validated() ) {
			setNextEvent( 
				  url           = event.buildLink (page="SignUp")
				, persistStruct = {
					  message          = "INCOMPLETE_FORM"
					, validationResult = validationResult
				  }
			); 
			return;
		}

		var hashedPassword = _getBcryptService().hashPw(rc.user.password)
		prc.data = _getSignUpService().signUp( rc.user.loginId, rc.user.email, hashedPassword, rc.user.displayName );
		if (prc.data == "EMAIL_EXISTS") { setNextEvent( url=event.buildLink( page="SignUp" ), persistStruct = { message = prc.data }); }
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
