<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />

<cfoutput>
	<h1>#args.title#</h1>
	#args.main_content#

	#renderView( view="general/_alertMessage" )#

	<div class="container">
		<form class="well" action="#event.buildLink(linkTo="page-types.SignUp.signUp")#" method="post">
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