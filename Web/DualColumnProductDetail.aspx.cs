/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 6/2/2008 7:57:09 PM
 */

using System;
using System.Linq;
using YatesMorrison.SiteSmith.Data;

namespace YatesMorrison.SiteSmith.Web
{
	public partial class DualColumnProductDetail : DetailPage<Product>
	{
		protected override void OnDataBinding( EventArgs e )
		{
			// Retrieve data item
			if( ItemId != null )
			{
				using( SiteSmithDataContext context = new SiteSmithDataContext() )
				{
					DataItem = context.Products.FirstOrDefault(p =>
						p.ProductId == ItemId);

					bpdcMain.DataItem = DataItem;
					bpdcMain.DataBind();
				}				
			}

			base.OnDataBinding(e);
		}
	}
}