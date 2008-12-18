/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 12/15/2008 3:25 PM
 */

using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Diagnostics;
using System.Web.Configuration;

namespace YatesMorrison.SiteSmith.Service
{
	/// <summary>
	/// TODO: Update this documentation -- Standard provider pattern implementation
	/// </summary>
	public static class ProviderManager<TProvider>
		where TProvider : ProviderBase
	{
		static TProvider s_Provider;
		static ProviderCollection<TProvider> s_Providers;

		static ProviderManager()
		{
			try
			{
				string providerName = typeof(TProvider).Name;
				ProviderConfigurationSection configuration =
                     ConfigurationManager.GetSection(providerName) as ProviderConfigurationSection;

				if (configuration == null)
					throw new ConfigurationErrorsException(string.Format("ConfigurationSection '{0}' is null", providerName));

				s_Providers = new ProviderCollection<TProvider>();

				ProvidersHelper.InstantiateProviders(
					configuration.Providers, s_Providers, typeof(TProvider));

				s_Providers.SetReadOnly();

				s_Provider = s_Providers[configuration.Default];

				if (s_Provider == null)
					throw new ConfigurationErrorsException("The default provider is null");
			}
			catch (Exception error)
			{
				Trace.TraceError(error.ToString());
				throw new ConfigurationErrorsException(error.Message, error);
			}
		}

		public static TProvider Provider
		{
			get { return s_Provider; }
		}

		public static ProviderCollection<TProvider> Providers
		{
			get { return s_Providers; }
		}
	}
}