<cfoutput>
	<form action="#event.buildLink(linkTo="page-types.webUser.update")#" method="post" class="form-horizontal">
		#renderForm(
			  formName         = "websiteUserProfile.edit"
			, context          = "website"
			, fieldLayout      = "formcontrols.layouts.editProfile"
			, validationResult = prc.validationResult
			, savedData        = prc.currentUser
		)#	
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-9 ">
				<button class="btn btn-primary">Save!</button>
			</div>
		</div>
	</form>
</cfoutput>