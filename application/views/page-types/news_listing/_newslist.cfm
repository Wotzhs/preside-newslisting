<cfoutput>
	<cfloop query="#prc.data#">
		<a href="#'news/'&slug&'.html'#">
			<div class="col-sm-6 col-md-6">
				<div class="thumbnail">
					<img src="#asset_url#" class="img-responsive">
					<div class="caption">
						<h3>#title#</h3>
						<p>#teaser#</p>
						<p>Published date: #dateFormat( date_published, 'dd mmm yyyy' )#</p>
						<cfloop list=#category_id# index="label">
							<span class="btn btn-danger btn-xs"><i class="fa fa-tag"></i> #label#</span>
						</cfloop>
						<p>Comments: #total_comment#</p>
					</div>
				</div>
			</div>
		</a>
	</cfloop>
</cfoutput>
