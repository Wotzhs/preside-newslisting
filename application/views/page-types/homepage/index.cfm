<cfparam name="args.title"        type="string" field="page.title"        editable="true" />
<cfparam name="args.main_content" type="string" field="page.main_content" editable="true" />

<cfoutput>
	<div class="jumbotron"><h1>#args.title#</h1></div>

	#args.main_content#

	<cfif #isLoggedIn()#>
		<h1>Welcome 
			<a href="#event.buildLink( profileId=getLoggedInUserId() )#">
				#getLoggedInUserDetails().display_name#
			</a>
		</h1>
	</cfif>

</cfoutput>