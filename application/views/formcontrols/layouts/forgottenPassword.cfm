<cfscript>
	param name="args.control"  type="string";
	param name="args.label"    type="string";
	param name="args.help"     type="string";
	param name="args.for"      type="string";
	param name="args.required" type="boolean";

	hasError = Len( Trim( args.error ?: "" ) );
</cfscript>

<cfoutput>
	<div class="form-group<cfif hasError> has-error</cfif>">
			<label class="col-sm-1 control-label">#args.label#</label>
			<div class="col-sm-11">
				#args.control#
			</div>
			<cfif hasError>
				<div for="#args.for#" class="help-block">#args.error#</div>
			</cfif>
		<cfif Len( Trim( args.help ) )>
			<div class="col-sm-1">
				<span class="help-button fa fa-question" data-rel="popover" data-trigger="hover" data-placement="left" data-content="#HtmlEditFormat( args.help )#" title="#translateResource( 'cms:help.popover.title' )#"></span>
			</div>
		</cfif>
	</div>
</cfoutput>
