<cfparam name="submitted" default="0" />

<cfoutput>

	<cfif len(#args.message#)>
		<p class="alert alert-danger alert-dismissable fade in">
			<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			Login Failed: Email or password did not match, please try again!
		</p>
	</cfif>

	<form class="well" action="#event.buildLink(linkTo="login.attemptLogin")#" method="get">
		#renderForm(
			  formName = "login.login"
			, context     = "website"
			, fieldLayout = "formcontrols.layouts.login"
		)#
		<input type="submit"   value="Login"     class="btn btn-success">
	</form>	
</cfoutput>
