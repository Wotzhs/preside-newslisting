<cfparam name="args.title"        type="string" field="page.title"        editable="true" />
<cfparam name="args.main_content" type="string" field="page.main_content" editable="true" />

<cfoutput>
	<div class="jumbotron"><h1>#args.title#</h1></div>

	#args.main_content#

	<cfif #isLoggedIn()#>
		<h1>Welcome 
			<a href="#event.buildLink(linkTo='page-types.webUserShowPage.retrieveProfile.', queryString='id='&getLoggedInUserId())#">
				#getLoggedInUserDetails().display_name#
			</a>
		</h1>
		<br><br>
		<a href="#event.buildLink(page='webUserProfileEditPage')#" class="btn btn-default">Edit Profile</a>
		<br><br>
		<a href="#event.buildLink(linkTo='login.logout')#" class="btn btn-danger">Log Out</a>
	<cfelse>
		<a href="#event.buildLink(page='login')#" class="btn btn-primary">Log In</a>
	</cfif>
</cfoutput>