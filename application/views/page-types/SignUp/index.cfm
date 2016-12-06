<!---
	This view file has been automatically created by the preside dev tools
	scaffolder. Please fill with meaningful content and remove this comment
--->

<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />

<cfparam name="form.user.loginId"     default="" />
<cfparam name="form.user.email"       default="" />
<cfparam name="form.user.password"    default="" />
<cfparam name="form.user.displayName" default="" />

<cfoutput>
	<h1>#args.title#</h1>
	#args.main_content#

	<div class="container">
		<form class="well" action="#event.buildLink(linkTo="page-types.SignUp.signUp")#" method="post">
			#renderForm(
				  formName    = "signup.signup"
				, context     = "website"
				, fieldLayout = "formcontrols.layouts.signup"
			)#	
			<br>
			<input type="submit" value="Sign Up" class="btn btn-success">
		</form>
	</div>

	

</cfoutput>