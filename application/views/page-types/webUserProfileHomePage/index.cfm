<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />


<cfoutput>
	<cfif len( trim( args.message ) )>
		<p class="alert alert-success alert-dismissable fade in">
			<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			#args.message#
		</p>
	</cfif>
	<h1>#args.displayName#</h1>
	<a href="event.buildLink(page='edit')">Edit Profile</a>
	#args.main_content#
</cfoutput>