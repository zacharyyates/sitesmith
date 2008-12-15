/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 12/15/2008 3:26 PM
 */

using System.Configuration;

namespace YatesMorrison.SiteSmith.Service
{
	/// <summary>
	/// Custom configuration section for the generic provider
	/// </summary>
	/// <seealso cref="ECastServiceProviderManager"/>
	public class ProviderConfigurationSection : ConfigurationSection
	{
		[ConfigurationProperty("providers")]
		public ProviderSettingsCollection Providers
		{
			get { return (ProviderSettingsCollection)base["providers"]; }
		}

		[ConfigurationProperty("default", DefaultValue = "CachedProvider")]
		public string Default
		{
			get { return (string)base["default"]; }
			set { base["default"] = value; }
		}
	}
}