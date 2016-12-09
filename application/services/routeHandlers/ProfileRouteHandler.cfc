component implements="preside.system.services.routeHandlers.iRouteHandler" output=false singleton=true {
	public boolean function match ( required string path, required any event ) output=false{
		return ReFindNoCase( '^/profile/id/.*?/' , path);
	}

	public void function translate( required string path, required any event ) output=false{
		var rc  = event.getCollection();
		var prc = event.getCollection( private=true);

		prc.profileId = ReReplace( arguments.path, '^/profile/id/(.*?)/', "\1");
		rc.event      = 'page-types.webUserShowPage.show';
	}

	public boolean function reverseMatch( required struct buildArgs, required any event ) output=false{
		return Len( Trim( buildArgs.profileId ?: "" ) ); 
	}

	public string function build( required struct buildArgs, required any event ) output=false{
		return '/profile/id/#buildArgs.profileId#';
	}
}