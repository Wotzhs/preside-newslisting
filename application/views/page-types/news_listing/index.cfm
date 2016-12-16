<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />
<cf_presideparam name="args.posts_per_page" editable="true" />



<cfoutput>
	<h1>#args.title#</h1>
	#args.main_content#

	<div class="row" id="newslist">
		<cfloop query="#args.data#">
			<a href="#'news/'&slug&'.html'#">
				<div class="col-sm-6 col-md-6">
					<div class="thumbnail">
						<img src="">
						<div class="caption">
							<h3>#title#</h3>
							<p>#teaser#</p>
							<p>Published on: #dateFormat( date_published, 'dd mmm yyyy' )#</p>
							<cfloop query=#args.labels[id]#>
								<span class="btn btn-danger btn-xs"><i class="fa fa-tag"></i> #label#</span>
							</cfloop>
						</div>
					</div>
				</div>
			</a>
		</cfloop>
	</div>

	<input type="hidden" id="numberOfNews" value="#args.numberOfNews#">
</cfoutput>

<button class="btn btn-default" id="loadmore">Load More News!</button>

<!--- without sticker bundle --->
<!--- <script src='assets/js/specific/loadmore.js'></script> --->