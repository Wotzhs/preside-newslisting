component implements="preside.system.services.routeHandlers.iRouteHandler" output=false singleton=true {
	public boolean function match ( required string path, required any event ) output=false{
		return ( 
			   ReFindNoCase( '^/profile/id/.*?/' , path ) 
			or ReFindNoCase( '^/profile/edit/$'  , path ) 
		)
	}

	public void function translate( required string path, required any event ) output=false{
		var rc  = event.getCollection();
		var prc = event.getCollection( private=true);
		var action = mapPathToAction( path );

		switch( action ) {
			case ( "SHOW" ):
				prc.profileId = ReReplace( path, '^/profile/id/(.*?)/', '\1');
				rc.event      = 'page-types.webUser.show';
				break;
			case ( "EDIT" ):
				rc.event      = 'page-types.webUser.edit';
				break;
		} 

	}

	public boolean function reverseMatch( required struct buildArgs, required any event ) output=false{
		return (
			   Len( Trim( buildArgs.profileId ?: "" ) )
			or Len( Trim( buildArgs.edit      ?: "" ) )
		)
	}

	public string function build( required struct buildArgs, required any event ) output=false{
		if ( structKeyExists(buildArgs , "edit") ){ return '/profile/edit'; }
		return '/profile/id/#buildArgs.profileId#';
	}

	private string function mapPathToAction( path ) {
		if ( ReFindNoCase( '^/profile/id/.*?', path ) ) { return 'SHOW' };
		if ( ReFindNoCase( '^/profile/edit/$', path ) ) { return 'EDIT' };
	}
}