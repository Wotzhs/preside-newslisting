component extends="application.extensions.preside-ext-resource-library.services.ResourceLibraryService" {
	public array function listResourceTypes() output=false {
		return  [ "page", "asset", "resource_library_external_link", "article", "video" ];
	}
}