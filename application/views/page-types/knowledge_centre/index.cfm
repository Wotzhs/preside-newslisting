<!---
	This view file has been automatically created by the preside dev tools
	scaffolder. Please fill with meaningful content and remove this comment
--->

<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />


<cfoutput>
	<h1>#args.title#</h1>
	#args.main_content#

	<cfloop query="args.searchResults">
		<h1>#title#</h1>
		<p>#teaser#</p>
	</cfloop>
</cfoutput>