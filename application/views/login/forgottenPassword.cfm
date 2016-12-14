<cfoutput>
	<h1>Forgot Password</h1>
	<p>Enter your email below to receive a password reset instruction</p>
	<form class="form-horizontal">
		#renderForm(
				  formName         = "login.forgottenPassword"
				, context          = "website"
				, fieldLayout      = "formcontrols.layouts.forgottenPassword"
				, validationResult = rc.validationResult ?: ""
		)#
		<div class="form-group">
			<div class="col-sm-offset-1 col-sm-11">
				<input type="submit" name="" class="btn btn-primary">	
			</div>
		</div>
	</form>
</cfoutput>