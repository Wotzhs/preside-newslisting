<cfscript>
	body     = renderView();
	mainNav  = renderViewlet( "core.navigation.mainNavigation" );
	metaTags = renderView( "/general/_pageMetaForHtmlHead" );
	adminBar = renderView( "/general/_adminToolbar"        );

	event.include( "css-bootstrap" )
	     .include( "css-layout"    )
	     .include( "js-bootstrap"  )
	     .include( "js-jquery"     );
</cfscript>

<cfoutput><!DOCTYPE html>
<html>
	<head>
		#metaTags#

		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		#event.renderIncludes( "css" )#

		<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
	<body>
		<div class="container">
			<div class="header">
				<cfif len(trim(getLoggedInUserId()))>
					<ul class="nav nav-pills pull-right">
						<li><a href="#event.buildLink(linkTo='login.logout')#">Log out</a></li>
					</ul>
				<cfelse>
					<ul class="nav nav-pills pull-right">
						<li><a href="#event.buildLink(page='login')#">Log in</a></li>
					</ul>
				</cfif>
				<ul class="nav nav-pills pull-right">
					#mainNav#
				</ul>
				<h3 class="text-muted"><a href="/">Preside News</a></h3>
			</div>

			#body#

			<div class="footer">
				<p>&copy; Preside News #Year( Now() )#</p>
			</div>
		</div>

		#adminBar#

		#event.renderIncludes( "js" )#
	</body>
</html></cfoutput>