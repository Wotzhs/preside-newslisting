<cfscript>
	param name="prc.searchResult";
	var a = prc.searchResult.getResults();
	dump(a)

</cfscript>

<cfoutput>
	<h1>This is search result</h1>
	<cfloop query="a">
		<div class="well">
			<h1>#title#</h1>
		</div>	
	</cfloop>
	
</cfoutput>