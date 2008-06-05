/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 6/2/2008 6:28:16 PM
 */

using System.Web.UI;

namespace YatesMorrison.SiteSmith.Web.Controls
{
	public class BaseUserControl<T> : UserControl
		where T : class
	{
		public T DataItem { get; set; }
	}
}