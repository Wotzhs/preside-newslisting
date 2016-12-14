<cfscript>
	param name="prc.message"   type="string";
	param name="prc.profileId" type="string";
	hasMessage   = Len(Trim(prc.message));
	targetUserId = prc.profileId;
</cfscript>

<cfoutput>
	<cfif hasMessage>
		<p class="alert alert-success alert-dismissable fade in">
			<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			#prc.message#
		</p>
	</cfif>

	<h1>#prc.targetProfile.display_name#'s profile</h1>

	<cfif getLoggedInUserId() == targetUserId>
		<a href="#event.buildLink(edit=true)#" class="btn btn-primary">Edit Profile</a>	
	</cfif>
	

</cfoutput>