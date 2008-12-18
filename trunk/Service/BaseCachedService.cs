/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 12/18/2008 10:09 AM
 */

using System.Web;
using System.Diagnostics;
using System.Reflection;

namespace YatesMorrison.SiteSmith.Service
{
	public abstract class BaseCachedService<T>
		where T : new()
	{
		protected T Service
		{
			get { return m_Service; }
		}
		T m_Service = new T();

		protected V GetCachedValue<V>(string cacheKey)
		{
			object value = HttpContext.Current.Cache[cacheKey];
			if (value != null)
			{
				return (V)value;
			}
			else
			{
				return default(V);
			}
		}
		protected V GetCachedValue<V>(params object[] parameters)
		{
			string cacheKey = GetCacheKeyFromCallingMethod(parameters);
			return GetCachedValue<V>(cacheKey);
		}

		string GetCacheKeyFromCallingMethod(params object[] parameters)
		{
			var trace = new StackTrace();
			var frame = trace.GetFrame(1); // TODO: Make a test for this, make sure that's the right stack frame
			var method = frame.GetMethod();
			string cacheKey = method.Name;
			foreach (var param in parameters)
			{
				cacheKey += "_" + param.ToString();
			}
			return cacheKey;
		}
	}
}