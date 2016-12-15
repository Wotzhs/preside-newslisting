/**
 * @allowedParentPageTypes news_listing
 * @allowedChildPageTypes  none
 * @showInSitetree         false
 * @sitetreeGridFields     page.title,datecreated,datemodified
 */

component  {
	property name="date_published" type="date" dbtype="date" required=true;
	property name="category" relationship="many-to-many" relatedTo="news_category" required=false;

}