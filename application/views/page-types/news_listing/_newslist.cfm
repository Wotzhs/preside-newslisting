<cfoutput>
	<cfloop query="#prc.data#">
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
</cfoutput>