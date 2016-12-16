<!---
	This view file has been automatically created by the preside dev tools
	scaffolder. Please fill with meaningful content and remove this comment
--->

<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />
<cf_presideparam name="args.date_published" editable="true" />
<cfparam name="rc.label" default="" />

<cfparam name="form.comment" default="" />
<cfparam name="form.page" default="" />


<cfoutput>
	<!--- <ul class="nav nav-pills">
		<cfloop query=args.labels>
			<li class="active"><a href="">#label#</a></li>
		</cfloop>
	</ul> --->

	<cfloop query=args.labels>
		<span class="btn btn-danger">#label#</span>
	</cfloop>

	#rc.label#
	<h1>#args.title#</h1>
	#args.main_content#
	#event.getCurrentPageId()#
	<br><br>

	<cfloop query=args.comments>
		<div class="well">
			<h1>#comment#</h1>
			<p>said #display_name# on #dateFormat(datecreated, "dd/mm/yyyy")#</p>
		</div>
	</cfloop>

	<form action="#event.buildLink(linkTo="comment.addComment")#" method="post">
		<div class="form-group">
			<textarea class="form-control" placeholder="What do you think?" name="comment"></textarea>
		</div>
		<input type="hidden" name="page" value="#event.getCurrentPageId()#">
		<input class="btn btn-primary" type="submit">
	</form>
</cfoutput>