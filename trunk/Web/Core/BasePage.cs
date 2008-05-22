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
				if (!string.IsNullOrEmpty(Request.QueryString["id"]))
					return new Guid(Request.QueryString["id"]);
				else
					return null;
			}
		}

		protected override void OnLoad( EventArgs e )
		{
			if (!IsPostBack) { BindData(); }
			base.OnLoad(e);
		}

		protected virtual void BindData() { }
	}
}