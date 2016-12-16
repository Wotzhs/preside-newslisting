<cfoutput>
	<cfloop query="#prc.data#">
		<a href="#'news/'&slug&'.html'#">
			<div class="col-sm-6 col-md-6">
				<div class="thumbnail">
					<img src="">
					<div class="caption">
						<h3>#title#</h3>
						<p>#teaser#</p>
						<p>Published date: #dateFormat( date_published, 'dd mmm yyyy' )#</p>
						<cfloop query=#prc.labels[id]#>
							<span class="btn btn-danger btn-xs">#label#</span>
						</cfloop>
					</div>
				</div>
			</div>
		</a>
	</cfloop>
</cfoutput>