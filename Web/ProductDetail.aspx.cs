/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 5/21/2008 3:13:16 PM
 */

using System;
using System.Web.UI;
using System.Linq;

using YatesMorrison.SiteSmith.Data;

namespace YatesMorrison.SiteSmith.Web
{
	public partial class ProductDetail : Page
	{
		protected Product Product { get; set; }

		protected void Page_Load( object sender, EventArgs e )
		{
			if (!IsPostBack) { BindData(); }
		}

		void BindData()
		{
			string productId = Request.QueryString["id"];
			if (!string.IsNullOrEmpty(productId))
			{
				using (SiteSmithDataContext context = new SiteSmithDataContext())
				{
					Product = context.Products.FirstOrDefault(p =>
						p.Id == new Guid(productId));
				}
			}
			else
			{
				// TODO: Send to error page
			}
		}
	}
}
