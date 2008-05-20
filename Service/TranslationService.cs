/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 5/20/2008 11:12:49 AM
 * Adapted From: http://www.codeproject.com/KB/cpp/translation.aspx
 * Original Author: Matthew Brealey, UK
 */

using System;
using System.IO;
using System.Net;
using System.Security;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace YatesMorrison.SiteSmith.Service
{
	public enum TranslationMode
	{
		en_zh,
		en_fr,
		en_de,
		en_it,
		en_ja,
		en_ko,
		en_pt,
		en_es,
		zh_en,
		fr_en,
		fr_de,
		de_en,
		de_fr,
		it_en,
		ja_en,
		ko_en,
		pt_en,
		ru_en,
		es_en
	}

	public interface ITranslationService
	{
		string Translate( TranslationMode mode, string text );
	}

	public class BabelFishTranslationService : ITranslationService
	{
		const string BABELFISHURL = "http://babelfish.yahoo.com/translate_txt";
		const string BABELFISHREFERER = "http://babelfish.yahoo.com/";
		const string REGEXMATCH = @"<div id=\""result\""><div style=\""padding:0.6em;\"">((?:.|\n)*?)</div></div>";

		public string Translate( TranslationMode mode, string text )
		{
			try
			{
				// validate and remove trailing spaces
				if (string.IsNullOrEmpty(text)) throw new ArgumentNullException("text");
				text = text.Trim();

				Uri uri = new Uri(BABELFISHURL);
				HttpWebRequest request = (HttpWebRequest)WebRequest.Create(uri);
				request.Referer = BABELFISHREFERER;

				// Encode the text to be translated
				string postsourcedata = string.Format(
					"lp={0}&tt=urltext&intl=1&doit=done&urltext={1}",
					mode.ToString(), HttpUtility.UrlEncode(text));

				request.Method = "POST";
				request.ContentType = "application/x-www-form-urlencoded";
				request.ContentLength = postsourcedata.Length;
				request.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)";

				using (Stream writeStream = request.GetRequestStream())
				{
					byte[] bytes = Encoding.UTF8.GetBytes(postsourcedata);
					writeStream.Write(bytes, 0, bytes.Length);
					writeStream.Close();
				}

				HttpWebResponse response = (HttpWebResponse)request.GetResponse();
				StreamReader readStream = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
				string page = readStream.ReadToEnd();

				Regex reg = new Regex(REGEXMATCH, RegexOptions.IgnoreCase);
				MatchCollection matches = reg.Matches(page);
				if (matches.Count != 1 || matches[0].Groups.Count != 2)
				{
					throw new InvalidOperationException(
						"The HTML returned from Babelfish appears to have changed. Please check for an updated regular expression.");
				}

				return matches[0].Groups[1].Value;
			}
			// Exceptions
			catch (ArgumentNullException ex)
			{
				throw new Exception("Could not translate using Babelfish.", ex);
			}
			catch (ArgumentException ex)
			{
				throw new Exception("Could not translate using Babelfish.", ex);
			}
			catch (WebException ex)
			{
				throw new Exception("There was a problem connecting to the Babelfish server.", ex);
			}
			catch (SecurityException ex)
			{
				throw new Exception("You do not have permission to make HTTP connections. Please check your assembly's permission settings.", ex);
			}
			catch (Exception ex)
			{
				throw new Exception("Could not translate using Babelfish.", ex);
			}
		}
	}
}