<cfparam name="submitted" default="0" />

<cfoutput>

	<cfif len(#args.message#)>
		<cfswitch expression="#args.message#">
			<cfcase value="LOGIN_FAILED">
				<p class="alert alert-danger alert-dismissable fade in">
					<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					Login Failed: Email or password did not match, please try again!
				</p>
			</cfcase>
			<cfcase value="SIGN_UP_SUCCESS">
				<p class="alert alert-success alert-dismissable fade in">
					<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					Sign Up Successful: You may now proceed to login below
				</p>
			</cfcase>
			<cfcase value="LOGIN_REQUIRED">
				<p class="alert alert-danger alert-dismissable fade in">
					<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					Please log in to continue
				</p>
			</cfcase>
		</cfswitch>
		
	</cfif>

	<div class="well">
		<form action="#event.buildLink(linkTo="login.attemptLogin")#" method="get">
			#renderForm(
				  formName = "login.login"
				, context     = "website"
				, fieldLayout = "formcontrols.layouts.login"
			)#
			<input type="submit"   value="Login"     class="btn btn-success">
		</form>	
		<br>
		<a href="#event.buildLink(page='forgotten_password')#">Forgot password?</a>	
		<p>New to Preside News? <a href="#event.buildLink(page='signup')#">Create an account now</a></p>
	</div>
	
</cfoutput>
