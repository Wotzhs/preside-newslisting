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
				  url                  = event.buildLink (page="SignUp")
				, persistStruct        = {
					  errorMessage    = translateResource('page-type.SignUp:invalid_form_data')
					, validationResult = validationResult
				  }
			); 
			return;
		}

		var hashedPassword = _getBcryptService().hashPw( rc.user.password )
		var createAccount  = _getSignUpService().signUp( rc.user.loginId, rc.user.email, hashedPassword, rc.user.displayName );
		if ( createAccount == "EMAIL_EXISTS" ) { 
			setNextEvent( 
				  url           = event.buildLink( page="SignUp" )
				, persistStruct = { 
					errorMessage     = 'Sign Up Failed: Email has already been registered please try <a href="#event.buildLink(page='login')#">loggin in!</a>'
				  }
			);
			return; 
		}

		setNextEvent(
			  url              = event.buildLink( page="login")
			, persistStruct    = {
				message        = "SIGN_UP_SUCCESS" 
			  } 
		);
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
