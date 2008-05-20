/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 5/20/2008 3:05:09 PM
 */

using System.Web.UI;
using YatesMorrison.SiteSmith.Service;

namespace YatesMorrison.SiteSmith.Web
{
	public static class PageExtensions
	{
		public static string GetSetting( this Page me, string name )
		{
			return SettingService.GetSetting(name);
		}
		public static string GetSetting( this Page me, string name, string language )
		{
			return SettingService.GetSetting(name, language);
		}
	}

	public static class MasterPageExtensions
	{
		public static string GetSetting( this MasterPage me, string name )
		{
			return SettingService.GetSetting(name);
		}
		public static string GetSetting( this MasterPage me, string name, string language )
		{
			return SettingService.GetSetting(name, language);
		}
	}
}