/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 5/20/2008 11:12:49 AM
 * Adapted From: http://www.codeproject.com/KB/cpp/translation.aspx
 * Original Author: Matthew Brealey, UK
 */

using System;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Security;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Collections.Generic;

namespace YatesMorrison.SiteSmith.Service
{
	//public enum TranslationMode
	//{
	//    en_zh,
	//    en_fr,
	//    en_de,
	//    en_it,
	//    en_ja,
	//    en_ko,
	//    en_pt,
	//    en_es,
	//    zh_en,
	//    fr_en,
	//    fr_de,
	//    de_en,
	//    de_fr,
	//    it_en,
	//    ja_en,
	//    ko_en,
	//    pt_en,
	//    ru_en,
	//    es_en
	//}

	public class TranslationMode
	{
		public string SourceLanguage { get; set; }
		public string TargetLanguage { get; set; }
	}

	public interface ITranslationService
	{
		string Translate( TranslationMode mode, string text );
		bool CanTranslate( TranslationMode mode );
	}

	public class BaseScreenScrapingTranslationService : ITranslationService
	{
		public virtual string Url { get; set; }
		public virtual string Referer { get; set; }
		public virtual string RegexMatch { get; set; }
		public virtual string Name
		{
			get { return "BaseScreenScraper"; }
		}

		public virtual string Translate( TranslationMode mode, string text )
		{
			try
			{
				// validate and remove trailing spaces
				if (string.IsNullOrEmpty(text)) throw new ArgumentNullException("text");
				text = text.Trim();

				Uri uri = new Uri(Url);
				HttpWebRequest request = (HttpWebRequest)WebRequest.Create(uri);
				request.Referer = Referer;

				// Encode the text to be translated
				string postSourceData = GetPostSourceData(mode, text);

				request.Method = "POST";
				request.ContentType = "application/x-www-form-urlencoded";
				request.ContentLength = postSourceData.Length;
				request.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)";

				using (Stream writeStream = request.GetRequestStream())
				{
					byte[] bytes = Encoding.UTF8.GetBytes(postSourceData);
					writeStream.Write(bytes, 0, bytes.Length);
					writeStream.Close();
				}

				HttpWebResponse response = (HttpWebResponse)request.GetResponse();
				StreamReader readStream = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
				string page = readStream.ReadToEnd();

				Regex reg = new Regex(RegexMatch, RegexOptions.IgnoreCase);
				MatchCollection matches = reg.Matches(page);
				if (matches.Count != 1 || matches[0].Groups.Count != 2)
				{
					throw new InvalidOperationException(
						"The HTML returned from " + Name + " appears to have changed. Please check for an updated regular expression.");
				}

				return matches[0].Groups[1].Value;
			}
			// Exceptions
			catch (ArgumentNullException ex) { throw GetStandardException(ex); }
			catch (ArgumentException ex) { throw GetStandardException(ex); }
			catch (Exception ex) { throw GetStandardException(ex); }
			catch (WebException ex)
			{
				throw new Exception("There was a problem connecting to the " + Name + " server.", ex);
			}
			catch (SecurityException ex)
			{
				throw new Exception("You do not have permission to make HTTP connections. Please check your assembly's permission settings.", ex);
			}
		}

		public virtual bool CanTranslate( TranslationMode mode )
		{
			return false;
		}

		protected virtual string GetPostSourceData( TranslationMode mode, string text )
		{
			return text;
		}

		protected Exception GetStandardException( Exception innerException )
		{
			return new Exception("Could not translate using " + Name + ".", innerException);
		}
	}

	public class BabelFishTranslationService : BaseScreenScrapingTranslationService
	{
		static readonly List<string> s_SupportedModes = { 
			"en_zh", "en_fr", "en_de", "en_it", "en_ja", "en_ko", "en_pt", "en_es", 
			"zh_en", "fr_en", "fr_de", "de_en", "de_fr", "it_en", "ja_en", "ko_en", 
			"pt_en", "ru_en", "es_en" };

		public override string Url
		{
			get{ return "http://babelfish.yahoo.com/translate_txt"; }
			set{ base.Url = value; }
		}
		public override string Referer
		{
			get { return "http://babelfish.yahoo.com/"; }
			set { base.Referer = value; }
		}
		public override string RegexMatch
		{
			get { return @"<div id=\""result\""><div style=\""padding:0.6em;\"">((?:.|\n)*?)</div></div>"; }
			set { base.RegexMatch = value; }
		}

		public override bool CanTranslate( TranslationMode mode )
		{
			BabelFishTranslationMode myMode = new BabelFishTranslationMode(mode);
			if (!s_SupportedModes.Contains(myMode.ToString()))
			{
				Trace.TraceWarning("TranslationMode is not supported.", ex);
				return false;
			}
			return true;
		}

		protected override string GetPostSourceData( TranslationMode mode, string text )
		{
			BabelFishTranslationMode myMode = new BabelFishTranslationMode(mode);
			return string.Format(
					"lp={0}&tt=urltext&intl=1&doit=done&urltext={1}",
					myMode.ToString(), HttpUtility.UrlEncode(text));
		}

		private class BabelFishTranslationMode : TranslationMode
		{
			public BabelFishTranslationMode( TranslationMode mode )
			{
				SourceLanguage = mode.SourceLanguage;
				TargetLanguage = mode.TargetLanguage;
			}

			public override string ToString()
			{
				return SourceLanguage.Substring(0, 2) + "_" + TargetLanguage.Substring(0, 2);
			}
		}
	}

	public class GoogleTranslationService : BaseScreenScrapingTranslationService
	{
		static readonly List<string> s_SourceLanguages = { 
			"auto", "ar", "bg", "zh-CN", "hr", "cs", "da", "nl", "en", 
			"fi", "fr", "de", "el", "hi", "it", "ja", "ko", 
			"no", "pl", "pt", "ro", "ru", "es", "sv" };

		static readonly List<string> s_TargetLanguages = { 
			"ar", "bg", "zh-CN", "zh-TW", "hr", "cs", "da", "nl", "en", 
			"fi", "fr", "de", "el", "hi", "it", "ja", "ko", 
			"no", "pl", "pt", "ro", "ru", "es", "sv" };

		public override string Url
		{
			get { return "http://translate.google.com/translate_t"; }
			set { base.Url = value; }
		}
		public override string Referer
		{
			get { return "http://translate.google.com/"; }
			set { base.Referer = value; }
		}
		public override string RegexMatch
		{
			get { return @"<div id=\""result_box\"" dir=\""ltr\"">((?:.|\n)*?)</div>"; }
			set { base.RegexMatch = value; }
		}

		public override bool CanTranslate( TranslationMode mode )
		{
			Predicate<string> sourceStartsWith = 
				delegate( string item )
				{
					return mode.SourceLanguage.StartsWith(item);
				};
			bool sourceFound = s_SourceLanguages.FindAll(sourceStartsWith).Count > 0;

			Predicate<string> targetStartsWith =
				delegate( string item )
				{
					return mode.TargetLanguage.StartsWith(item);
				};
			bool targetFound = s_TargetLanguages.FindAll(targetStartsWith).Count > 0;

			return sourceFound && targetFound;
		}
	}
}