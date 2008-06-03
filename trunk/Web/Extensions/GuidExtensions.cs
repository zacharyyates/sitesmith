/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 6/2/2008 7:51:09 PM
 */

using System;
namespace YatesMorrison.SiteSmith
{
	public static class GuidExtensions
	{
		public static bool TryParse( string s, out Guid result )
		{
			try
			{
				result = new Guid(s);
				return true;
			}
			catch( Exception ex )
			{
				result = Guid.Empty;
				return false;
			}
		}
		public static bool TryParse( string s, out Guid? result )
		{
			try
			{
				result = new Guid(s);
				return true;
			}
			catch( Exception ex )
			{
				result = null;
				return false;
			}
		}
	}
}