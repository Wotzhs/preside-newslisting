<cfscript>
	param name="args.control"  type="string";
	param name="args.label"    type="string";
	param name="args.help"     type="string";
	param name="args.for"      type="string";
	param name="args.error"    type="string" default="";
	param name="args.required" type="boolean";

	hasError = Len( Trim( args.error ) );
</cfscript>

<cfoutput>
	<div class="form-group<cfif hasError> has-error</cfif>">
		<div class="col-sm-3 col-md-3 col-lg-3">
			<label for="#args.for#" class="control-label">
				#args.label#
			</label>
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9" class="form-control">
			#args.control#
			<cfif hasError>
				<div for="#args.for#" class="help-block">#args.error#</div>
			</cfif>
			<cfif Len( Trim( args.help ) )>
				<div class="col-sm-1">
					<span class="help-button fa fa-question" data-rel="popover" data-trigger="hover" data-placement="left" data-content="#HtmlEditFormat( args.help )#" title="#translateResource( 'cms:help.popover.title' )#"></span>
				</div>
			</cfif>
		</div>	
	</div>	
</cfoutput>
