/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 4/4/2008 1:22:09 PM
 */

using System;
using System.Web.UI;

namespace YatesMorrison.SiteSmith.Web
{
	/// <summary>
	/// The base class for any SiteSmith Page
	/// </summary>
	public class BasePage : Page
	{
		// TODO: Add any cross-page methods/properties here
		protected Guid? ItemId
		{
			get
			{
				string itemIdStr = Request.QueryString["id"];
				if( !string.IsNullOrEmpty(itemIdStr) )
				{
					Guid? value = null;
					if( GuidExtensions.TryParse(itemIdStr, out value) )
						return value;
				}
				return null;
			}
		}

		protected override void OnLoad( EventArgs e )
		{
			if( !IsPostBack ) { DataBind(true); }
			base.OnLoad(e);
		}
	}
}