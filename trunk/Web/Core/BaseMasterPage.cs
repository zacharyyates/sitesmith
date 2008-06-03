/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 5/20/2008 2:59:09 PM
 */

using System.Web.UI;
using System;

namespace YatesMorrison.SiteSmith.Web
{
	/// <summary>
	/// The base class for any SiteSmith MasterPage
	/// </summary>
	public class BaseMasterPage : MasterPage
	{
		// TODO: Add any cross-page methods/properties here
		protected override void OnLoad( EventArgs e )
		{
			if( !IsPostBack ) { DataBind(); }
			base.OnLoad(e);
		}
	}
}