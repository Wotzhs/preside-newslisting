<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />

<cfoutput>
	<h1>#args.title#</h1>
	#args.main_content#
	<form action="#event.buildLink(linkTo="page-types.webUserProfileEditPage.update")#" method="post" class="form-horizontal">
		#renderForm(
			  formName         = "websiteUserProfile.edit"
			, context          = "website"
			, fieldLayout      = "formcontrols.layouts.editProfile"
			, validationResult = rc.validationResult
			, savedData        = args.currentUser
		)#	
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-9 ">
				<button class="btn btn-primary">Save!</button>
			</div>
		</div>
	</form>
	
</cfoutput>