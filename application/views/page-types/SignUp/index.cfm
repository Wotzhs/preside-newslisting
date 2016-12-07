<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />

<cfparam name="form.user.loginId"     default="" />
<cfparam name="form.user.email"       default="" />
<cfparam name="form.user.password"    default="" />
<cfparam name="form.user.displayName" default="" />

<cfoutput>
	<h1>#args.title#</h1>
	#args.main_content#

	<cfif len(#args.message#)>
		<p class="alert alert-danger alert-dismissable fade in">
			<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<cfswitch expression="#args.message#">
					<cfcase value="EMAIL_EXISTS">				
						Sign Up Failed: Email has already been registered please try loggin in!
					</cfcase>
					<cfcase value="INCOMPLETE_FORM">
						Sign Up Failed: Please ensure all required fields are filled in!
					</cfcase>
				</cfswitch>
		</p>
	</cfif>

	<div class="container">
		<form class="well" action="#event.buildLink(linkTo="page-types.SignUp.signUp")#" method="get">
			#renderForm(
				  formName         = "signup.signup"
				, context          = "website"
				, fieldLayout      = "formcontrols.layouts.signup"
				, validationResult = rc.validationResult ?: ""
			)#	
			<input type="submit" value="Sign Up" class="btn btn-success">
		</form>
	</div>

	

</cfoutput>