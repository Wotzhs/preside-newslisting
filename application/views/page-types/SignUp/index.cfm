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
			<div class="form-group">
				<input type="text" name="user.loginId"     class="form-control" placeholder="Login ID" >
			</div>
			<div class="form-group">
				<input type="text" name="user.displayName" class="form-control" placeholder="Display Name">
			</div>
			<div class="form-group">
				<input type="text" name="user.email"       class="form-control" placeholder="Email" >				
			</div>
			<div class="form-group">
				<input type="text" name="user.password"    class="form-control" placeholder="Password" >				
			</div>
			<input type="submit" value="Sign Up" class="btn btn-success">

		</form>
	</div>

	</cfoutput>