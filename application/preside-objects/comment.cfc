/**
 * @noLabel true 
 */ 

component  {
	property name="comment"  type="string" dbtype="text" required="true";
	property name="page"   relationship="many-to-one" required=true;
	property name="author" relationship="many-to-one" relatedTo="website_user" required=true; 
}