/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 6/2/2008 7:37:09 PM
 */

using System;

namespace YatesMorrison.SiteSmith.Web
{
	public class DetailPage<T> : BasePage
		where T : class
	{
		public T DataItem { get; set; }
	}
}