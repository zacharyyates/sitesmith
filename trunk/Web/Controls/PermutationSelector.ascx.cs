/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 6/2/2008 6:50:16 PM
 */

using System.Linq;
using System.Web.UI.WebControls;

using YatesMorrison.SiteSmith.Data;
using System;

namespace YatesMorrison.SiteSmith.Web.Controls
{
	public partial class PermutationSelector : BaseUserControl<Product>
	{
		protected void Page_DataBinding( object sender, EventArgs e )
		{
			// Retrieve the Distinct ProductAttribute.Name values for this product
			using( SiteSmithDataContext context = new SiteSmithDataContext() )
			{
				var attributeNames =
					( from p in context.Products
					  from pp in p.ProductPermutations
					  from pa in pp.ProductAttributes
					  where p.ProductId == DataItem.ProductId
					  select pa.Name )
					.Distinct();
				int count = attributeNames.Count();

				// Build a drop down list for each name
				foreach( string name in attributeNames )
				{
					// Get the values for this list
					var attributeValues =
						( from p in context.Products
						  from pp in p.ProductPermutations
						  from pa in pp.ProductAttributes
						  where
						   p.ProductId == DataItem.ProductId &&
						   pa.Name == name
						  select pa.Value )
						.Distinct();

					DropDownList ddl = new DropDownList();
					ddl.ID = "ddl" + name;
					ddl.DataSource = attributeValues;
					ddl.DataBind();

					dDropDowns.Controls.Add(ddl);
				}
			}
		}
	}
}