<!---
	This view file has been automatically created by the preside dev tools
	scaffolder. Please fill with meaningful content and remove this comment
--->

<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />
<cf_presideparam name="args.posts_per_page" editable="true" />


<cfoutput>
	<h1>#args.title#</h1>
	#args.main_content#
	<div class="newslist">
		<cfloop query="#args.data#">
			<div class="well">
				<div class="row">
					<h1 class="pull-left">
						<a href="#'news/'&slug&'.html'#">#title#</a>
					</h1>
					<p class="pull-right">published on: #dateFormat( date_published, 'dd-mm-yyyy' )#</p>
				</div>
				<p>#teaser#</p>
			</div>
		</cfloop>
	</div>

	<input type="hidden" id="numberOfNews" value="#args.numberOfNews#">
</cfoutput>

<button class="btn btn-default" id="loadmore">Load More News!</button>

<!--- without sticker bundle --->
<!--- <script src='assets/js/specific/loadmore.js'></script> --->