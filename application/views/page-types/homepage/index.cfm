<cfparam name="args.title"        type="string" field="page.title"        editable="true" />
<cfparam name="args.main_content" type="string" field="page.main_content" editable="true" />

<cfoutput>
	<div class="jumbotron"><h1>#args.title#</h1></div>

	#args.main_content#

	<h1>Welcome #getLoggedInUserDetails().display_name#</h1>

	<br><br>
	<cfif #isLoggedIn()#>
		<a href="#event.buildLink(linkTo='login.logout')#" class="btn btn-danger">Log Out</a>
	<cfelse>
		<a href="#event.buildLink(page='login')#" class="btn btn-primary">Log In</a>
	</cfif>
</cfoutput>