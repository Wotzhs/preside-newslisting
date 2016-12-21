<cfscript>
	errorMessage = rc.errorMessage ?: "";
</cfscript>
<cfoutput>
	<cfif !isEmpty( errorMessage )>
		<p class="alert alert-danger alert-dismissable fade in">
			<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>			
			#errorMessage#
		</p>
	</cfif>
</cfoutput>