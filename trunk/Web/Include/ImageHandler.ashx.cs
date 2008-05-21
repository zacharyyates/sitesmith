/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 4/5/2008 1:29:09 PM
 */

using System;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

using YatesMorrison.SiteSmith.Data;
using YatesMorrison.SiteSmith.Service;

namespace YatesMorrison.SiteSmith.Web
{
	/// <summary>
	/// Retrieves an image based on it's ID and requested size
	/// </summary>
	[WebService(Namespace = "http://yatesmorrison.com/SiteSmith/ImageHandler")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	public class ImageHandler : IHttpHandler
	{
		public bool IsReusable { get { return true; } }

		public void ProcessRequest(HttpContext httpContext)
		{
			// Retrieve the record
			Guid mediaId = new Guid(httpContext.Request.QueryString["Id"]);
			ImageSize size = (ImageSize)int.Parse(httpContext.Request.QueryString["Size"]);

			string fileExt = "";

			using (SiteSmithDataContext dataContext = new SiteSmithDataContext())
			{
				var media = dataContext.Medias.Single(m => m.MediaId == mediaId);
				fileExt = media.Extension;
			}

			// Build the correct file path
			string originalPath = httpContext.Server.MapPath(BuildPath(mediaId, ImageSize.Original, fileExt));
			string targetPath = httpContext.Server.MapPath(BuildPath(mediaId, size, fileExt));
			
			// Ensure the original image exists
			if (File.Exists(originalPath))
			{
				if (size != ImageSize.Original)
				{
					Size targetSize = GetSizeFromConfiguration(size);

					if (File.Exists(targetPath))
					{
						// Load the image into memory and make sure the dimensions are correct
						Bitmap existingImage = Bitmap.FromFile(targetPath) as Bitmap;

						if (existingImage.Width != targetSize.Width ||
							existingImage.Height != targetSize.Height)
						{
							existingImage.Dispose();
							existingImage = null;
							// The dimensions are not correct, overwrite it with a resized image
							new MediaService().Resize(originalPath, targetPath, targetSize.Width, targetSize.Height);
						}
					}
					else
					{
						// No image! Create a new resized version
						new MediaService().Resize(originalPath, targetPath, targetSize.Width, targetSize.Height);
					}
				}
			}
			else
			{
				throw new FileNotFoundException("Could not find: " + originalPath);
			}

			// Should have all the files, write to the OutputStream
			httpContext.Response.ContentType = GetMimeType(Path.GetExtension(fileExt));
			httpContext.Response.WriteFile(targetPath);
			httpContext.Response.Flush();
		}

		#region Helper Methods

		Size GetSizeFromConfiguration(ImageSize size)
		{
			// TODO: Add error hanlding for the config entry
			string configSize = ConfigurationManager.AppSettings[size.ToString() + "ImageSize"];
			string[] dimensions = configSize.Split('x');
			int width = int.Parse(dimensions[0]);
			int height = int.Parse(dimensions[1]);
			return new Size(width, height);
		}

		static string BuildPath(Guid mediaId, ImageSize size, string fileExt)
		{
			// Should produce MediaPath/ImageSize/Guid.FileExt
			string path = string.Format(@"{0}/{1}/{2}.{3}",
				ConfigurationManager.AppSettings["MediaPath"],
				size.ToString(), 
				mediaId.ToString(),
				fileExt);
			return path;
		}

		static string GetMimeType(string fileExt)
		{
			switch (fileExt.ToLowerInvariant())
			{
				default:
				case "bmp":
					return "image/bmp";

				case "gif": return "image/gif";
				
				case "jpg":
				case "jpeg":
					return "image/jpeg";

				case "png": return "image/png";
			}
		}

		#endregion
	}

	public enum ImageSize
	{
		Original = 1,
		Thumbnail = 2,
		Small = 3,
		Medium = 4,
		Large = 5
	}
}