/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 12/15/2008 3:25 PM
 */

using System.Configuration.Provider;

namespace YatesMorrison.SiteSmith.Service
{
	/// <summary>
	/// Returns the strongly typed collection of <see cref="ProviderBase"/> objects registered
	/// </summary>
	/// <seealso cref="ECastServiceProviderManager"/>
	public class ProviderCollection<TProvider> : ProviderCollection
		where TProvider : ProviderBase
	{
		new public TProvider this[string name]
		{
			get { return base[name] as TProvider; }
		}
	}
}