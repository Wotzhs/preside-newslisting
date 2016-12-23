<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />
<cf_presideparam name="args.posts_per_page" editable="true" />



<cfoutput>
	<h1>#args.title#</h1>
	#args.main_content#

	<div class="row">
		<form id="search">
			<div class="col-sm-offset-7 col-sm-5">
				<div class="input-group">	
					<input type="text" name="search" class="form-control" placeholder="&##xf002; Lookup for a news">
					<span class="input-group-btn">
				        <button class="btn btn-primary" type="button">Go!</button>
				      </span>
				</div>
			</div>
		</form>
	</div>
	<br>
	<div class="row" id="newslist">
		<cfloop query="#args.data#">
			<a href="#'news/'&slug&'.html'#">
				<div class="col-sm-6 col-md-6">
					<div class="thumbnail">
						<img src="#asset_url#" class="img-responsive">
						<div class="caption">
							<h3>#title#</h3>
							<p>#teaser#</p>
							<p>Published on: #dateFormat( date_published, 'dd mmm yyyy' )#</p>
							<cfloop list=#args.data.category_id# index="label">
								<span class="btn btn-danger btn-xs"><i class="fa fa-tag"></i> #label#</span>
							</cfloop>
							<p>Comments: #len(total_comment) ? total_comment : 0#</p>
						</div>
					</div>
				</div>
			</a>
		</cfloop>
	</div>

	<input type="hidden" id="numberOfNews" value="#args.numberOfNews#">

	<div class="row" id="searchResult"></div>
</cfoutput>

<button class="btn btn-default" id="loadmore">Load More News!</button>

<!--- without sticker bundle --->
<!--- <script src='assets/js/specific/loadmore.js'></script> --->