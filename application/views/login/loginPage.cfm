<cfparam name="submitted" default="0" />

<cfoutput>

	<cfif len(#args.message#)>
		<p class="alert alert-danger alert-dismissable fade in">
			<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			Login Failed: Email or password did not match, please try again!
		</p>
	</cfif>

	<form action="#event.buildLink(linkTo="login.attemptLogin")#" method="get">
		<input type="email"    name="loginId"    placeholder="Email"    class="form-control">
		<input type="password" name="password"   placeholder="Password" class="form-control">
		<input type="submit"   value="Login"     class="btn btn-success">
	</form>	
</cfoutput>
