/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 5/20/2008 2:34:13 PM
 */

using System;
using System.Configuration;
using System.Linq;
using System.Threading;

using YatesMorrison.SiteSmith.Data;

namespace YatesMorrison.SiteSmith.Service
{
	public static class SettingService
	{
		public static string GetSetting( string name )
		{
			return GetSetting(name, Thread.CurrentThread.CurrentUICulture.Name);
		}
		public static string GetSetting( string name, string language )
		{
			using (SiteSmithDataContext context = new SiteSmithDataContext())
			{
				Setting setting = context.Settings.FirstOrDefault(s =>
					s.Name.ToLower() == name.ToLower() &&
					s.Language.ToLower() == language.ToLower());

				if (setting != null)
				{
					return setting.Value;
				}
				else // TODO: throwing an exception may be a little extreme. Maybe change it to a trace log error
				{
					if (Convert.ToBoolean(ConfigurationManager.AppSettings["AutoTranslate"]))
					{
						// TODO: Abstract this to use the ITranslationService interface
						BabelFishTranslationService translator = new BabelFishTranslationService();
						
						foreach (Setting s in context.Settings.Where(s =>
												s.Name.ToLower() == name.ToLower()))
						{
							// Translate the first entry that can be translated
							if (translator.CanTranslate(s.Language, language) && 
								s.AutoTranslate.HasValue &&
								s.AutoTranslate.Value == true)
							{
								return translator.Translate(s.Language, language, s.Value);
							}
						}
						// Else, fall through and throw the exception
					}

					throw new InvalidOperationException(
						string.Format("Setting {0} for language {1} not found.", name, language));
				}
			}
		}
	}
}