/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 4/5/2008 1:29:09 PM
 */

using System.Web;
using System.Web.Services;
using System;
using System.Linq;
using System.Collections.Generic;
using YatesMorrison.SiteSmith.Data;
using System.IO;
using System.Configuration;

namespace YatesMorrison.SiteSmith.Web
{
	/// <summary>
	/// Retrieves an image based on it's ID and requested size
	/// </summary>
	[WebService(Namespace = "http://yatesmorrison.com/SiteSmith/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	public class Image : IHttpHandler
	{
		public bool IsReusable { get { return true; } }

		public void ProcessRequest(HttpContext context)
		{
			// Retrieve the record
			Guid mediaId = new Guid(context.Request.QueryString["Id"]);
			ImageSize size = (ImageSize)int.Parse(context.Request.QueryString["Size"]);

			string fileExt = "";

			using (SiteSmithDataContext context = new SiteSmithDataContext())
			{
				var media = context.Medias.Single(m => m.MediaId == mediaId);
				fileExt = media.FileExtension;
			}

			// Build the correct file path
			string folder = size.ToString();
			string path = string.Format(@"{0}\{1}\{2}.{3}",
				ConfigurationManager.AppSettings["MediaPath"],
				folder,
				mediaId.ToString(),
				fileExt);

			// Resize the image from the original if it doesn't exist
			if (!File.Exists(path) && size != ImageSize.Original)
			{

			}

			context.Response.ContentType = MimeTypes[Path.GetExtension(fileExt)];

		}

		readonly Dictionary<string, string> MimeTypes = new Dictionary<string, string>()
		{
			{ "gif", "image/gif" },
			{ "jpg", "image/jpeg" },
			{ "jpeg", "image/jpeg" },
			{ "png", "image/png" }
		};
	}

	public enum ImageSize
	{
		Thumbnail,
		Original,
		Small,
		Medium,
		Large
	}
}