/**
 * @dataManagerGroup News 
 */

component {
	property name="description" type="string" dbtype="text" required=false;
	property name="news" relationship="many-to-many" relatedTo="news_detail" required=false;

}