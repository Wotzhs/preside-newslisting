<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />
<cf_presideparam name="args.date_published" editable="true" />

<cfparam name="form.comment" default="" />
<cfparam name="form.page" default="" />


<cfoutput>
	<p>
		<span>This post is tagged under:</span>&ensp;
		<cfloop query=args.labels>
			<span class="btn btn-danger btn-xs"><i class="fa fa-tag"></i> #label#</span>
		</cfloop>
	</p>
	

	<h1>#args.title#</h1>
	#args.main_content#

	<br><br>
	<hr>
	<h1>What other says</h1>
	<cfif args.comments.recordCount>
		<cfloop query=args.comments>
			<blockquote>
				<p>#comment#</p>
				<footer>- said <a href="#event.buildLink(profileId=id)#">#display_name#</a> on <cite>#dateFormat( datecreated, "dd/mm/yyyy" )#</cite></footer>
			</blockquote>
		</cfloop>
	<cfelse>
		<p>No one commented on this yet, be the first one to say something!</p>	
	</cfif>
	
	<cfif isLoggedIn() || isAutoLoggedIn()>
		<form action="#event.buildLink(linkTo="comment.addComment")#" method="post">
			<div class="form-group">
				<textarea class="form-control" placeholder="What do you think?" name="comment"></textarea>
			</div>
			<input type="hidden" name="page" value="#event.getCurrentPageId()#">
			<input class="btn btn-primary" type="submit" value="comment">
		</form>	
	<cfelse>
		
			<div class="form-group">
				<textarea class="form-control" placeholder="What do you think?" name="comment" disabled="true"></textarea>
			</div>
			<a href="#event.buildLink(page='login')#" class="btn btn-primary">Sign in to comment!</a>
		
	</cfif>
	
</cfoutput>